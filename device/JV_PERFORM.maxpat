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
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "1",
					"texton" : "1",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 20.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 2.0, 24.0, 15.0 ],
					"varname" : "P1On",
					"hint" : "Part 1 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 1 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-17"
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
					"patching_rect" : [ 50.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 30.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P1Channel",
					"hint" : "Part 1 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 1 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-20"
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
					"patching_rect" : [ 180.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 20.0, 55.0, 15.0 ],
					"varname" : "P1BankView",
					"hint" : "Part 1 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 1 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-24"
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
					"patching_rect" : [ 120.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P1Patch",
					"hint" : "Part 1 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 1 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-33"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 20.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P1Level",
					"hint" : "Part 1 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 1 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-37"
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
					"patching_rect" : [ 80.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P1Pan",
					"hint" : "Part 1 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 1 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-39"
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
					"patching_rect" : [ 180.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 26.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P1Voices",
					"hint" : "Part 1 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 1 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-42"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "2",
					"texton" : "2",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 280.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 65.0, 2.0, 24.0, 15.0 ],
					"varname" : "P2On",
					"hint" : "Part 2 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 2 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-45"
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
					"patching_rect" : [ 310.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 91.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P2Channel",
					"hint" : "Part 2 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 2 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 2 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-48"
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
					"patching_rect" : [ 440.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 65.0, 20.0, 55.0, 15.0 ],
					"varname" : "P2BankView",
					"hint" : "Part 2 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 2 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-52"
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
					"patching_rect" : [ 380.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 65.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P2Patch",
					"hint" : "Part 2 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 2 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 2 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-61"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 280.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 64.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P2Level",
					"hint" : "Part 2 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 2 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-65"
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
					"patching_rect" : [ 340.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 86.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P2Pan",
					"hint" : "Part 2 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 2 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-67"
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
					"patching_rect" : [ 440.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 87.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P2Voices",
					"hint" : "Part 2 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 2 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-70"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "3",
					"texton" : "3",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 540.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 126.0, 2.0, 24.0, 15.0 ],
					"varname" : "P3On",
					"hint" : "Part 3 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 3 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-73"
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
					"patching_rect" : [ 570.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 152.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P3Channel",
					"hint" : "Part 3 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 3 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 3 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-76"
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
					"patching_rect" : [ 700.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 126.0, 20.0, 55.0, 15.0 ],
					"varname" : "P3BankView",
					"hint" : "Part 3 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 3 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-80"
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
					"patching_rect" : [ 640.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 126.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P3Patch",
					"hint" : "Part 3 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 3 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 3 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-89"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 540.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 125.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P3Level",
					"hint" : "Part 3 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 3 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-93"
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
					"patching_rect" : [ 600.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 147.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P3Pan",
					"hint" : "Part 3 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 3 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-95"
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
					"patching_rect" : [ 700.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 148.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P3Voices",
					"hint" : "Part 3 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 3 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-98"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "4",
					"texton" : "4",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 800.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 187.0, 2.0, 24.0, 15.0 ],
					"varname" : "P4On",
					"hint" : "Part 4 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 4 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
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
					"patching_rect" : [ 830.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P4Channel",
					"hint" : "Part 4 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 4 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 4 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-104"
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
					"patching_rect" : [ 960.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 187.0, 20.0, 55.0, 15.0 ],
					"varname" : "P4BankView",
					"hint" : "Part 4 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 4 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-108"
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
					"patching_rect" : [ 900.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 187.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P4Patch",
					"hint" : "Part 4 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 4 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 4 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-117"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 800.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 186.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P4Level",
					"hint" : "Part 4 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 4 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-121"
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
					"patching_rect" : [ 860.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 208.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P4Pan",
					"hint" : "Part 4 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 4 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-123"
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
					"patching_rect" : [ 960.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 209.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P4Voices",
					"hint" : "Part 4 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 4 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-126"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "5",
					"texton" : "5",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 1060.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 2.0, 24.0, 15.0 ],
					"varname" : "P5On",
					"hint" : "Part 5 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 5 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-129"
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
					"patching_rect" : [ 1090.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 274.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P5Channel",
					"hint" : "Part 5 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 5 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 5 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
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
					"patching_rect" : [ 1220.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 20.0, 55.0, 15.0 ],
					"varname" : "P5BankView",
					"hint" : "Part 5 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 5 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
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
					"patching_rect" : [ 1160.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P5Patch",
					"hint" : "Part 5 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 5 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 5 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-145"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1060.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 247.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P5Level",
					"hint" : "Part 5 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 5 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-149"
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
					"patching_rect" : [ 1120.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 269.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P5Pan",
					"hint" : "Part 5 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 5 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-151"
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
					"patching_rect" : [ 1220.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 270.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P5Voices",
					"hint" : "Part 5 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 5 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-154"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "6",
					"texton" : "6",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 1320.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 2.0, 24.0, 15.0 ],
					"varname" : "P6On",
					"hint" : "Part 6 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 6 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-157"
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
					"patching_rect" : [ 1350.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 335.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P6Channel",
					"hint" : "Part 6 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 6 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 6 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-160"
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
					"patching_rect" : [ 1480.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 20.0, 55.0, 15.0 ],
					"varname" : "P6BankView",
					"hint" : "Part 6 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 6 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-164"
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
					"patching_rect" : [ 1420.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P6Patch",
					"hint" : "Part 6 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 6 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 6 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-173"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1320.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 308.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P6Level",
					"hint" : "Part 6 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 6 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-177"
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
					"patching_rect" : [ 1380.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 330.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P6Pan",
					"hint" : "Part 6 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 6 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-179"
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
					"patching_rect" : [ 1480.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 331.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P6Voices",
					"hint" : "Part 6 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 6 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-182"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "7",
					"texton" : "7",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 1580.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 370.0, 2.0, 24.0, 15.0 ],
					"varname" : "P7On",
					"hint" : "Part 7 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 7 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-185"
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
					"patching_rect" : [ 1610.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 396.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P7Channel",
					"hint" : "Part 7 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 7 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 7 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-188"
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
					"patching_rect" : [ 1740.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 370.0, 20.0, 55.0, 15.0 ],
					"varname" : "P7BankView",
					"hint" : "Part 7 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 7 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-192"
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
					"patching_rect" : [ 1680.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 370.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P7Patch",
					"hint" : "Part 7 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 7 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 7 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-201"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1580.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 369.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P7Level",
					"hint" : "Part 7 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 7 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-205"
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
					"patching_rect" : [ 1640.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 391.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P7Pan",
					"hint" : "Part 7 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 7 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-207"
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
					"patching_rect" : [ 1740.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 392.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P7Voices",
					"hint" : "Part 7 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 7 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-210"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "8",
					"texton" : "8",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 1840.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 431.0, 2.0, 24.0, 15.0 ],
					"varname" : "P8On",
					"hint" : "Part 8 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 8 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-213"
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
					"patching_rect" : [ 1870.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 457.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P8Channel",
					"hint" : "Part 8 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 8 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 8 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-216"
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
					"patching_rect" : [ 2000.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 431.0, 20.0, 55.0, 15.0 ],
					"varname" : "P8BankView",
					"hint" : "Part 8 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 8 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-220"
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
					"patching_rect" : [ 1940.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 431.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P8Patch",
					"hint" : "Part 8 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 8 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 8 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-229"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1840.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 430.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P8Level",
					"hint" : "Part 8 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 8 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-233"
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
					"patching_rect" : [ 1900.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 452.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P8Pan",
					"hint" : "Part 8 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 8 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-235"
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
					"patching_rect" : [ 2000.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 453.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P8Voices",
					"hint" : "Part 8 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 8 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-238"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "9",
					"texton" : "9",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 2100.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 492.0, 2.0, 24.0, 15.0 ],
					"varname" : "P9On",
					"hint" : "Part 9 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 9 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-241"
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
					"patching_rect" : [ 2130.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 518.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P9Channel",
					"hint" : "Part 9 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 9 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 9 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-244"
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
					"patching_rect" : [ 2260.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 492.0, 20.0, 55.0, 15.0 ],
					"varname" : "P9BankView",
					"hint" : "Part 9 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 9 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-248"
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
					"patching_rect" : [ 2200.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 492.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P9Patch",
					"hint" : "Part 9 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 9 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 9 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-257"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2100.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P9Level",
					"hint" : "Part 9 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 9 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-261"
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
					"patching_rect" : [ 2160.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 513.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P9Pan",
					"hint" : "Part 9 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 9 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-263"
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
					"patching_rect" : [ 2260.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 514.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P9Voices",
					"hint" : "Part 9 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 9 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-266"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "10",
					"texton" : "10",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 2360.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 553.0, 2.0, 24.0, 15.0 ],
					"varname" : "P10On",
					"hint" : "Part 10 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 10 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-269"
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
					"patching_rect" : [ 2390.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 579.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P10Channel",
					"hint" : "Part 10 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 10 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 10 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-272"
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
					"patching_rect" : [ 2520.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 553.0, 20.0, 55.0, 15.0 ],
					"varname" : "P10BankView",
					"hint" : "Part 10 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 10 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-276"
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
					"patching_rect" : [ 2460.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 553.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P10Patch",
					"hint" : "Part 10 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 10 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 10 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-285"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2360.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 552.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P10Level",
					"hint" : "Part 10 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 10 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-289"
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
					"patching_rect" : [ 2420.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 574.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P10Pan",
					"hint" : "Part 10 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 10 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-291"
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
					"patching_rect" : [ 2520.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 575.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P10Voices",
					"hint" : "Part 10 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 10 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-294"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "11",
					"texton" : "11",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 2620.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 614.0, 2.0, 24.0, 15.0 ],
					"varname" : "P11On",
					"hint" : "Part 11 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 11 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-297"
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
					"patching_rect" : [ 2650.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 640.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P11Channel",
					"hint" : "Part 11 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 11 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 11 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-300"
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
					"patching_rect" : [ 2780.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 614.0, 20.0, 55.0, 15.0 ],
					"varname" : "P11BankView",
					"hint" : "Part 11 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 11 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-304"
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
					"patching_rect" : [ 2720.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 614.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P11Patch",
					"hint" : "Part 11 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 11 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 11 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-313"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2620.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 613.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P11Level",
					"hint" : "Part 11 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 11 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-317"
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
					"patching_rect" : [ 2680.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 635.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P11Pan",
					"hint" : "Part 11 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 11 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-319"
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
					"patching_rect" : [ 2780.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 636.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P11Voices",
					"hint" : "Part 11 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 11 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-322"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "12",
					"texton" : "12",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 2880.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 675.0, 2.0, 24.0, 15.0 ],
					"varname" : "P12On",
					"hint" : "Part 12 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 12 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-325"
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
					"patching_rect" : [ 2910.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 701.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P12Channel",
					"hint" : "Part 12 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 12 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 12 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-328"
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
					"patching_rect" : [ 3040.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 675.0, 20.0, 55.0, 15.0 ],
					"varname" : "P12BankView",
					"hint" : "Part 12 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 12 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-332"
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
					"patching_rect" : [ 2980.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 675.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P12Patch",
					"hint" : "Part 12 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 12 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 12 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-341"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2880.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 674.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P12Level",
					"hint" : "Part 12 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 12 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-345"
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
					"patching_rect" : [ 2940.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 696.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P12Pan",
					"hint" : "Part 12 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 12 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-347"
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
					"patching_rect" : [ 3040.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 697.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P12Voices",
					"hint" : "Part 12 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 12 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-350"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "13",
					"texton" : "13",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 3140.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 736.0, 2.0, 24.0, 15.0 ],
					"varname" : "P13On",
					"hint" : "Part 13 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 13 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-353"
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
					"patching_rect" : [ 3170.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 762.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P13Channel",
					"hint" : "Part 13 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 13 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 13 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-356"
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
					"patching_rect" : [ 3300.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 736.0, 20.0, 55.0, 15.0 ],
					"varname" : "P13BankView",
					"hint" : "Part 13 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 13 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-360"
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
					"patching_rect" : [ 3240.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 736.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P13Patch",
					"hint" : "Part 13 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 13 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 13 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-369"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3140.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 735.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P13Level",
					"hint" : "Part 13 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 13 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-373"
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
					"patching_rect" : [ 3200.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 757.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P13Pan",
					"hint" : "Part 13 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 13 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-375"
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
					"patching_rect" : [ 3300.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P13Voices",
					"hint" : "Part 13 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 13 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-378"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "14",
					"texton" : "14",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 3400.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 797.0, 2.0, 24.0, 15.0 ],
					"varname" : "P14On",
					"hint" : "Part 14 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 14 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-381"
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
					"patching_rect" : [ 3430.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 823.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P14Channel",
					"hint" : "Part 14 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 14 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 14 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-384"
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
					"patching_rect" : [ 3560.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 797.0, 20.0, 55.0, 15.0 ],
					"varname" : "P14BankView",
					"hint" : "Part 14 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 14 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-388"
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
					"patching_rect" : [ 3500.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 797.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P14Patch",
					"hint" : "Part 14 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 14 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 14 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-397"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3400.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 796.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P14Level",
					"hint" : "Part 14 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 14 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-401"
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
					"patching_rect" : [ 3460.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 818.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P14Pan",
					"hint" : "Part 14 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 14 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-403"
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
					"patching_rect" : [ 3560.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 819.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P14Voices",
					"hint" : "Part 14 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 14 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-406"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "15",
					"texton" : "15",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 3660.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 858.0, 2.0, 24.0, 15.0 ],
					"varname" : "P15On",
					"hint" : "Part 15 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 15 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-409"
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
					"patching_rect" : [ 3690.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 884.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P15Channel",
					"hint" : "Part 15 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 15 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 15 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-412"
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
					"patching_rect" : [ 3820.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 858.0, 20.0, 55.0, 15.0 ],
					"varname" : "P15BankView",
					"hint" : "Part 15 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 15 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-416"
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
					"patching_rect" : [ 3760.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 858.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P15Patch",
					"hint" : "Part 15 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 15 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 15 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-425"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3660.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 857.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P15Level",
					"hint" : "Part 15 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 15 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-429"
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
					"patching_rect" : [ 3720.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 879.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P15Pan",
					"hint" : "Part 15 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 15 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-431"
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
					"patching_rect" : [ 3820.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 880.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P15Voices",
					"hint" : "Part 15 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 15 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-434"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"text" : "16",
					"texton" : "16",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"activetextoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"patching_rect" : [ 3920.0, 60.0, 24.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 919.0, 2.0, 24.0, 15.0 ],
					"varname" : "P16On",
					"hint" : "Part 16 on/off (Receive Switch)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 16 Switch",
							"parameter_shortname" : "on",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_mmax" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-437"
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
					"patching_rect" : [ 3950.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 945.0, 2.0, 29.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P16Channel",
					"hint" : "Part 16 MIDI channel",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 16 Channel",
							"parameter_shortname" : "ch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 16 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "ch %d"
						}

					}
,
					"id" : "obj-440"
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
					"patching_rect" : [ 4080.0, 100.0, 60.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 919.0, 20.0, 55.0, 15.0 ],
					"varname" : "P16BankView",
					"hint" : "Part 16 patch bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 16 Bank View",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER" ],
							"parameter_mmax" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"id" : "obj-444"
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
					"patching_rect" : [ 4020.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 919.0, 38.0, 55.0, 15.0 ],
					"textjustification" : 0,
					"varname" : "P16Patch",
					"hint" : "Part 16 patch number (1-128; expansion boards up to 255)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 16 Patch",
							"parameter_shortname" : "patch",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 255.0,
							"parameter_initial" : [ 16 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-453"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.slider",
					"modulationcolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3920.0, 140.0, 22.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 918.0, 70.0, 22.0, 92.0 ],
					"slidercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"trioncolor" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"varname" : "P16Level",
					"hint" : "Part 16 level",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 16 Level",
							"parameter_shortname" : "level",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 127.0,
							"parameter_initial" : [ 100 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-457"
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
					"patching_rect" : [ 3980.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 940.0, 72.0, 36.0, 48.0 ],
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"tricolor" : [ 0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0 ],
					"varname" : "P16Pan",
					"hint" : "Part 16 pan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 16 Pan",
							"parameter_shortname" : "pan",
							"parameter_type" : 1,
							"parameter_mmin" : -64.0,
							"parameter_mmax" : 63.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-459"
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
					"patching_rect" : [ 4080.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 941.0, 144.0, 34.0, 15.0 ],
					"textjustification" : 1,
					"varname" : "P16Voices",
					"hint" : "Part 16 voice reserve: voices kept free for this part (all parts together at most 64)",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 16 Voice Reserve",
							"parameter_shortname" : "voices",
							"parameter_type" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%d vc"
						}

					}
,
					"id" : "obj-462"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P1Name",
					"id" : "obj-465"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 220.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P1Track",
					"id" : "obj-466"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 280.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 61.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P2Name",
					"id" : "obj-467"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 480.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 84.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P2Track",
					"id" : "obj-468"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 540.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P3Name",
					"id" : "obj-469"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 740.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 145.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P3Track",
					"id" : "obj-470"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 800.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 183.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P4Name",
					"id" : "obj-471"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1000.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 206.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P4Track",
					"id" : "obj-472"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1060.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 244.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P5Name",
					"id" : "obj-473"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1260.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 267.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P5Track",
					"id" : "obj-474"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1320.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 305.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P6Name",
					"id" : "obj-475"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1520.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 328.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P6Track",
					"id" : "obj-476"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1580.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 366.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P7Name",
					"id" : "obj-477"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1780.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 389.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P7Track",
					"id" : "obj-478"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1840.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P8Name",
					"id" : "obj-479"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2040.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 450.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P8Track",
					"id" : "obj-480"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2100.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 488.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P9Name",
					"id" : "obj-481"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2300.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P9Track",
					"id" : "obj-482"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2360.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 549.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P10Name",
					"id" : "obj-483"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2560.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 572.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P10Track",
					"id" : "obj-484"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2620.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 610.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P11Name",
					"id" : "obj-485"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2820.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 633.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P11Track",
					"id" : "obj-486"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2880.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 671.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P12Name",
					"id" : "obj-487"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3080.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 694.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P12Track",
					"id" : "obj-488"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3140.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 732.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P13Name",
					"id" : "obj-489"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3340.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 755.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P13Track",
					"id" : "obj-490"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3400.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 793.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P14Name",
					"id" : "obj-491"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3600.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 816.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P14Track",
					"id" : "obj-492"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3660.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 854.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P15Name",
					"id" : "obj-493"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3860.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 877.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P15Track",
					"id" : "obj-494"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3920.0, 240.0, 58.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 915.5, 53.0, 61.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P16Name",
					"id" : "obj-495"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4120.0, 240.0, 40.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 938.0, 124.0, 39.0, 15.0 ],
					"text" : "",
					"textcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"fontsize" : 8.0,
					"textjustification" : 1,
					"varname" : "P16Track",
					"id" : "obj-496"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"outlettype" : [  ],
					"patching_rect" : [ 20.0, 1040.0, 104.0, 22.0 ],
					"text" : "s ---sysex",
					"id" : "obj-1"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 1000.0, 88.0, 22.0 ],
					"text" : "gate 1 0",
					"id" : "obj-2"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 960.0, 96.0, 22.0 ],
					"text" : "r ---mode",
					"id" : "obj-3"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"outlettype" : [  ],
					"patching_rect" : [ 20.0, 1080.0, 128.0, 22.0 ],
					"text" : "s ---partkeys",
					"id" : "obj-4"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 900.0, 136.0, 22.0 ],
					"text" : "js jvvoices.js",
					"saved_object_attributes" : 					{
						"filename" : "jvvoices.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-5"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"outlettype" : [  ],
					"patching_rect" : [ 600.0, 900.0, 136.0, 22.0 ],
					"text" : "js jvtracks.js",
					"saved_object_attributes" : 					{
						"filename" : "jvtracks.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-6"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 600.0, 780.0, 144.0, 22.0 ],
					"text" : "live.thisdevice",
					"id" : "obj-7"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 820.0, 104.0, 22.0 ],
					"text" : "delay 2000",
					"id" : "obj-8"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 860.0, 50.0, 22.0 ],
					"text" : "scan 0",
					"id" : "obj-9"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 760.0, 860.0, 144.0, 22.0 ],
					"text" : "r ---scantracks",
					"id" : "obj-10"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"outlettype" : [  ],
					"patching_rect" : [ 300.0, 940.0, 144.0, 22.0 ],
					"text" : "s ---voicesrest",
					"id" : "obj-11"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 900.0, 128.0, 22.0 ],
					"text" : "js jvparts.js",
					"saved_object_attributes" : 					{
						"filename" : "jvparts.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-12"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 860.0, 112.0, 22.0 ],
					"text" : "r ---boards",
					"id" : "obj-13"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 170.0, 860.0, 104.0, 22.0 ],
					"text" : "r ---model",
					"id" : "obj-14"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 320.0, 860.0, 136.0, 22.0 ],
					"text" : "r ---usernames",
					"id" : "obj-15"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"outlettype" : [  ],
					"patching_rect" : [ 20.0, 940.0, 120.0, 22.0 ],
					"text" : "s ---askname",
					"id" : "obj-16"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 16 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-18"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 1 on",
					"id" : "obj-19"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-21"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 1",
					"id" : "obj-22"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 16 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-23"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 180.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 1",
					"id" : "obj-25"
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
					"patching_rect" : [ 20.0, 100.0, 80.0, 15.0 ],
					"varname" : "P1Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 1 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-26"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 20.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-27"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 180.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 1",
					"id" : "obj-28"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-29"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-30"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 16 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-31"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 16 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-32"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-34"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 1",
					"id" : "obj-35"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 16 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-36"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 16 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-38"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-40"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 16 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-41"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 180.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 48",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-43"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 180.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 1",
					"id" : "obj-44"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 17 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-46"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 2 on",
					"id" : "obj-47"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 310.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-49"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 310.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 2",
					"id" : "obj-50"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 310.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 17 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-51"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 2",
					"id" : "obj-53"
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
					"patching_rect" : [ 280.0, 100.0, 80.0, 15.0 ],
					"varname" : "P2Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 2 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-54"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 280.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-55"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 2",
					"id" : "obj-56"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-57"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 380.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-58"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 17 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-59"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 380.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 17 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-60"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 380.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-62"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 380.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 2",
					"id" : "obj-63"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 380.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 17 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-64"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 17 6",
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
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 340.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-68"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 340.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 17 7",
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
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 49",
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
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 2",
					"id" : "obj-72"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 540.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 18 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-74"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 540.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 3 on",
					"id" : "obj-75"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 570.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-77"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 570.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 3",
					"id" : "obj-78"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 570.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 18 1",
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
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 3",
					"id" : "obj-81"
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
					"patching_rect" : [ 540.0, 100.0, 80.0, 15.0 ],
					"varname" : "P3Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 3 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-82"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 540.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-83"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 3",
					"id" : "obj-84"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 540.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-85"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 640.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-86"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 540.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 18 2",
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
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 640.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 18 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-88"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 640.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-90"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 640.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 3",
					"id" : "obj-91"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 640.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 18 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-92"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 540.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 18 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-94"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-96"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 18 7",
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
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 50",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-99"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 3",
					"id" : "obj-100"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 19 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-102"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 4 on",
					"id" : "obj-103"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 830.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-105"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 830.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 4",
					"id" : "obj-106"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 830.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 19 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-107"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 960.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 4",
					"id" : "obj-109"
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
					"patching_rect" : [ 800.0, 100.0, 80.0, 15.0 ],
					"varname" : "P4Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 4 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-110"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 800.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-111"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 960.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 4",
					"id" : "obj-112"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-113"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 900.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-114"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 19 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-115"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 900.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 19 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-116"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 900.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-118"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 900.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 4",
					"id" : "obj-119"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 900.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 19 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-120"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 19 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-122"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-124"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 19 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-125"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 960.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 51",
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
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 960.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 4",
					"id" : "obj-128"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1060.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 20 0",
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
					"patching_rect" : [ 1060.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 5 on",
					"id" : "obj-131"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1090.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-133"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1090.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 5",
					"id" : "obj-134"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1090.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 20 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-135"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1220.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 5",
					"id" : "obj-137"
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
					"patching_rect" : [ 1060.0, 100.0, 80.0, 15.0 ],
					"varname" : "P5Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 5 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-138"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1060.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-139"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1220.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 5",
					"id" : "obj-140"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1060.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-141"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1160.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-142"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1060.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 20 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-143"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1160.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 20 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-144"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1160.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-146"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1160.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 5",
					"id" : "obj-147"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1160.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 20 4 2",
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
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1060.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 20 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-150"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1120.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-152"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1120.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 20 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-153"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1220.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 52",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-155"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1220.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 5",
					"id" : "obj-156"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 21 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-158"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 6 on",
					"id" : "obj-159"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-161"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 6",
					"id" : "obj-162"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 21 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-163"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1480.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 6",
					"id" : "obj-165"
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
					"patching_rect" : [ 1320.0, 100.0, 80.0, 15.0 ],
					"varname" : "P6Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 6 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-166"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1320.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-167"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1480.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 6",
					"id" : "obj-168"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-169"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1420.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-170"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 21 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-171"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1420.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 21 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-172"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1420.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-174"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1420.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 6",
					"id" : "obj-175"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1420.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 21 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-176"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 21 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-178"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1380.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-180"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1380.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 21 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-181"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1480.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 53",
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
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1480.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 6",
					"id" : "obj-184"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1580.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 22 0",
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
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1580.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 7 on",
					"id" : "obj-187"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1610.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-189"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1610.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 7",
					"id" : "obj-190"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1610.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 22 1",
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
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1740.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 7",
					"id" : "obj-193"
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
					"patching_rect" : [ 1580.0, 100.0, 80.0, 15.0 ],
					"varname" : "P7Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 7 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-194"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1580.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-195"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1740.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 7",
					"id" : "obj-196"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1580.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-197"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1680.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-198"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1580.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 22 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-199"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1680.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 22 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-200"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1680.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-202"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1680.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 7",
					"id" : "obj-203"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1680.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 22 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-204"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1580.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 22 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-206"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1640.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-208"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1640.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 22 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-209"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1740.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 54",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-211"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1740.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 7",
					"id" : "obj-212"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1840.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 23 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-214"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1840.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 8 on",
					"id" : "obj-215"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1870.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-217"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1870.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 8",
					"id" : "obj-218"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1870.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 23 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-219"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2000.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 8",
					"id" : "obj-221"
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
					"patching_rect" : [ 1840.0, 100.0, 80.0, 15.0 ],
					"varname" : "P8Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 8 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-222"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1840.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-223"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2000.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 8",
					"id" : "obj-224"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1840.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-225"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1940.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-226"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1840.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 23 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-227"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1940.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 23 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-228"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1940.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-230"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1940.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 8",
					"id" : "obj-231"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1940.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 23 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-232"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1840.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 23 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-234"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1900.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-236"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1900.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 23 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-237"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2000.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 55",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-239"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2000.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 8",
					"id" : "obj-240"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2100.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 24 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-242"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2100.0, 440.0, 160.0, 22.0 ],
					"text" : "prepend part 9 on",
					"id" : "obj-243"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2130.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-245"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2130.0, 320.0, 120.0, 22.0 ],
					"text" : "prepend ch 9",
					"id" : "obj-246"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2130.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 24 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-247"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2260.0, 130.0, 136.0, 22.0 ],
					"text" : "prepend pick 9",
					"id" : "obj-249"
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
					"patching_rect" : [ 2100.0, 100.0, 80.0, 15.0 ],
					"varname" : "P9Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 9 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-250"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 2100.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-251"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2260.0, 160.0, 136.0, 22.0 ],
					"text" : "prepend bank 9",
					"id" : "obj-252"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2100.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-253"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2200.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-254"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2100.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 24 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-255"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2200.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 24 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-256"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2200.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-258"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2200.0, 200.0, 144.0, 22.0 ],
					"text" : "prepend patch 9",
					"id" : "obj-259"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2200.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 24 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-260"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2100.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 24 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-262"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2160.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-264"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2160.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 24 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-265"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2260.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 56",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-267"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2260.0, 280.0, 144.0, 22.0 ],
					"text" : "prepend voice 9",
					"id" : "obj-268"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2360.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 25 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-270"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2360.0, 440.0, 168.0, 22.0 ],
					"text" : "prepend part 10 on",
					"id" : "obj-271"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2390.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-273"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2390.0, 320.0, 128.0, 22.0 ],
					"text" : "prepend ch 10",
					"id" : "obj-274"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2390.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 25 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-275"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2520.0, 130.0, 144.0, 22.0 ],
					"text" : "prepend pick 10",
					"id" : "obj-277"
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
					"patching_rect" : [ 2360.0, 100.0, 80.0, 15.0 ],
					"varname" : "P10Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 10 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-278"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 2360.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-279"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2520.0, 160.0, 144.0, 22.0 ],
					"text" : "prepend bank 10",
					"id" : "obj-280"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2360.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-281"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2460.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-282"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2360.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 25 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-283"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2460.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 25 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-284"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2460.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-286"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2460.0, 200.0, 152.0, 22.0 ],
					"text" : "prepend patch 10",
					"id" : "obj-287"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2460.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 25 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-288"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2360.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 25 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-290"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2420.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-292"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2420.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 25 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-293"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2520.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 57",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-295"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2520.0, 280.0, 152.0, 22.0 ],
					"text" : "prepend voice 10",
					"id" : "obj-296"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2620.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 26 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-298"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2620.0, 440.0, 168.0, 22.0 ],
					"text" : "prepend part 11 on",
					"id" : "obj-299"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2650.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-301"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2650.0, 320.0, 128.0, 22.0 ],
					"text" : "prepend ch 11",
					"id" : "obj-302"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2650.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 26 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-303"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2780.0, 130.0, 144.0, 22.0 ],
					"text" : "prepend pick 11",
					"id" : "obj-305"
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
					"patching_rect" : [ 2620.0, 100.0, 80.0, 15.0 ],
					"varname" : "P11Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 11 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-306"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 2620.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-307"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2780.0, 160.0, 144.0, 22.0 ],
					"text" : "prepend bank 11",
					"id" : "obj-308"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2620.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-309"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2720.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-310"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2620.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 26 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-311"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2720.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 26 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-312"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2720.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-314"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2720.0, 200.0, 152.0, 22.0 ],
					"text" : "prepend patch 11",
					"id" : "obj-315"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2720.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 26 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-316"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2620.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 26 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-318"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2680.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-320"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2680.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 26 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-321"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2780.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 58",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-323"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2780.0, 280.0, 152.0, 22.0 ],
					"text" : "prepend voice 11",
					"id" : "obj-324"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2880.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 27 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-326"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2880.0, 440.0, 168.0, 22.0 ],
					"text" : "prepend part 12 on",
					"id" : "obj-327"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2910.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-329"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2910.0, 320.0, 128.0, 22.0 ],
					"text" : "prepend ch 12",
					"id" : "obj-330"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2910.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 27 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-331"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3040.0, 130.0, 144.0, 22.0 ],
					"text" : "prepend pick 12",
					"id" : "obj-333"
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
					"patching_rect" : [ 2880.0, 100.0, 80.0, 15.0 ],
					"varname" : "P12Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 12 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-334"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 2880.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-335"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3040.0, 160.0, 144.0, 22.0 ],
					"text" : "prepend bank 12",
					"id" : "obj-336"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2880.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-337"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2980.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-338"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2880.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 27 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-339"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2980.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 27 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-340"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2980.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-342"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2980.0, 200.0, 152.0, 22.0 ],
					"text" : "prepend patch 12",
					"id" : "obj-343"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2980.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 27 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-344"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2880.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 27 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-346"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2940.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-348"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2940.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 27 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-349"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3040.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 59",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-351"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3040.0, 280.0, 152.0, 22.0 ],
					"text" : "prepend voice 12",
					"id" : "obj-352"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3140.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 28 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-354"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3140.0, 440.0, 168.0, 22.0 ],
					"text" : "prepend part 13 on",
					"id" : "obj-355"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3170.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-357"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3170.0, 320.0, 128.0, 22.0 ],
					"text" : "prepend ch 13",
					"id" : "obj-358"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3170.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 28 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-359"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3300.0, 130.0, 144.0, 22.0 ],
					"text" : "prepend pick 13",
					"id" : "obj-361"
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
					"patching_rect" : [ 3140.0, 100.0, 80.0, 15.0 ],
					"varname" : "P13Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 13 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-362"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 3140.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-363"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3300.0, 160.0, 144.0, 22.0 ],
					"text" : "prepend bank 13",
					"id" : "obj-364"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3140.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-365"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3240.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-366"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3140.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 28 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-367"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3240.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 28 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-368"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3240.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-370"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3240.0, 200.0, 152.0, 22.0 ],
					"text" : "prepend patch 13",
					"id" : "obj-371"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3240.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 28 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-372"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3140.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 28 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-374"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3200.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-376"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3200.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 28 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-377"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3300.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 60",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-379"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3300.0, 280.0, 152.0, 22.0 ],
					"text" : "prepend voice 13",
					"id" : "obj-380"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3400.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 29 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-382"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3400.0, 440.0, 168.0, 22.0 ],
					"text" : "prepend part 14 on",
					"id" : "obj-383"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3430.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-385"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3430.0, 320.0, 128.0, 22.0 ],
					"text" : "prepend ch 14",
					"id" : "obj-386"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3430.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 29 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-387"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3560.0, 130.0, 144.0, 22.0 ],
					"text" : "prepend pick 14",
					"id" : "obj-389"
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
					"patching_rect" : [ 3400.0, 100.0, 80.0, 15.0 ],
					"varname" : "P14Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 14 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-390"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 3400.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-391"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3560.0, 160.0, 144.0, 22.0 ],
					"text" : "prepend bank 14",
					"id" : "obj-392"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3400.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-393"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3500.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-394"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3400.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 29 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-395"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3500.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 29 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-396"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3500.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-398"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3500.0, 200.0, 152.0, 22.0 ],
					"text" : "prepend patch 14",
					"id" : "obj-399"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3500.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 29 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-400"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3400.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 29 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-402"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3460.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-404"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3460.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 29 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-405"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3560.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 61",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-407"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3560.0, 280.0, 152.0, 22.0 ],
					"text" : "prepend voice 14",
					"id" : "obj-408"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3660.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 30 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-410"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3660.0, 440.0, 168.0, 22.0 ],
					"text" : "prepend part 15 on",
					"id" : "obj-411"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3690.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-413"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3690.0, 320.0, 128.0, 22.0 ],
					"text" : "prepend ch 15",
					"id" : "obj-414"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3690.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 30 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-415"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3820.0, 130.0, 144.0, 22.0 ],
					"text" : "prepend pick 15",
					"id" : "obj-417"
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
					"patching_rect" : [ 3660.0, 100.0, 80.0, 15.0 ],
					"varname" : "P15Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 15 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-418"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 3660.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-419"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3820.0, 160.0, 144.0, 22.0 ],
					"text" : "prepend bank 15",
					"id" : "obj-420"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3660.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-421"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3760.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-422"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3660.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 30 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-423"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3760.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 30 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-424"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3760.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-426"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3760.0, 200.0, 152.0, 22.0 ],
					"text" : "prepend patch 15",
					"id" : "obj-427"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3760.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 30 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-428"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3660.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 30 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-430"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3720.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-432"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3720.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 30 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-433"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3820.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 62",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-435"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3820.0, 280.0, 152.0, 22.0 ],
					"text" : "prepend voice 15",
					"id" : "obj-436"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3920.0, 400.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 31 0",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-438"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3920.0, 440.0, 168.0, 22.0 ],
					"text" : "prepend part 16 on",
					"id" : "obj-439"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3950.0, 360.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-441"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3950.0, 320.0, 128.0, 22.0 ],
					"text" : "prepend ch 16",
					"id" : "obj-442"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3950.0, 440.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 31 1",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-443"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4080.0, 130.0, 144.0, 22.0 ],
					"text" : "prepend pick 16",
					"id" : "obj-445"
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
					"patching_rect" : [ 3920.0, 100.0, 80.0, 15.0 ],
					"varname" : "P16Bank",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Part 16 Bank",
							"parameter_shortname" : "bank",
							"parameter_type" : 2,
							"parameter_enum" : [ "USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "EXP-01", "EXP-02", "EXP-03", "EXP-04", "EXP-05", "EXP-06", "EXP-07", "EXP-08", "EXP-09", "EXP-10", "EXP-11", "EXP-12", "EXP-13", "EXP-14", "EXP-15", "EXP-16", "EXP-17", "EXP-18", "EXP-19" ],
							"parameter_mmax" : 25,
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1
						}

					}
,
					"id" : "obj-446"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 3920.0, 300.0, 64.0, 22.0 ],
					"text" : "t i i",
					"id" : "obj-447"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4080.0, 160.0, 144.0, 22.0 ],
					"text" : "prepend bank 16",
					"id" : "obj-448"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3920.0, 340.0, 168.0, 22.0 ],
					"text" : "expr ($i1 > 6) * 2",
					"id" : "obj-449"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4020.0, 330.0, 768.0, 22.0 ],
					"text" : "expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2",
					"id" : "obj-450"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3920.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 31 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-451"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4020.0, 480.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 31 3",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-452"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4020.0, 380.0, 48.0, 22.0 ],
					"text" : "- 1",
					"id" : "obj-454"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4020.0, 200.0, 152.0, 22.0 ],
					"text" : "prepend patch 16",
					"id" : "obj-455"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4020.0, 520.0, 216.0, 22.0 ],
					"text" : "js jvparam.js 1 0 31 4 2",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-456"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3920.0, 560.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 31 6",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-458"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3980.0, 360.0, 56.0, 22.0 ],
					"text" : "+ 64",
					"id" : "obj-460"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 3980.0, 600.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 31 7",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-461"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4080.0, 640.0, 200.0, 22.0 ],
					"text" : "js jvparam.js 1 0 0 63",
					"saved_object_attributes" : 					{
						"filename" : "jvparam.js",
						"parameter_enable" : 0
					}
,
					"id" : "obj-463"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4080.0, 280.0, 152.0, 22.0 ],
					"text" : "prepend voice 16",
					"id" : "obj-464"
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
					"patching_rect" : [ 20.0, 700.0, 986.0, 163.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 986.0, 163.0 ],
					"proportion" : 0.5,
					"id" : "obj-497"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-27", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-55", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-66", 0 ]
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
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-83", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"source" : [ "obj-95", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-99", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-106", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"source" : [ "obj-111", 1 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-116", 0 ]
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
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 0 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-122", 0 ]
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
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-125", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-128", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-130", 0 ]
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
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 0 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-134", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-142", 0 ],
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"source" : [ "obj-139", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 0 ],
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 0 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-148", 0 ],
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-148", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-150", 0 ],
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-150", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-152", 0 ],
					"source" : [ "obj-151", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-155", 0 ],
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 0 ],
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-158", 0 ],
					"source" : [ "obj-157", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"source" : [ "obj-157", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-163", 0 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-163", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-165", 0 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-165", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 0 ],
					"source" : [ "obj-166", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-168", 0 ],
					"source" : [ "obj-166", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"source" : [ "obj-167", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-171", 0 ],
					"source" : [ "obj-169", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-171", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-172", 0 ],
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-174", 0 ],
					"source" : [ "obj-173", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"source" : [ "obj-173", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-175", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-176", 0 ],
					"source" : [ "obj-174", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-178", 0 ],
					"source" : [ "obj-177", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-178", 0 ]
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
					"destination" : [ "obj-181", 0 ],
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-181", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 0 ],
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-184", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-187", 0 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-189", 0 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-190", 0 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 0 ],
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-193", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-195", 0 ],
					"source" : [ "obj-194", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 0 ],
					"source" : [ "obj-194", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-198", 0 ],
					"source" : [ "obj-195", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-197", 0 ],
					"source" : [ "obj-195", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-199", 0 ],
					"source" : [ "obj-197", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-199", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 0 ],
					"source" : [ "obj-198", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-200", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-202", 0 ],
					"source" : [ "obj-201", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-203", 0 ],
					"source" : [ "obj-201", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-203", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-204", 0 ],
					"source" : [ "obj-202", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-204", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 0 ],
					"source" : [ "obj-205", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-206", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-208", 0 ],
					"source" : [ "obj-207", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-209", 0 ],
					"source" : [ "obj-208", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-209", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-211", 0 ],
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-211", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-212", 0 ],
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-212", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-214", 0 ],
					"source" : [ "obj-213", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-215", 0 ],
					"source" : [ "obj-213", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-215", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-217", 0 ],
					"source" : [ "obj-216", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 0 ],
					"source" : [ "obj-216", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-218", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-219", 0 ],
					"source" : [ "obj-217", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-219", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"source" : [ "obj-220", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-221", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"source" : [ "obj-222", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-224", 0 ],
					"source" : [ "obj-222", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-224", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-226", 0 ],
					"source" : [ "obj-223", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-225", 0 ],
					"source" : [ "obj-223", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-227", 0 ],
					"source" : [ "obj-225", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-227", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-228", 0 ],
					"source" : [ "obj-226", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 0 ],
					"source" : [ "obj-229", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-231", 0 ],
					"source" : [ "obj-229", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-231", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-232", 0 ],
					"source" : [ "obj-230", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-232", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-234", 0 ],
					"source" : [ "obj-233", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-234", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-236", 0 ],
					"source" : [ "obj-235", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-237", 0 ],
					"source" : [ "obj-236", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-237", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-239", 0 ],
					"source" : [ "obj-238", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-239", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 0 ],
					"source" : [ "obj-238", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-240", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-242", 0 ],
					"source" : [ "obj-241", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-242", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-243", 0 ],
					"source" : [ "obj-241", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-243", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-245", 0 ],
					"source" : [ "obj-244", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 0 ],
					"source" : [ "obj-244", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-246", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-247", 0 ],
					"source" : [ "obj-245", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-247", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-249", 0 ],
					"source" : [ "obj-248", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-249", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-251", 0 ],
					"source" : [ "obj-250", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 0 ],
					"source" : [ "obj-250", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-252", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-254", 0 ],
					"source" : [ "obj-251", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-253", 0 ],
					"source" : [ "obj-251", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-255", 0 ],
					"source" : [ "obj-253", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-255", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-256", 0 ],
					"source" : [ "obj-254", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-256", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-258", 0 ],
					"source" : [ "obj-257", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-259", 0 ],
					"source" : [ "obj-257", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-259", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-260", 0 ],
					"source" : [ "obj-258", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-260", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-262", 0 ],
					"source" : [ "obj-261", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-262", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-264", 0 ],
					"source" : [ "obj-263", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-265", 0 ],
					"source" : [ "obj-264", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-265", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-267", 0 ],
					"source" : [ "obj-266", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-267", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-268", 0 ],
					"source" : [ "obj-266", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-268", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-270", 0 ],
					"source" : [ "obj-269", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-270", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-271", 0 ],
					"source" : [ "obj-269", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-271", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-273", 0 ],
					"source" : [ "obj-272", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-274", 0 ],
					"source" : [ "obj-272", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-274", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-275", 0 ],
					"source" : [ "obj-273", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-275", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-277", 0 ],
					"source" : [ "obj-276", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-277", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-279", 0 ],
					"source" : [ "obj-278", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-280", 0 ],
					"source" : [ "obj-278", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-280", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-282", 0 ],
					"source" : [ "obj-279", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-281", 0 ],
					"source" : [ "obj-279", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-283", 0 ],
					"source" : [ "obj-281", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-283", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-284", 0 ],
					"source" : [ "obj-282", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-284", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-286", 0 ],
					"source" : [ "obj-285", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-287", 0 ],
					"source" : [ "obj-285", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-287", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-288", 0 ],
					"source" : [ "obj-286", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-288", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-290", 0 ],
					"source" : [ "obj-289", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-290", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-292", 0 ],
					"source" : [ "obj-291", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-293", 0 ],
					"source" : [ "obj-292", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-293", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-295", 0 ],
					"source" : [ "obj-294", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-295", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-296", 0 ],
					"source" : [ "obj-294", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-296", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-298", 0 ],
					"source" : [ "obj-297", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-298", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-299", 0 ],
					"source" : [ "obj-297", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-299", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-301", 0 ],
					"source" : [ "obj-300", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-302", 0 ],
					"source" : [ "obj-300", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-302", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-303", 0 ],
					"source" : [ "obj-301", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-303", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-305", 0 ],
					"source" : [ "obj-304", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-305", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-307", 0 ],
					"source" : [ "obj-306", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-308", 0 ],
					"source" : [ "obj-306", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-308", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-310", 0 ],
					"source" : [ "obj-307", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-309", 0 ],
					"source" : [ "obj-307", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-311", 0 ],
					"source" : [ "obj-309", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-311", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-312", 0 ],
					"source" : [ "obj-310", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-312", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-314", 0 ],
					"source" : [ "obj-313", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-315", 0 ],
					"source" : [ "obj-313", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-315", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-316", 0 ],
					"source" : [ "obj-314", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-316", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-318", 0 ],
					"source" : [ "obj-317", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-318", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-320", 0 ],
					"source" : [ "obj-319", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-321", 0 ],
					"source" : [ "obj-320", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-321", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-323", 0 ],
					"source" : [ "obj-322", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-323", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-324", 0 ],
					"source" : [ "obj-322", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-324", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-326", 0 ],
					"source" : [ "obj-325", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-326", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-327", 0 ],
					"source" : [ "obj-325", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-327", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-329", 0 ],
					"source" : [ "obj-328", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-330", 0 ],
					"source" : [ "obj-328", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-330", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-331", 0 ],
					"source" : [ "obj-329", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-331", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-333", 0 ],
					"source" : [ "obj-332", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-333", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-335", 0 ],
					"source" : [ "obj-334", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-336", 0 ],
					"source" : [ "obj-334", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-336", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-338", 0 ],
					"source" : [ "obj-335", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-337", 0 ],
					"source" : [ "obj-335", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-339", 0 ],
					"source" : [ "obj-337", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-339", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-340", 0 ],
					"source" : [ "obj-338", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-340", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-342", 0 ],
					"source" : [ "obj-341", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-343", 0 ],
					"source" : [ "obj-341", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-343", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-344", 0 ],
					"source" : [ "obj-342", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-344", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-346", 0 ],
					"source" : [ "obj-345", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-346", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-348", 0 ],
					"source" : [ "obj-347", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-349", 0 ],
					"source" : [ "obj-348", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-349", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-351", 0 ],
					"source" : [ "obj-350", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-351", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-352", 0 ],
					"source" : [ "obj-350", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-352", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-354", 0 ],
					"source" : [ "obj-353", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-354", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-355", 0 ],
					"source" : [ "obj-353", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-355", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-357", 0 ],
					"source" : [ "obj-356", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-358", 0 ],
					"source" : [ "obj-356", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-358", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-359", 0 ],
					"source" : [ "obj-357", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-359", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-361", 0 ],
					"source" : [ "obj-360", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-361", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-363", 0 ],
					"source" : [ "obj-362", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-364", 0 ],
					"source" : [ "obj-362", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-364", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-366", 0 ],
					"source" : [ "obj-363", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-365", 0 ],
					"source" : [ "obj-363", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-367", 0 ],
					"source" : [ "obj-365", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-367", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-368", 0 ],
					"source" : [ "obj-366", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-368", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-370", 0 ],
					"source" : [ "obj-369", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-371", 0 ],
					"source" : [ "obj-369", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-371", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-372", 0 ],
					"source" : [ "obj-370", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-372", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-374", 0 ],
					"source" : [ "obj-373", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-374", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-376", 0 ],
					"source" : [ "obj-375", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-377", 0 ],
					"source" : [ "obj-376", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-377", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-379", 0 ],
					"source" : [ "obj-378", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-379", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-380", 0 ],
					"source" : [ "obj-378", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-380", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-382", 0 ],
					"source" : [ "obj-381", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-382", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-383", 0 ],
					"source" : [ "obj-381", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-383", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-385", 0 ],
					"source" : [ "obj-384", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-386", 0 ],
					"source" : [ "obj-384", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-386", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-387", 0 ],
					"source" : [ "obj-385", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-387", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-389", 0 ],
					"source" : [ "obj-388", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-389", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-391", 0 ],
					"source" : [ "obj-390", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-392", 0 ],
					"source" : [ "obj-390", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-392", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-394", 0 ],
					"source" : [ "obj-391", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-393", 0 ],
					"source" : [ "obj-391", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-395", 0 ],
					"source" : [ "obj-393", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-395", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-396", 0 ],
					"source" : [ "obj-394", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-396", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-398", 0 ],
					"source" : [ "obj-397", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-399", 0 ],
					"source" : [ "obj-397", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-399", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-400", 0 ],
					"source" : [ "obj-398", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-400", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-402", 0 ],
					"source" : [ "obj-401", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-402", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-404", 0 ],
					"source" : [ "obj-403", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-405", 0 ],
					"source" : [ "obj-404", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-405", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-407", 0 ],
					"source" : [ "obj-406", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-407", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-408", 0 ],
					"source" : [ "obj-406", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-408", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-410", 0 ],
					"source" : [ "obj-409", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-410", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-411", 0 ],
					"source" : [ "obj-409", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-411", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-413", 0 ],
					"source" : [ "obj-412", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-414", 0 ],
					"source" : [ "obj-412", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-414", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-415", 0 ],
					"source" : [ "obj-413", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-415", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-417", 0 ],
					"source" : [ "obj-416", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-417", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-419", 0 ],
					"source" : [ "obj-418", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-420", 0 ],
					"source" : [ "obj-418", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-420", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-422", 0 ],
					"source" : [ "obj-419", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-421", 0 ],
					"source" : [ "obj-419", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-423", 0 ],
					"source" : [ "obj-421", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-423", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-424", 0 ],
					"source" : [ "obj-422", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-424", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-426", 0 ],
					"source" : [ "obj-425", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-427", 0 ],
					"source" : [ "obj-425", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-427", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-428", 0 ],
					"source" : [ "obj-426", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-428", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-430", 0 ],
					"source" : [ "obj-429", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-430", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-432", 0 ],
					"source" : [ "obj-431", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-433", 0 ],
					"source" : [ "obj-432", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-433", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-435", 0 ],
					"source" : [ "obj-434", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-435", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-436", 0 ],
					"source" : [ "obj-434", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-436", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-438", 0 ],
					"source" : [ "obj-437", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-438", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-439", 0 ],
					"source" : [ "obj-437", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-439", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-441", 0 ],
					"source" : [ "obj-440", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-442", 0 ],
					"source" : [ "obj-440", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-442", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-443", 0 ],
					"source" : [ "obj-441", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-443", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-445", 0 ],
					"source" : [ "obj-444", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-445", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-447", 0 ],
					"source" : [ "obj-446", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-448", 0 ],
					"source" : [ "obj-446", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-448", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-450", 0 ],
					"source" : [ "obj-447", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-449", 0 ],
					"source" : [ "obj-447", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-451", 0 ],
					"source" : [ "obj-449", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-451", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-452", 0 ],
					"source" : [ "obj-450", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-452", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-454", 0 ],
					"source" : [ "obj-453", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-455", 0 ],
					"source" : [ "obj-453", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-455", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-456", 0 ],
					"source" : [ "obj-454", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-456", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-458", 0 ],
					"source" : [ "obj-457", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-458", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-460", 0 ],
					"source" : [ "obj-459", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-461", 0 ],
					"source" : [ "obj-460", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-461", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-463", 0 ],
					"source" : [ "obj-462", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-463", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-464", 0 ],
					"source" : [ "obj-462", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-464", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-17" : [ "Part 1 Switch", "on", 0 ],
			"obj-20" : [ "Part 1 Channel", "ch", 0 ],
			"obj-24" : [ "Part 1 Bank View", "bank", 0 ],
			"obj-26" : [ "Part 1 Bank", "bank", 0 ],
			"obj-33" : [ "Part 1 Patch", "patch", 0 ],
			"obj-37" : [ "Part 1 Level", "level", 0 ],
			"obj-39" : [ "Part 1 Pan", "pan", 0 ],
			"obj-42" : [ "Part 1 Voice Reserve", "voices", 0 ],
			"obj-45" : [ "Part 2 Switch", "on", 0 ],
			"obj-48" : [ "Part 2 Channel", "ch", 0 ],
			"obj-52" : [ "Part 2 Bank View", "bank", 0 ],
			"obj-54" : [ "Part 2 Bank", "bank", 0 ],
			"obj-61" : [ "Part 2 Patch", "patch", 0 ],
			"obj-65" : [ "Part 2 Level", "level", 0 ],
			"obj-67" : [ "Part 2 Pan", "pan", 0 ],
			"obj-70" : [ "Part 2 Voice Reserve", "voices", 0 ],
			"obj-73" : [ "Part 3 Switch", "on", 0 ],
			"obj-76" : [ "Part 3 Channel", "ch", 0 ],
			"obj-80" : [ "Part 3 Bank View", "bank", 0 ],
			"obj-82" : [ "Part 3 Bank", "bank", 0 ],
			"obj-89" : [ "Part 3 Patch", "patch", 0 ],
			"obj-93" : [ "Part 3 Level", "level", 0 ],
			"obj-95" : [ "Part 3 Pan", "pan", 0 ],
			"obj-98" : [ "Part 3 Voice Reserve", "voices", 0 ],
			"obj-101" : [ "Part 4 Switch", "on", 0 ],
			"obj-104" : [ "Part 4 Channel", "ch", 0 ],
			"obj-108" : [ "Part 4 Bank View", "bank", 0 ],
			"obj-110" : [ "Part 4 Bank", "bank", 0 ],
			"obj-117" : [ "Part 4 Patch", "patch", 0 ],
			"obj-121" : [ "Part 4 Level", "level", 0 ],
			"obj-123" : [ "Part 4 Pan", "pan", 0 ],
			"obj-126" : [ "Part 4 Voice Reserve", "voices", 0 ],
			"obj-129" : [ "Part 5 Switch", "on", 0 ],
			"obj-132" : [ "Part 5 Channel", "ch", 0 ],
			"obj-136" : [ "Part 5 Bank View", "bank", 0 ],
			"obj-138" : [ "Part 5 Bank", "bank", 0 ],
			"obj-145" : [ "Part 5 Patch", "patch", 0 ],
			"obj-149" : [ "Part 5 Level", "level", 0 ],
			"obj-151" : [ "Part 5 Pan", "pan", 0 ],
			"obj-154" : [ "Part 5 Voice Reserve", "voices", 0 ],
			"obj-157" : [ "Part 6 Switch", "on", 0 ],
			"obj-160" : [ "Part 6 Channel", "ch", 0 ],
			"obj-164" : [ "Part 6 Bank View", "bank", 0 ],
			"obj-166" : [ "Part 6 Bank", "bank", 0 ],
			"obj-173" : [ "Part 6 Patch", "patch", 0 ],
			"obj-177" : [ "Part 6 Level", "level", 0 ],
			"obj-179" : [ "Part 6 Pan", "pan", 0 ],
			"obj-182" : [ "Part 6 Voice Reserve", "voices", 0 ],
			"obj-185" : [ "Part 7 Switch", "on", 0 ],
			"obj-188" : [ "Part 7 Channel", "ch", 0 ],
			"obj-192" : [ "Part 7 Bank View", "bank", 0 ],
			"obj-194" : [ "Part 7 Bank", "bank", 0 ],
			"obj-201" : [ "Part 7 Patch", "patch", 0 ],
			"obj-205" : [ "Part 7 Level", "level", 0 ],
			"obj-207" : [ "Part 7 Pan", "pan", 0 ],
			"obj-210" : [ "Part 7 Voice Reserve", "voices", 0 ],
			"obj-213" : [ "Part 8 Switch", "on", 0 ],
			"obj-216" : [ "Part 8 Channel", "ch", 0 ],
			"obj-220" : [ "Part 8 Bank View", "bank", 0 ],
			"obj-222" : [ "Part 8 Bank", "bank", 0 ],
			"obj-229" : [ "Part 8 Patch", "patch", 0 ],
			"obj-233" : [ "Part 8 Level", "level", 0 ],
			"obj-235" : [ "Part 8 Pan", "pan", 0 ],
			"obj-238" : [ "Part 8 Voice Reserve", "voices", 0 ],
			"obj-241" : [ "Part 9 Switch", "on", 0 ],
			"obj-244" : [ "Part 9 Channel", "ch", 0 ],
			"obj-248" : [ "Part 9 Bank View", "bank", 0 ],
			"obj-250" : [ "Part 9 Bank", "bank", 0 ],
			"obj-257" : [ "Part 9 Patch", "patch", 0 ],
			"obj-261" : [ "Part 9 Level", "level", 0 ],
			"obj-263" : [ "Part 9 Pan", "pan", 0 ],
			"obj-266" : [ "Part 9 Voice Reserve", "voices", 0 ],
			"obj-269" : [ "Part 10 Switch", "on", 0 ],
			"obj-272" : [ "Part 10 Channel", "ch", 0 ],
			"obj-276" : [ "Part 10 Bank View", "bank", 0 ],
			"obj-278" : [ "Part 10 Bank", "bank", 0 ],
			"obj-285" : [ "Part 10 Patch", "patch", 0 ],
			"obj-289" : [ "Part 10 Level", "level", 0 ],
			"obj-291" : [ "Part 10 Pan", "pan", 0 ],
			"obj-294" : [ "Part 10 Voice Reserve", "voices", 0 ],
			"obj-297" : [ "Part 11 Switch", "on", 0 ],
			"obj-300" : [ "Part 11 Channel", "ch", 0 ],
			"obj-304" : [ "Part 11 Bank View", "bank", 0 ],
			"obj-306" : [ "Part 11 Bank", "bank", 0 ],
			"obj-313" : [ "Part 11 Patch", "patch", 0 ],
			"obj-317" : [ "Part 11 Level", "level", 0 ],
			"obj-319" : [ "Part 11 Pan", "pan", 0 ],
			"obj-322" : [ "Part 11 Voice Reserve", "voices", 0 ],
			"obj-325" : [ "Part 12 Switch", "on", 0 ],
			"obj-328" : [ "Part 12 Channel", "ch", 0 ],
			"obj-332" : [ "Part 12 Bank View", "bank", 0 ],
			"obj-334" : [ "Part 12 Bank", "bank", 0 ],
			"obj-341" : [ "Part 12 Patch", "patch", 0 ],
			"obj-345" : [ "Part 12 Level", "level", 0 ],
			"obj-347" : [ "Part 12 Pan", "pan", 0 ],
			"obj-350" : [ "Part 12 Voice Reserve", "voices", 0 ],
			"obj-353" : [ "Part 13 Switch", "on", 0 ],
			"obj-356" : [ "Part 13 Channel", "ch", 0 ],
			"obj-360" : [ "Part 13 Bank View", "bank", 0 ],
			"obj-362" : [ "Part 13 Bank", "bank", 0 ],
			"obj-369" : [ "Part 13 Patch", "patch", 0 ],
			"obj-373" : [ "Part 13 Level", "level", 0 ],
			"obj-375" : [ "Part 13 Pan", "pan", 0 ],
			"obj-378" : [ "Part 13 Voice Reserve", "voices", 0 ],
			"obj-381" : [ "Part 14 Switch", "on", 0 ],
			"obj-384" : [ "Part 14 Channel", "ch", 0 ],
			"obj-388" : [ "Part 14 Bank View", "bank", 0 ],
			"obj-390" : [ "Part 14 Bank", "bank", 0 ],
			"obj-397" : [ "Part 14 Patch", "patch", 0 ],
			"obj-401" : [ "Part 14 Level", "level", 0 ],
			"obj-403" : [ "Part 14 Pan", "pan", 0 ],
			"obj-406" : [ "Part 14 Voice Reserve", "voices", 0 ],
			"obj-409" : [ "Part 15 Switch", "on", 0 ],
			"obj-412" : [ "Part 15 Channel", "ch", 0 ],
			"obj-416" : [ "Part 15 Bank View", "bank", 0 ],
			"obj-418" : [ "Part 15 Bank", "bank", 0 ],
			"obj-425" : [ "Part 15 Patch", "patch", 0 ],
			"obj-429" : [ "Part 15 Level", "level", 0 ],
			"obj-431" : [ "Part 15 Pan", "pan", 0 ],
			"obj-434" : [ "Part 15 Voice Reserve", "voices", 0 ],
			"obj-437" : [ "Part 16 Switch", "on", 0 ],
			"obj-440" : [ "Part 16 Channel", "ch", 0 ],
			"obj-444" : [ "Part 16 Bank View", "bank", 0 ],
			"obj-446" : [ "Part 16 Bank", "bank", 0 ],
			"obj-453" : [ "Part 16 Patch", "patch", 0 ],
			"obj-457" : [ "Part 16 Level", "level", 0 ],
			"obj-459" : [ "Part 16 Pan", "pan", 0 ],
			"obj-462" : [ "Part 16 Voice Reserve", "voices", 0 ],
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
