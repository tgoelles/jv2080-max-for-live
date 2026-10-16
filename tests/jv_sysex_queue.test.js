// Run: node tests/jv_sysex_queue.test.js  (mocks the Max js globals)
const fs=require('fs'),vm=require('vm');
let now=0,timers=[],out=[];
const ctx={inlet:0,outlet:(i,b)=>out.push([now,b]),setinletassist(){},setoutletassist(){},
  arrayfromargs:a=>Array.from(a),
  Task:function(fn){this.schedule=ms=>timers.push([now+ms,fn]);this.cancel=()=>{};this.freepeer=()=>{};}};
vm.createContext(ctx); vm.runInContext(fs.readFileSync(require("path").join(__dirname,"../device/jv_sysex_queue.js"),'utf8'),ctx);
const dt1=(a,v)=>{const s=(128-(a.reduce((x,y)=>x+y,0)+v)%128)%128;return[0xF0,0x41,0x10,0x6A,0x12,...a,v,s,0xF7]};
const send=m=>{ctx.inlet=1;m.forEach(b=>ctx.msg_int(b));};
const run=()=>{while(timers.length){timers.sort((a,b)=>a[0]-b[0]);const[t,f]=timers.shift();now=t;f();}};
// 1. burst of 200 distinct messages
for(let i=0;i<200;i++) send(dt1([3,0,16,i%128],i%100+ (i>=128?0:0)));
// distinct keys: offsets 0..127 at tone 16 -> 128 unique; the 72 repeats coalesce
run();
const starts=out.filter(([t,b])=>b===0xF0).map(([t])=>t);
const gaps=starts.slice(1).map((t,i)=>t-starts[i]);
console.log('messages sent',starts.length,'min gap',Math.min(...gaps),'total ms',starts.at(-1));
// 2. coalescing: knob sweep on one address while busy
out=[];now=0;
send(dt1([3,0,16,81],0)); for(let v=1;v<=127;v++) send(dt1([3,0,16,81],v)); run();
const msgs=[];let cur=[];out.forEach(([t,b])=>{cur.push(b);if(b===0xF7){msgs.push(cur);cur=[];}});
console.log('sweep -> sent',msgs.length,'last value',msgs.at(-1)[9]);
// 3. passthrough is immediate while queue busy
out=[];now=0; send(dt1([3,0,16,1],1)); send(dt1([3,0,16,2],2)); ctx.inlet=0; ctx.msg_int(0x90);
console.log('note byte position',out.findIndex(([t,b])=>b===0x90),'of',out.length,'(should come after msg1, before msg2)'); run();
