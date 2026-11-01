{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 1400.0, 700.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1500.0, 1000.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 350.0, 24.0, 40.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "PerfTempo",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Tempo",
							"parameter_shortname" : "tempo",
							"parameter_type" : 1,
							"parameter_mmin" : 20.0,
							"parameter_mmax" : 250.0,
							"parameter_initial" : [ 120 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-192",
					"annotation" : "Performance tempo, for synced LFOs, EFX and tone delay when the clock source is PERFORMANCE. (JV-2080 manual p.110)"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1450.0, 1024.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 24.0, 96.0, 15.0 ],
					"varname" : "PerfClockSource",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Clock Source",
							"parameter_shortname" : "clock",
							"parameter_type" : 2,
							"parameter_enum" : [ "PERFORMANCE", "SYSTEM" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-190",
					"annotation" : "Clock for synced LFOs, EFX and tone delay. PERFORMANCE: the performance tempo. SYSTEM: the system tempo or MIDI clock. (JV-2080 manual p.110)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1400.0, 922.0, 120.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 200.0, 22.0, 50.0, 18.0 ],
					"text" : "tempo",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-189"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1208.0, 1008.0, 120.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 108.0, 414.0, 18.0 ],
					"text" : "EFX-B and EFX-C always take a part's patch EFX.",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-188"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1208.0, 992.0, 120.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 92.0, 414.0, 18.0 ],
					"text" : "PERFORM: the EFX on the right. A part number: that part's patch EFX.",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-187"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1254.0, 1068.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 68.0, 80.0, 15.0 ],
					"varname" : "EFXCSource",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX-C Source",
							"parameter_shortname" : "EFX-C",
							"parameter_type" : 2,
							"parameter_enum" : [ "PERFORM", "1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "14", "15", "16" ],
							"parameter_mmax" : 15,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-185",
					"annotation" : "EFX-C uses the patch EFX of this part. (JV-2080 manual p.28)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1208.0, 966.0, 120.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 66.0, 44.0, 18.0 ],
					"text" : "EFX-C",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-184"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1254.0, 1046.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 46.0, 80.0, 15.0 ],
					"varname" : "EFXBSource",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX-B Source",
							"parameter_shortname" : "EFX-B",
							"parameter_type" : 2,
							"parameter_enum" : [ "PERFORM", "1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "14", "15", "16" ],
							"parameter_mmax" : 15,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-182",
					"annotation" : "EFX-B uses the patch EFX of this part. (JV-2080 manual p.28)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1208.0, 944.0, 120.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 44.0, 44.0, 18.0 ],
					"text" : "EFX-B",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-181"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1254.0, 1024.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 24.0, 80.0, 15.0 ],
					"varname" : "EFXASource",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX-A Source",
							"parameter_shortname" : "EFX-A",
							"parameter_type" : 2,
							"parameter_enum" : [ "PERFORM", "1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "14", "15", "16" ],
							"parameter_mmax" : 15,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-179",
					"annotation" : "Where EFX-A's settings come from: PERFORM (these) or the patch EFX of a part. (JV-2080 manual p.28)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1208.0, 922.0, 120.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 22.0, 44.0, 18.0 ],
					"text" : "EFX-A",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-178"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1200.0, 900.0, 120.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 430.0, 18.0 ],
					"text" : "EFX sources",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-177"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1670.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 703.0, 107.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue12",
					"id" : "obj-173"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1600.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 649.0, 107.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue11",
					"id" : "obj-171"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1530.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 595.0, 107.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue10",
					"id" : "obj-169"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1460.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 541.0, 107.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue9",
					"id" : "obj-167"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1390.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 487.0, 107.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue8",
					"id" : "obj-165"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1320.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 433.0, 107.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue7",
					"id" : "obj-163"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1250.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 703.0, 55.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue6",
					"id" : "obj-161"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1180.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 649.0, 55.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue5",
					"id" : "obj-159"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1110.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 595.0, 55.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue4",
					"id" : "obj-157"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1040.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 541.0, 55.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue3",
					"id" : "obj-155"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 970.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 487.0, 55.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue2",
					"id" : "obj-153"
				}

			}
, 			{
				"box" : 				{
					"ignoreclick" : 1,
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 660.0, 60.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 433.0, 55.0, 56.0, 16.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 1,
					"varname" : "EFXValue1",
					"id" : "obj-151"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0 ],
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1633.0, 20.0, 330.0, 163.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 433.0, 0.0, 330.0, 163.0 ],
					"proportion" : 0.5,
					"id" : "obj-63"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1637.0, 301.0, 30.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 437.0, 1.0, 30.0, 18.0 ],
					"text" : "EFX",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-64"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2420.0, 600.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 467.0, 3.0, 170.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Type",
							"parameter_shortname" : "EFX",
							"parameter_type" : 2,
							"parameter_enum" : [ "1 STEREO-EQ", "2 OVERDRIVE", "3 DISTORTION", "4 PHASER", "5 SPECTRUM", "6 ENHANCER", "7 AUTO-WAH", "8 ROTARY", "9 COMPRESSOR", "10 LIMITER", "11 HEXA-CHORUS", "12 TREMOLO-CHORUS", "13 SPACE-D", "14 STEREO-CHORUS", "15 STEREO-FLANGER", "16 STEP-FLANGER", "17 STEREO-DELAY", "18 MODULATION-DELAY", "19 TRIPLE-TAP-DELAY", "20 QUADRUPLE-TAP-DELAY", "21 TIME-CONTROL-DELAY", "22 2VOICE-PITCH-SHIFTER", "23 FBK-PITCH-SHIFTER", "24 REVERB", "25 GATE-REVERB", "26 OVERDRIVE>CHORUS", "27 OVERDRIVE>FLANGER", "28 OVERDRIVE>DELAY", "29 DISTORTION>CHORUS", "30 DISTORTION>FLANGER", "31 DISTORTION>DELAY", "32 ENHANCER>CHORUS", "33 ENHANCER>FLANGER", "34 ENHANCER>DELAY", "35 CHORUS>DELAY", "36 FLANGER>DELAY", "37 CHORUS>FLANGER", "38 CHORUS/DELAY", "39 FLANGER/DELAY", "40 CHORUS/FLANGER" ],
							"parameter_mmax" : 39,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"varname" : "EFXType",
					"id" : "obj-65",
					"annotation" : "EFX type: one of 40 effects (EQ, distortion, phaser, delays, rotary, pitch shifter, ...). The 12 dials follow the type. (JV-2080 manual p.33)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2420.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 13",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-66"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 37,
					"outlettype" : [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
					"patching_rect" : [ 900.0, 600.0, 600.0, 22.0 ],
					"text" : "js jvfx.js",
					"id" : "obj-67"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2570.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 437.0, 22.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 1",
							"parameter_shortname" : "Low Freq",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam1",
					"id" : "obj-68",
					"shownumber" : 0,
					"annotation" : "EFX parameter 1. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2570.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 14",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-69"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2720.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 22.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 2",
							"parameter_shortname" : "Low Gain",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam2",
					"id" : "obj-70",
					"shownumber" : 0,
					"annotation" : "EFX parameter 2. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2720.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 15",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-71"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2870.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 545.0, 22.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 3",
							"parameter_shortname" : "P1 Freq",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam3",
					"id" : "obj-72",
					"shownumber" : 0,
					"annotation" : "EFX parameter 3. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2870.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 16",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-73"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3020.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 599.0, 22.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 4",
							"parameter_shortname" : "P1 Gain",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam4",
					"id" : "obj-74",
					"shownumber" : 0,
					"annotation" : "EFX parameter 4. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3020.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 17",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-75"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3170.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 653.0, 22.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 5",
							"parameter_shortname" : "P1 Q",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam5",
					"id" : "obj-76",
					"shownumber" : 0,
					"annotation" : "EFX parameter 5. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3170.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 18",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-77"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3320.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 707.0, 22.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 6",
							"parameter_shortname" : "High Freq",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam6",
					"id" : "obj-78",
					"shownumber" : 0,
					"annotation" : "EFX parameter 6. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3320.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 19",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-79"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3470.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 437.0, 74.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 7",
							"parameter_shortname" : "High Gain",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam7",
					"id" : "obj-80",
					"shownumber" : 0,
					"annotation" : "EFX parameter 7. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3470.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 20",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-81"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3620.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 74.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 8",
							"parameter_shortname" : "P2 Freq",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam8",
					"id" : "obj-82",
					"shownumber" : 0,
					"annotation" : "EFX parameter 8. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3620.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 21",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-83"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3770.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 545.0, 74.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 9",
							"parameter_shortname" : "P2 Gain",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam9",
					"id" : "obj-84",
					"shownumber" : 0,
					"annotation" : "EFX parameter 9. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3770.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 22",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-85"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3920.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 599.0, 74.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 10",
							"parameter_shortname" : "P2 Q",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam10",
					"id" : "obj-86",
					"shownumber" : 0,
					"annotation" : "EFX parameter 10. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3920.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 23",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-87"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 4070.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 653.0, 74.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 11",
							"parameter_shortname" : "Level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam11",
					"id" : "obj-88",
					"shownumber" : 0,
					"annotation" : "EFX parameter 11. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4070.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 24",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-89"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activefgdialcolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"activeneedlecolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 4220.0, 600.0, 48.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 707.0, 74.0, 48.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Param 12",
							"parameter_shortname" : "-",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "EFXParam12",
					"id" : "obj-90",
					"shownumber" : 0,
					"annotation" : "EFX parameter 12. What it does depends on the EFX type: see the label above the dial. (JV-2080 manual p.33-53)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4220.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 25",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-91"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1637.0, 426.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 437.0, 126.0, 40.0, 18.0 ],
					"text" : "out",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-92"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1695.0, 426.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 495.0, 126.0, 40.0, 18.0 ],
					"text" : "level",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-93"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1741.0, 426.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 541.0, 126.0, 40.0, 18.0 ],
					"text" : "cho",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-94"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1787.0, 426.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 587.0, 126.0, 40.0, 18.0 ],
					"text" : "rev",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-95"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 4370.0, 600.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 437.0, 143.0, 52.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Output Assign",
							"parameter_shortname" : "out",
							"parameter_type" : 2,
							"parameter_enum" : [ "MIX", "DIR1", "DIR2" ],
							"parameter_mmax" : 2,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"varname" : "EFXOut",
					"id" : "obj-96",
					"annotation" : "Where the EFX goes: the MIX outputs, or DIRECT 1 / 2 (then no chorus or reverb send). (JV-2080 manual p.26)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4370.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 26",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-97"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4370.0, 650.0, 140.0, 22.0 ],
					"text" : "prepend efx out",
					"id" : "obj-98"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 4520.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 495.0, 143.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Output Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 127 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "EFXLevel",
					"id" : "obj-99",
					"annotation" : "EFX output level. (JV-2080 manual p.26)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4520.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 27",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-100"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4520.0, 650.0, 140.0, 22.0 ],
					"text" : "prepend efx mix",
					"id" : "obj-101"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 4670.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 541.0, 143.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Chorus Send",
							"parameter_shortname" : "cho",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "EFXChoSend",
					"id" : "obj-102",
					"annotation" : "How much of the EFX goes to the chorus. (JV-2080 manual p.26)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4670.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 28",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-103"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4670.0, 650.0, 140.0, 22.0 ],
					"text" : "prepend efx cho",
					"id" : "obj-104"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 4820.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 587.0, 143.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf EFX Reverb Send",
							"parameter_shortname" : "rev",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "EFXRevSend",
					"id" : "obj-105",
					"annotation" : "How much of the EFX goes to the reverb. (JV-2080 manual p.26)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4820.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 29",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-106"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4820.0, 650.0, 140.0, 22.0 ],
					"text" : "prepend efx rev",
					"id" : "obj-107"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1833.0, 426.0, 128.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 633.0, 126.0, 120.0, 18.0 ],
					"text" : "(n) = raw value",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-108"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0 ],
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1966.0, 20.0, 220.0, 163.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 766.0, 0.0, 220.0, 163.0 ],
					"proportion" : 0.5,
					"id" : "obj-109"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1970.0, 301.0, 100.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 770.0, 1.0, 100.0, 18.0 ],
					"text" : "Chorus",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-110"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2078.0, 301.0, 100.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 878.0, 1.0, 100.0, 18.0 ],
					"text" : "Reverb",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-111"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1970.0, 318.0, 56.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 770.0, 18.0, 56.0, 18.0 ],
					"text" : "level",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-112"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 4970.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 828.0, 20.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Chorus Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "ChoLevel",
					"id" : "obj-113",
					"annotation" : "Chorus volume. (JV-2080 manual p.54)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4970.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 34",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-114"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4970.0, 650.0, 180.0, 22.0 ],
					"text" : "prepend chorus level",
					"id" : "obj-115"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1970.0, 338.0, 56.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 770.0, 38.0, 56.0, 18.0 ],
					"text" : "rate",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-116"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 5120.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 828.0, 40.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Chorus Rate",
							"parameter_shortname" : "rate",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 30 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "ChoRate",
					"id" : "obj-117",
					"annotation" : "Chorus modulation speed. (JV-2080 manual p.54)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 5120.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 35",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-118"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1970.0, 358.0, 56.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 770.0, 58.0, 56.0, 18.0 ],
					"text" : "depth",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-119"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 5270.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 828.0, 60.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Chorus Depth",
							"parameter_shortname" : "depth",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 60 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "ChoDepth",
					"id" : "obj-120",
					"annotation" : "Chorus modulation depth. (JV-2080 manual p.54)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 5270.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 36",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-121"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1970.0, 378.0, 56.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 770.0, 78.0, 56.0, 18.0 ],
					"text" : "pre dly",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-122"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 5420.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 828.0, 80.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Chorus Pre-Delay",
							"parameter_shortname" : "pre dly",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 10 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "ChoPreDelay",
					"id" : "obj-123",
					"annotation" : "Chorus pre-delay: the time before the chorus is heard. More sounds spacier. (JV-2080 manual p.54)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 5420.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 37",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-124"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1970.0, 398.0, 56.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 770.0, 98.0, 56.0, 18.0 ],
					"text" : "feedback",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-125"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 5570.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 828.0, 100.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Chorus Feedback",
							"parameter_shortname" : "feedback",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "ChoFeedback",
					"id" : "obj-126",
					"annotation" : "Chorus feedback: how much is fed back into the chorus, for a more complex sound. (JV-2080 manual p.54)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 5570.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 38",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-127"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1970.0, 418.0, 56.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 770.0, 118.0, 56.0, 18.0 ],
					"text" : "out",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-128"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 5720.0, 600.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 806.0, 120.0, 62.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Chorus Output",
							"parameter_shortname" : "out",
							"parameter_type" : 2,
							"parameter_enum" : [ "MIX", "REVERB", "MIX+REV" ],
							"parameter_mmax" : 2,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"varname" : "ChoOut",
					"id" : "obj-129",
					"annotation" : "Chorus output: MIX (MIX outputs), REV (into the reverb) or MIX+REV. (JV-2080 manual p.54)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 5720.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 39",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-130"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 5720.0, 650.0, 164.0, 22.0 ],
					"text" : "prepend chorus out",
					"id" : "obj-131"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2078.0, 318.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 878.0, 18.0, 40.0, 18.0 ],
					"text" : "type",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-132"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 5870.0, 600.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 914.0, 20.0, 66.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Reverb Type",
							"parameter_shortname" : "type",
							"parameter_type" : 2,
							"parameter_enum" : [ "ROOM1", "ROOM2", "STAGE1", "STAGE2", "HALL1", "HALL2", "DELAY", "PAN-DLY" ],
							"parameter_mmax" : 7,
							"parameter_initial" : [ 4 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"varname" : "RevType",
					"id" : "obj-133",
					"annotation" : "Reverb type: ROOM1 / 2, STAGE1 / 2, HALL1 / 2, or DELAY and PAN-DLY (echoes, panned left and right). (JV-2080 manual p.54)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 5870.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 40",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-134"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 5870.0, 650.0, 172.0, 22.0 ],
					"text" : "prepend reverb type",
					"id" : "obj-135"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2078.0, 338.0, 50.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 878.0, 38.0, 50.0, 18.0 ],
					"text" : "level",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-136"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 6020.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 940.0, 40.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Reverb Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "RevLevel",
					"id" : "obj-137",
					"annotation" : "Reverb volume. (JV-2080 manual p.54-55)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 6020.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 41",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-138"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 6020.0, 650.0, 180.0, 22.0 ],
					"text" : "prepend reverb level",
					"id" : "obj-139"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2078.0, 358.0, 50.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 878.0, 58.0, 50.0, 18.0 ],
					"text" : "time",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-140"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 6170.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 940.0, 60.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Reverb Time",
							"parameter_shortname" : "time",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 80 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "RevTime",
					"id" : "obj-141",
					"annotation" : "Reverb time: how long the reverb lasts (the delay time for DELAY and PAN-DLY). (JV-2080 manual p.55)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 6170.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 42",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-142"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2078.0, 378.0, 50.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 878.0, 78.0, 50.0, 18.0 ],
					"text" : "HF damp",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-143"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 6320.0, 600.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 928.0, 80.0, 52.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Reverb HF Damp",
							"parameter_shortname" : "HF damp",
							"parameter_type" : 2,
							"parameter_enum" : [ "200", "250", "315", "400", "500", "630", "800", "1000", "1250", "1600", "2000", "2500", "3150", "4000", "5000", "6300", "8000", "BYPASS" ],
							"parameter_mmax" : 17,
							"parameter_initial" : [ 17 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"varname" : "RevHFDamp",
					"id" : "obj-144",
					"annotation" : "HF damp: cuts the reverb's highs above this frequency. BYPASS: no damping. (JV-2080 manual p.55)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 6320.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 43",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-145"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2078.0, 398.0, 50.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 878.0, 98.0, 50.0, 18.0 ],
					"text" : "dly fbk",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textjustification" : 0,
					"id" : "obj-146"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 4,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 6470.0, 600.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 940.0, 100.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Perf Delay Feedback",
							"parameter_shortname" : "dly fbk",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textjustification" : 0,
					"varname" : "RevDelayFbk",
					"id" : "obj-147",
					"annotation" : "Delay feedback: how many repeats, for the DELAY and PAN-DLY reverb types. (JV-2080 manual p.55)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 6470.0, 700.0, 140.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 44",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-148"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 900.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 0",
					"id" : "obj-150"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 970.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 1",
					"id" : "obj-152"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1040.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 2",
					"id" : "obj-154"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1110.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 3",
					"id" : "obj-156"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1180.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 4",
					"id" : "obj-158"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1250.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 5",
					"id" : "obj-160"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 6",
					"id" : "obj-162"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1390.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 7",
					"id" : "obj-164"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1460.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 8",
					"id" : "obj-166"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1530.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 9",
					"id" : "obj-168"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1600.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 10",
					"id" : "obj-170"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1670.0, 560.0, 65.0, 22.0 ],
					"text" : "prepend dial 11",
					"id" : "obj-172"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"outlettype" : [  ],
					"patching_rect" : [ 20.0, 1240.0, 104.0, 22.0 ],
					"text" : "s ---sysex",
					"id" : "obj-174"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 1200.0, 88.0, 22.0 ],
					"text" : "gate 1 0",
					"id" : "obj-175"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 1160.0, 96.0, 22.0 ],
					"text" : "r ---mode",
					"id" : "obj-176"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1254.0, 1124.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 12",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-180"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1254.0, 1146.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 66",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-183"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1254.0, 1168.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 67",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-186"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1450.0, 1124.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 65",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-191"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1500.0, 1100.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 45 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-193"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-194",
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0 ],
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1200.0, 1300.0, 430.0, 163.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 430.0, 163.0 ],
					"proportion" : 0.5
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"source" : [ "obj-99", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"source" : [ "obj-99", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-124", 0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-142", 0 ],
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 0 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-148", 0 ],
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-150", 0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-150", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-151", 0 ],
					"source" : [ "obj-67", 12 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-67", 24 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-152", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-67", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"source" : [ "obj-67", 13 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"source" : [ "obj-67", 25 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-154", 0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"source" : [ "obj-67", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-155", 0 ],
					"source" : [ "obj-67", 14 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-67", 26 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-67", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-157", 0 ],
					"source" : [ "obj-67", 15 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-67", 27 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-158", 0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-67", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"source" : [ "obj-67", 16 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-67", 28 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-67", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"source" : [ "obj-67", 17 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-67", 29 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"source" : [ "obj-67", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-163", 0 ],
					"source" : [ "obj-67", 18 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-67", 30 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-164", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"source" : [ "obj-67", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-165", 0 ],
					"source" : [ "obj-67", 19 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-67", 31 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-166", 0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-166", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"source" : [ "obj-67", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 0 ],
					"source" : [ "obj-67", 20 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-67", 32 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-168", 0 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"source" : [ "obj-67", 9 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"source" : [ "obj-67", 21 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"source" : [ "obj-67", 33 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"source" : [ "obj-67", 10 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-171", 0 ],
					"source" : [ "obj-67", 22 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"source" : [ "obj-67", 34 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-172", 0 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-67", 11 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-173", 0 ],
					"source" : [ "obj-67", 23 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"source" : [ "obj-67", 35 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-174", 0 ],
					"source" : [ "obj-175", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-148", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-180", 0 ],
					"source" : [ "obj-179", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-183", 0 ],
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 0 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 0 ],
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-191", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-193", 0 ],
					"source" : [ "obj-192", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 1 ],
					"source" : [ "obj-193", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-65" : [ "Perf EFX Type", "EFX", 0 ],
			"obj-68" : [ "Perf EFX Param 1", "Low Freq", 0 ],
			"obj-70" : [ "Perf EFX Param 2", "Low Gain", 0 ],
			"obj-72" : [ "Perf EFX Param 3", "P1 Freq", 0 ],
			"obj-74" : [ "Perf EFX Param 4", "P1 Gain", 0 ],
			"obj-76" : [ "Perf EFX Param 5", "P1 Q", 0 ],
			"obj-78" : [ "Perf EFX Param 6", "High Freq", 0 ],
			"obj-80" : [ "Perf EFX Param 7", "High Gain", 0 ],
			"obj-82" : [ "Perf EFX Param 8", "P2 Freq", 0 ],
			"obj-84" : [ "Perf EFX Param 9", "P2 Gain", 0 ],
			"obj-86" : [ "Perf EFX Param 10", "P2 Q", 0 ],
			"obj-88" : [ "Perf EFX Param 11", "Level", 0 ],
			"obj-90" : [ "Perf EFX Param 12", "-", 0 ],
			"obj-96" : [ "Perf EFX Output Assign", "out", 0 ],
			"obj-99" : [ "Perf EFX Output Level", "level", 0 ],
			"obj-102" : [ "Perf EFX Chorus Send", "cho", 0 ],
			"obj-105" : [ "Perf EFX Reverb Send", "rev", 0 ],
			"obj-113" : [ "Perf Chorus Level", "level", 0 ],
			"obj-117" : [ "Perf Chorus Rate", "rate", 0 ],
			"obj-120" : [ "Perf Chorus Depth", "depth", 0 ],
			"obj-123" : [ "Perf Chorus Pre-Delay", "pre dly", 0 ],
			"obj-126" : [ "Perf Chorus Feedback", "feedback", 0 ],
			"obj-129" : [ "Perf Chorus Output", "out", 0 ],
			"obj-133" : [ "Perf Reverb Type", "type", 0 ],
			"obj-137" : [ "Perf Reverb Level", "level", 0 ],
			"obj-141" : [ "Perf Reverb Time", "time", 0 ],
			"obj-144" : [ "Perf Reverb HF Damp", "HF damp", 0 ],
			"obj-147" : [ "Perf Delay Feedback", "dly fbk", 0 ],
			"obj-179" : [ "Perf EFX-A Source", "EFX-A", 0 ],
			"obj-182" : [ "Perf EFX-B Source", "EFX-B", 0 ],
			"obj-185" : [ "Perf EFX-C Source", "EFX-C", 0 ],
			"obj-190" : [ "Perf Clock Source", "clock", 0 ],
			"obj-192" : [ "Perf Tempo", "tempo", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [  ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Luca",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"color2" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"fontname" : [ "Open Sans Semibold" ],
					"color" : [ 0.475135, 0.293895, 0.251069, 1.0 ],
					"accentcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"elementcolor" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
					"selectioncolor" : [ 0.720698, 0.16723, 0.080014, 1.0 ],
					"textcolor_inverse" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
					"bgcolor" : [ 0.904179, 0.895477, 0.842975, 0.56 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Matt",
				"default" : 				{
					"fontface" : [ 1 ],
					"fontsize" : [ 10.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "WTF",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"fontname" : [ "HydrogenType" ],
					"color" : [ 0.113725, 0.580392, 0.737255, 1.0 ],
					"accentcolor" : [ 0.50764, 0.065317, 0.112129, 1.0 ],
					"elementcolor" : [ 0.461105, 0.492646, 0.591878, 1.0 ],
					"fontsize" : [ 18.0 ],
					"bgcolor" : [ 0.163647, 0.174699, 0.17409, 1.0 ],
					"patchlinecolor" : [ 0.231373, 0.121569, 0.305882, 0.9 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classic",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color1" : [ 0.83978, 0.839941, 0.839753, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color" : [ 0.839216, 0.839216, 0.839216, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39
					}
,
					"fontname" : [ "Geneva" ],
					"color" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"accentcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : [ 9.0 ],
					"bgcolor" : [ 0.83978, 0.839941, 0.839753, 1.0 ],
					"patchlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicButton",
				"default" : 				{
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicDial",
				"default" : 				{
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicGain~",
				"default" : 				{
					"color" : [ 0.380392, 0.380392, 0.380392, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicGswitch",
				"default" : 				{
					"accentcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicGswitch2",
				"default" : 				{
					"accentcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicKslider",
				"default" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"elementcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"selectioncolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicLed",
				"default" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"elementcolor" : [ 0.6, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicMatrixctrl",
				"default" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicMeter~",
				"default" : 				{
					"elementcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"bgcolor" : [ 0.380392, 0.380392, 0.380392, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicNodes",
				"default" : 				{
					"color" : [ 0.839216, 0.839216, 0.839216, 1.0 ],
					"elementcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"fontsize" : [ 9.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicNslider",
				"default" : 				{
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicNumber",
				"default" : 				{
					"selectioncolor" : [ 1.0, 0.890196, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicPictslider",
				"default" : 				{
					"elementcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicPreset",
				"default" : 				{
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicScope~",
				"default" : 				{
					"color" : [ 0.462745, 0.933333, 0.0, 1.0 ],
					"bgcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicTab",
				"default" : 				{
					"color" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"elementcolor" : [ 0.839216, 0.839216, 0.839216, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicTextbutton",
				"default" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"accentcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicToggle",
				"default" : 				{
					"color" : [ 0.380392, 0.380392, 0.380392, 1.0 ],
					"elementcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicUmenu",
				"default" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicWaveform~",
				"default" : 				{
					"color" : [ 0.380392, 0.380392, 0.380392, 1.0 ],
					"selectioncolor" : [ 0.498039, 0.498039, 0.498039, 0.5 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "dark-night-patch",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39
					}
,
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"patchlinecolor" : [ 0.439216, 0.74902, 0.254902, 0.898039 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jpatcher001",
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jpatcher002",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color1" : [ 0.32549, 0.345098, 0.372549, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39
					}
,
					"fontname" : [ "Ableton Sans Book" ],
					"clearcolor" : [ 0.32549, 0.345098, 0.372549, 0.0 ],
					"fontsize" : [ 9.5 ],
					"patchlinecolor" : [ 0.65098, 0.65098, 0.65098, 0.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jpink",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.619608, 0.0, 0.360784, 1.0 ],
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"color" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"accentcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"elementcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"clearcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ],
					"selectioncolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"textcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"patchlinecolor" : [ 0.65, 0.65, 0.65, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "ksliderWhite",
				"default" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "lightbutton",
				"default" : 				{
					"elementcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ],
					"bgcolor" : [ 0.309495, 0.299387, 0.299789, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBrown-1",
				"default" : 				{
					"accentcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjCyan-1",
				"default" : 				{
					"accentcolor" : [ 0.029546, 0.773327, 0.821113, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjRed-1",
				"default" : 				{
					"accentcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ],
					"fontsize" : [ 12.059008 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-2",
				"default" : 				{
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ],
					"fontsize" : [ 12.059008 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberGold-1",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "purple",
				"default" : 				{
					"textcolor_inverse" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"bgcolor" : [ 0.304029, 0.250694, 0.285628, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "receives",
				"default" : 				{
					"accentcolor" : [ 0.870588, 0.415686, 0.062745, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "rsliderGold",
				"default" : 				{
					"color" : [ 0.646639, 0.821777, 0.854593, 1.0 ],
					"bgcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "sends",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tap",
				"default" : 				{
					"fontname" : [ "Lato Light" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tastefulltoggle",
				"default" : 				{
					"color" : [ 0.941176, 0.690196, 0.196078, 1.0 ],
					"bgcolor" : [ 0.185512, 0.263736, 0.260626, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tastefultoggle",
				"default" : 				{
					"color" : [ 0.941176, 0.690196, 0.196078, 1.0 ],
					"elementcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ],
					"bgcolor" : [ 0.287863, 0.333333, 0.329398, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "test",
				"default" : 				{
					"fontface" : [ 1 ],
					"fontsize" : [ 10.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "whitey",
				"default" : 				{
					"fontname" : [ "Dirty Ego" ],
					"selectioncolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
					"textcolor_inverse" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"fontsize" : [ 36.0 ],
					"patchlinecolor" : [ 0.199068, 0.062496, 0.060031, 0.9 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
