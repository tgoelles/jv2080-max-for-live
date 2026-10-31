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
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 20.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-4"
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
					"presentation_rect" : [ 22.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-6"
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
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 37.0, 54.0, 15.0 ],
					"varname" : "P1Bank",
					"hint" : "Part 1 patch bank",
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
					"id" : "obj-9"
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
					"presentation_rect" : [ 4.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-15"
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
					"presentation_rect" : [ 3.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-18"
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
					"presentation_rect" : [ 25.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-20"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 280.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 65.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-23"
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
					"presentation_rect" : [ 83.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
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
					"patching_rect" : [ 280.0, 100.0, 80.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 65.0, 37.0, 54.0, 15.0 ],
					"varname" : "P2Bank",
					"hint" : "Part 2 patch bank",
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
					"id" : "obj-28"
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
					"presentation_rect" : [ 65.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-34"
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
					"presentation_rect" : [ 64.0, 74.0, 22.0, 88.0 ],
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
					"patching_rect" : [ 340.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 86.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-39"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 540.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 126.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-42"
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
					"presentation_rect" : [ 144.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-44"
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
					"presentation" : 1,
					"presentation_rect" : [ 126.0, 37.0, 54.0, 15.0 ],
					"varname" : "P3Bank",
					"hint" : "Part 3 patch bank",
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
					"id" : "obj-47"
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
					"presentation_rect" : [ 126.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-53"
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
					"presentation_rect" : [ 125.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-56"
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
					"presentation_rect" : [ 147.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-58"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 800.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 187.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-61"
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
					"presentation_rect" : [ 205.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-63"
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
					"presentation" : 1,
					"presentation_rect" : [ 187.0, 37.0, 54.0, 15.0 ],
					"varname" : "P4Bank",
					"hint" : "Part 4 patch bank",
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
					"id" : "obj-66"
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
					"presentation_rect" : [ 187.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-72"
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
					"presentation_rect" : [ 186.0, 74.0, 22.0, 88.0 ],
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
					"patching_rect" : [ 860.0, 140.0, 36.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 208.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-77"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1060.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 19.0, 15.0, 15.0 ],
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
					"patching_rect" : [ 1090.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-82"
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
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 37.0, 54.0, 15.0 ],
					"varname" : "P5Bank",
					"hint" : "Part 5 patch bank",
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
					"id" : "obj-85"
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
					"presentation_rect" : [ 248.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-91"
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
					"presentation_rect" : [ 247.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-94"
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
					"presentation_rect" : [ 269.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-96"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1320.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-99"
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
					"presentation_rect" : [ 327.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-101"
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
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 37.0, 54.0, 15.0 ],
					"varname" : "P6Bank",
					"hint" : "Part 6 patch bank",
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
					"patching_rect" : [ 1420.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-110"
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
					"presentation_rect" : [ 308.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-113"
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
					"presentation_rect" : [ 330.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-115"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1580.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 370.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-118"
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
					"presentation_rect" : [ 388.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-120"
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
					"presentation" : 1,
					"presentation_rect" : [ 370.0, 37.0, 54.0, 15.0 ],
					"varname" : "P7Bank",
					"hint" : "Part 7 patch bank",
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
					"patching_rect" : [ 1680.0, 100.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 370.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-129"
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
					"presentation_rect" : [ 369.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-132"
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
					"presentation_rect" : [ 391.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-134"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1840.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 431.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-137"
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
					"presentation_rect" : [ 449.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-139"
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
					"presentation" : 1,
					"presentation_rect" : [ 431.0, 37.0, 54.0, 15.0 ],
					"varname" : "P8Bank",
					"hint" : "Part 8 patch bank",
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
					"id" : "obj-142"
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
					"presentation_rect" : [ 431.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-148"
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
					"presentation_rect" : [ 430.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-151"
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
					"presentation_rect" : [ 452.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-153"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2100.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 492.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-156"
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
					"presentation_rect" : [ 510.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-158"
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
					"presentation" : 1,
					"presentation_rect" : [ 492.0, 37.0, 54.0, 15.0 ],
					"varname" : "P9Bank",
					"hint" : "Part 9 patch bank",
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
					"id" : "obj-161"
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
					"presentation_rect" : [ 492.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-167"
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
					"presentation_rect" : [ 491.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-170"
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
					"presentation_rect" : [ 513.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-172"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2360.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 553.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-175"
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
					"presentation_rect" : [ 571.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-177"
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
					"presentation" : 1,
					"presentation_rect" : [ 553.0, 37.0, 54.0, 15.0 ],
					"varname" : "P10Bank",
					"hint" : "Part 10 patch bank",
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
					"id" : "obj-180"
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
					"presentation_rect" : [ 553.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-186"
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
					"presentation_rect" : [ 552.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-189"
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
					"presentation_rect" : [ 574.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-191"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2620.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 614.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-194"
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
					"presentation_rect" : [ 632.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-196"
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
					"presentation" : 1,
					"presentation_rect" : [ 614.0, 37.0, 54.0, 15.0 ],
					"varname" : "P11Bank",
					"hint" : "Part 11 patch bank",
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
					"id" : "obj-199"
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
					"presentation_rect" : [ 614.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-205"
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
					"presentation_rect" : [ 613.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-208"
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
					"presentation_rect" : [ 635.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-210"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2880.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 675.0, 19.0, 15.0, 15.0 ],
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
					"patching_rect" : [ 2910.0, 60.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 693.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-215"
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
					"presentation" : 1,
					"presentation_rect" : [ 675.0, 37.0, 54.0, 15.0 ],
					"varname" : "P12Bank",
					"hint" : "Part 12 patch bank",
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
					"id" : "obj-218"
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
					"presentation_rect" : [ 675.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-224"
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
					"presentation_rect" : [ 674.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-227"
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
					"presentation_rect" : [ 696.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-229"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3140.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 736.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-232"
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
					"presentation_rect" : [ 754.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-234"
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
					"presentation" : 1,
					"presentation_rect" : [ 736.0, 37.0, 54.0, 15.0 ],
					"varname" : "P13Bank",
					"hint" : "Part 13 patch bank",
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
					"id" : "obj-237"
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
					"presentation_rect" : [ 736.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-243"
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
					"presentation_rect" : [ 735.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-246"
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
					"presentation_rect" : [ 757.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-248"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3400.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 797.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-251"
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
					"presentation_rect" : [ 815.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-253"
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
					"presentation" : 1,
					"presentation_rect" : [ 797.0, 37.0, 54.0, 15.0 ],
					"varname" : "P14Bank",
					"hint" : "Part 14 patch bank",
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
					"id" : "obj-256"
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
					"presentation_rect" : [ 797.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-262"
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
					"presentation_rect" : [ 796.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-265"
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
					"presentation_rect" : [ 818.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-267"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3660.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 858.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-270"
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
					"presentation_rect" : [ 876.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
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
					"patching_rect" : [ 3660.0, 100.0, 80.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 858.0, 37.0, 54.0, 15.0 ],
					"varname" : "P15Bank",
					"hint" : "Part 15 patch bank",
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
					"id" : "obj-275"
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
					"presentation_rect" : [ 858.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-281"
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
					"presentation_rect" : [ 857.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-284"
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
					"presentation_rect" : [ 879.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-286"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 1,
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 3920.0, 60.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 919.0, 19.0, 15.0, 15.0 ],
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
					"id" : "obj-289"
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
					"presentation_rect" : [ 937.0, 19.0, 36.0, 15.0 ],
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
							"parameter_unitstyle" : 0
						}

					}
,
					"id" : "obj-291"
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
					"presentation" : 1,
					"presentation_rect" : [ 919.0, 37.0, 54.0, 15.0 ],
					"varname" : "P16Bank",
					"hint" : "Part 16 patch bank",
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
					"id" : "obj-294"
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
					"presentation_rect" : [ 919.0, 55.0, 54.0, 15.0 ],
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
					"id" : "obj-300"
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
					"presentation_rect" : [ 918.0, 74.0, 22.0, 88.0 ],
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
					"id" : "obj-303"
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
					"presentation_rect" : [ 940.0, 74.0, 36.0, 48.0 ],
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
					"id" : "obj-305"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 2.0, 0.0, 58.0, 18.0 ],
					"text" : "1",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-308"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 280.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 0.0, 58.0, 18.0 ],
					"text" : "2",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-309"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 540.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 124.0, 0.0, 58.0, 18.0 ],
					"text" : "3",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-310"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 800.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 185.0, 0.0, 58.0, 18.0 ],
					"text" : "4",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-311"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1060.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 246.0, 0.0, 58.0, 18.0 ],
					"text" : "5",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-312"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1320.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 307.0, 0.0, 58.0, 18.0 ],
					"text" : "6",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-313"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1580.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 0.0, 58.0, 18.0 ],
					"text" : "7",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-314"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1840.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 429.0, 0.0, 58.0, 18.0 ],
					"text" : "8",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-315"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2100.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 490.0, 0.0, 58.0, 18.0 ],
					"text" : "9",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-316"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2360.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 551.0, 0.0, 58.0, 18.0 ],
					"text" : "10",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-317"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2620.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 612.0, 0.0, 58.0, 18.0 ],
					"text" : "11",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-318"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2880.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 673.0, 0.0, 58.0, 18.0 ],
					"text" : "12",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-319"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3140.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 734.0, 0.0, 58.0, 18.0 ],
					"text" : "13",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-320"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3400.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 795.0, 0.0, 58.0, 18.0 ],
					"text" : "14",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-321"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3660.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 856.0, 0.0, 58.0, 18.0 ],
					"text" : "15",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-322"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3920.0, 20.0, 40.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 917.0, 0.0, 58.0, 18.0 ],
					"text" : "16",
					"textcolor" : [ 0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0 ],
					"textjustification" : 1,
					"id" : "obj-323"
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
					"id" : "obj-5"
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
					"id" : "obj-7"
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
					"id" : "obj-8"
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
					"id" : "obj-10"
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
					"id" : "obj-11"
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
					"id" : "obj-12"
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
					"id" : "obj-13"
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
					"id" : "obj-14"
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
					"id" : "obj-16"
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
					"id" : "obj-17"
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
					"id" : "obj-19"
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
					"id" : "obj-21"
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
					"id" : "obj-22"
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
					"id" : "obj-24"
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
					"id" : "obj-26"
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
					"id" : "obj-27"
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
					"id" : "obj-29"
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
					"id" : "obj-30"
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
					"id" : "obj-31"
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
					"id" : "obj-32"
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
					"id" : "obj-33"
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
					"id" : "obj-35"
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
					"id" : "obj-36"
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
					"id" : "obj-38"
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
					"id" : "obj-40"
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
					"id" : "obj-41"
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
					"id" : "obj-43"
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
					"id" : "obj-45"
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
					"id" : "obj-46"
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
					"id" : "obj-48"
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
					"id" : "obj-49"
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
					"id" : "obj-50"
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
					"id" : "obj-51"
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
					"id" : "obj-52"
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
					"id" : "obj-54"
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
					"id" : "obj-55"
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
					"id" : "obj-57"
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
					"id" : "obj-59"
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
					"id" : "obj-60"
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
					"id" : "obj-62"
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
					"id" : "obj-64"
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
					"id" : "obj-65"
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
					"id" : "obj-67"
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
					"id" : "obj-68"
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
					"id" : "obj-69"
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
					"id" : "obj-70"
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
					"id" : "obj-71"
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
					"id" : "obj-73"
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
					"id" : "obj-74"
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
					"id" : "obj-76"
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
					"id" : "obj-78"
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
					"id" : "obj-79"
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
					"id" : "obj-81"
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
					"id" : "obj-83"
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
					"id" : "obj-84"
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
					"id" : "obj-86"
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
					"id" : "obj-87"
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
					"id" : "obj-88"
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
					"id" : "obj-89"
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
					"id" : "obj-90"
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
					"id" : "obj-92"
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
					"id" : "obj-93"
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
					"id" : "obj-95"
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
					"id" : "obj-97"
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
					"id" : "obj-98"
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
					"id" : "obj-100"
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
					"id" : "obj-102"
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
					"id" : "obj-103"
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
					"id" : "obj-105"
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
					"id" : "obj-106"
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
					"id" : "obj-107"
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
					"id" : "obj-108"
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
					"id" : "obj-109"
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
					"id" : "obj-111"
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
					"id" : "obj-112"
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
					"id" : "obj-114"
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
					"id" : "obj-116"
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
					"id" : "obj-117"
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
					"id" : "obj-119"
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
					"id" : "obj-121"
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
					"id" : "obj-122"
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
					"id" : "obj-124"
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
					"id" : "obj-125"
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
					"id" : "obj-126"
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
					"id" : "obj-127"
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
					"id" : "obj-128"
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
					"id" : "obj-130"
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
					"id" : "obj-131"
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
					"id" : "obj-133"
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
					"id" : "obj-135"
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
					"id" : "obj-136"
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
					"id" : "obj-138"
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
					"id" : "obj-140"
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
					"id" : "obj-141"
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
					"id" : "obj-143"
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
					"id" : "obj-144"
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
					"id" : "obj-145"
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
					"id" : "obj-146"
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
					"id" : "obj-147"
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
					"id" : "obj-149"
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
					"id" : "obj-150"
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
					"id" : "obj-152"
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
					"id" : "obj-154"
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
					"id" : "obj-155"
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
					"id" : "obj-157"
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
					"id" : "obj-159"
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
					"id" : "obj-160"
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
					"id" : "obj-162"
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
					"id" : "obj-163"
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
					"id" : "obj-164"
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
					"id" : "obj-165"
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
					"id" : "obj-166"
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
					"id" : "obj-168"
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
					"id" : "obj-169"
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
					"id" : "obj-171"
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
					"id" : "obj-173"
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
					"id" : "obj-174"
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
					"id" : "obj-176"
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
					"id" : "obj-178"
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
					"id" : "obj-179"
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
					"id" : "obj-181"
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
					"id" : "obj-182"
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
					"id" : "obj-183"
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
					"id" : "obj-184"
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
					"id" : "obj-185"
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
					"id" : "obj-187"
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
					"id" : "obj-188"
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
					"id" : "obj-190"
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
					"id" : "obj-192"
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
					"id" : "obj-193"
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
					"id" : "obj-195"
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
					"id" : "obj-197"
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
					"id" : "obj-198"
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
					"id" : "obj-200"
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
					"id" : "obj-201"
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
					"id" : "obj-202"
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
					"id" : "obj-203"
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
					"id" : "obj-204"
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
					"id" : "obj-206"
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
					"id" : "obj-207"
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
					"id" : "obj-209"
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
					"id" : "obj-211"
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
					"id" : "obj-212"
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
					"id" : "obj-214"
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
					"id" : "obj-216"
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
					"id" : "obj-217"
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
					"id" : "obj-219"
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
					"id" : "obj-220"
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
					"id" : "obj-221"
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
					"id" : "obj-222"
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
					"id" : "obj-223"
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
					"id" : "obj-225"
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
					"id" : "obj-226"
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
					"id" : "obj-228"
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
					"id" : "obj-230"
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
					"id" : "obj-231"
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
					"id" : "obj-233"
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
					"id" : "obj-235"
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
					"id" : "obj-236"
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
					"id" : "obj-238"
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
					"id" : "obj-239"
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
					"id" : "obj-240"
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
					"id" : "obj-241"
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
					"id" : "obj-242"
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
					"id" : "obj-244"
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
					"id" : "obj-245"
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
					"id" : "obj-247"
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
					"id" : "obj-249"
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
					"id" : "obj-250"
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
					"id" : "obj-252"
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
					"id" : "obj-254"
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
					"id" : "obj-255"
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
					"id" : "obj-257"
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
					"id" : "obj-258"
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
					"id" : "obj-259"
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
					"id" : "obj-260"
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
					"id" : "obj-261"
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
					"id" : "obj-263"
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
					"id" : "obj-264"
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
					"id" : "obj-266"
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
					"id" : "obj-268"
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
					"id" : "obj-269"
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
					"id" : "obj-271"
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
					"id" : "obj-273"
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
					"id" : "obj-274"
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
					"id" : "obj-276"
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
					"id" : "obj-277"
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
					"id" : "obj-278"
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
					"id" : "obj-279"
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
					"id" : "obj-280"
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
					"id" : "obj-282"
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
					"id" : "obj-283"
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
					"id" : "obj-285"
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
					"id" : "obj-287"
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
					"id" : "obj-288"
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
					"id" : "obj-290"
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
					"id" : "obj-292"
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
					"id" : "obj-293"
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
					"id" : "obj-295"
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
					"id" : "obj-296"
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
					"id" : "obj-297"
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
					"id" : "obj-298"
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
					"id" : "obj-299"
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
					"id" : "obj-301"
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
					"id" : "obj-302"
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
					"id" : "obj-304"
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
					"id" : "obj-306"
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
					"id" : "obj-307"
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
					"id" : "obj-324"
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
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-6", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-28", 0 ]
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
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-29", 1 ]
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
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-35", 0 ]
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
					"destination" : [ "obj-45", 0 ],
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
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-47", 0 ]
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
					"destination" : [ "obj-49", 0 ],
					"source" : [ "obj-48", 1 ]
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
					"destination" : [ "obj-52", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-59", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-67", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"source" : [ "obj-69", 0 ]
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
					"destination" : [ "obj-73", 0 ],
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
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-78", 0 ]
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
					"destination" : [ "obj-2", 1 ],
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
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"source" : [ "obj-85", 0 ]
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
					"destination" : [ "obj-87", 0 ],
					"source" : [ "obj-86", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-98", 0 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-98", 0 ]
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
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-107", 0 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"source" : [ "obj-105", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-108", 0 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-112", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-119", 0 ]
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
					"destination" : [ "obj-126", 0 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-124", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-125", 0 ]
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
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-131", 0 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-136", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 0 ],
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 0 ],
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"source" : [ "obj-143", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 0 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-146", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-154", 0 ],
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
					"destination" : [ "obj-157", 0 ],
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-157", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 0 ],
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-164", 0 ],
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-163", 0 ],
					"source" : [ "obj-162", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-165", 0 ],
					"source" : [ "obj-163", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-165", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-166", 0 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-166", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-168", 0 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-169", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-171", 0 ],
					"source" : [ "obj-170", 0 ]
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
					"destination" : [ "obj-173", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-174", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-176", 0 ],
					"source" : [ "obj-175", 0 ]
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
					"destination" : [ "obj-179", 0 ],
					"source" : [ "obj-178", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-183", 0 ],
					"source" : [ "obj-181", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-182", 0 ],
					"source" : [ "obj-181", 1 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-185", 0 ],
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-187", 0 ],
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 0 ],
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-190", 0 ],
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-192", 0 ],
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
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-195", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-197", 0 ],
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-198", 0 ],
					"source" : [ "obj-197", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-198", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 0 ],
					"source" : [ "obj-199", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-202", 0 ],
					"source" : [ "obj-200", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-201", 0 ],
					"source" : [ "obj-200", 1 ]
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
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-207", 0 ],
					"source" : [ "obj-206", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-212", 0 ],
					"source" : [ "obj-211", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"destination" : [ "obj-216", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-217", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-219", 0 ],
					"source" : [ "obj-218", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"source" : [ "obj-219", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-220", 0 ],
					"source" : [ "obj-219", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-222", 0 ],
					"source" : [ "obj-220", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-222", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"source" : [ "obj-221", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-223", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-225", 0 ],
					"source" : [ "obj-224", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-226", 0 ],
					"source" : [ "obj-225", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-226", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-228", 0 ],
					"source" : [ "obj-227", 0 ]
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
					"source" : [ "obj-230", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-231", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"source" : [ "obj-232", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-233", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-235", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-236", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-238", 0 ],
					"source" : [ "obj-237", 0 ]
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
					"destination" : [ "obj-239", 0 ],
					"source" : [ "obj-238", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-241", 0 ],
					"source" : [ "obj-239", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-241", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-242", 0 ],
					"source" : [ "obj-240", 0 ]
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
					"destination" : [ "obj-244", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-245", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-247", 0 ],
					"source" : [ "obj-246", 0 ]
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
					"destination" : [ "obj-250", 0 ],
					"source" : [ "obj-249", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-250", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 0 ],
					"source" : [ "obj-251", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-252", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-254", 0 ],
					"source" : [ "obj-253", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-255", 0 ],
					"source" : [ "obj-254", 0 ]
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
					"destination" : [ "obj-257", 0 ],
					"source" : [ "obj-256", 0 ]
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
					"destination" : [ "obj-258", 0 ],
					"source" : [ "obj-257", 1 ]
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
					"destination" : [ "obj-261", 0 ],
					"source" : [ "obj-259", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-261", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-263", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-264", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-266", 0 ],
					"source" : [ "obj-265", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-266", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-268", 0 ],
					"source" : [ "obj-267", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-269", 0 ],
					"source" : [ "obj-268", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-269", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-271", 0 ],
					"source" : [ "obj-270", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
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
					"source" : [ "obj-273", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-274", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-276", 0 ],
					"source" : [ "obj-275", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-278", 0 ],
					"source" : [ "obj-276", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-277", 0 ],
					"source" : [ "obj-276", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-279", 0 ],
					"source" : [ "obj-277", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-279", 0 ]
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-280", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-282", 0 ],
					"source" : [ "obj-281", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-283", 0 ],
					"source" : [ "obj-282", 0 ]
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
					"destination" : [ "obj-285", 0 ],
					"source" : [ "obj-284", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-285", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-287", 0 ],
					"source" : [ "obj-286", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-288", 0 ],
					"source" : [ "obj-287", 0 ]
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
					"destination" : [ "obj-297", 0 ],
					"source" : [ "obj-295", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-296", 0 ],
					"source" : [ "obj-295", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-298", 0 ],
					"source" : [ "obj-296", 0 ]
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
					"destination" : [ "obj-2", 1 ],
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
					"source" : [ "obj-301", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-302", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-304", 0 ],
					"source" : [ "obj-303", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-304", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-306", 0 ],
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
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-307", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-4" : [ "Part 1 Switch", "on", 0 ],
			"obj-6" : [ "Part 1 Channel", "ch", 0 ],
			"obj-9" : [ "Part 1 Bank", "bank", 0 ],
			"obj-15" : [ "Part 1 Patch", "patch", 0 ],
			"obj-18" : [ "Part 1 Level", "level", 0 ],
			"obj-20" : [ "Part 1 Pan", "pan", 0 ],
			"obj-23" : [ "Part 2 Switch", "on", 0 ],
			"obj-25" : [ "Part 2 Channel", "ch", 0 ],
			"obj-28" : [ "Part 2 Bank", "bank", 0 ],
			"obj-34" : [ "Part 2 Patch", "patch", 0 ],
			"obj-37" : [ "Part 2 Level", "level", 0 ],
			"obj-39" : [ "Part 2 Pan", "pan", 0 ],
			"obj-42" : [ "Part 3 Switch", "on", 0 ],
			"obj-44" : [ "Part 3 Channel", "ch", 0 ],
			"obj-47" : [ "Part 3 Bank", "bank", 0 ],
			"obj-53" : [ "Part 3 Patch", "patch", 0 ],
			"obj-56" : [ "Part 3 Level", "level", 0 ],
			"obj-58" : [ "Part 3 Pan", "pan", 0 ],
			"obj-61" : [ "Part 4 Switch", "on", 0 ],
			"obj-63" : [ "Part 4 Channel", "ch", 0 ],
			"obj-66" : [ "Part 4 Bank", "bank", 0 ],
			"obj-72" : [ "Part 4 Patch", "patch", 0 ],
			"obj-75" : [ "Part 4 Level", "level", 0 ],
			"obj-77" : [ "Part 4 Pan", "pan", 0 ],
			"obj-80" : [ "Part 5 Switch", "on", 0 ],
			"obj-82" : [ "Part 5 Channel", "ch", 0 ],
			"obj-85" : [ "Part 5 Bank", "bank", 0 ],
			"obj-91" : [ "Part 5 Patch", "patch", 0 ],
			"obj-94" : [ "Part 5 Level", "level", 0 ],
			"obj-96" : [ "Part 5 Pan", "pan", 0 ],
			"obj-99" : [ "Part 6 Switch", "on", 0 ],
			"obj-101" : [ "Part 6 Channel", "ch", 0 ],
			"obj-104" : [ "Part 6 Bank", "bank", 0 ],
			"obj-110" : [ "Part 6 Patch", "patch", 0 ],
			"obj-113" : [ "Part 6 Level", "level", 0 ],
			"obj-115" : [ "Part 6 Pan", "pan", 0 ],
			"obj-118" : [ "Part 7 Switch", "on", 0 ],
			"obj-120" : [ "Part 7 Channel", "ch", 0 ],
			"obj-123" : [ "Part 7 Bank", "bank", 0 ],
			"obj-129" : [ "Part 7 Patch", "patch", 0 ],
			"obj-132" : [ "Part 7 Level", "level", 0 ],
			"obj-134" : [ "Part 7 Pan", "pan", 0 ],
			"obj-137" : [ "Part 8 Switch", "on", 0 ],
			"obj-139" : [ "Part 8 Channel", "ch", 0 ],
			"obj-142" : [ "Part 8 Bank", "bank", 0 ],
			"obj-148" : [ "Part 8 Patch", "patch", 0 ],
			"obj-151" : [ "Part 8 Level", "level", 0 ],
			"obj-153" : [ "Part 8 Pan", "pan", 0 ],
			"obj-156" : [ "Part 9 Switch", "on", 0 ],
			"obj-158" : [ "Part 9 Channel", "ch", 0 ],
			"obj-161" : [ "Part 9 Bank", "bank", 0 ],
			"obj-167" : [ "Part 9 Patch", "patch", 0 ],
			"obj-170" : [ "Part 9 Level", "level", 0 ],
			"obj-172" : [ "Part 9 Pan", "pan", 0 ],
			"obj-175" : [ "Part 10 Switch", "on", 0 ],
			"obj-177" : [ "Part 10 Channel", "ch", 0 ],
			"obj-180" : [ "Part 10 Bank", "bank", 0 ],
			"obj-186" : [ "Part 10 Patch", "patch", 0 ],
			"obj-189" : [ "Part 10 Level", "level", 0 ],
			"obj-191" : [ "Part 10 Pan", "pan", 0 ],
			"obj-194" : [ "Part 11 Switch", "on", 0 ],
			"obj-196" : [ "Part 11 Channel", "ch", 0 ],
			"obj-199" : [ "Part 11 Bank", "bank", 0 ],
			"obj-205" : [ "Part 11 Patch", "patch", 0 ],
			"obj-208" : [ "Part 11 Level", "level", 0 ],
			"obj-210" : [ "Part 11 Pan", "pan", 0 ],
			"obj-213" : [ "Part 12 Switch", "on", 0 ],
			"obj-215" : [ "Part 12 Channel", "ch", 0 ],
			"obj-218" : [ "Part 12 Bank", "bank", 0 ],
			"obj-224" : [ "Part 12 Patch", "patch", 0 ],
			"obj-227" : [ "Part 12 Level", "level", 0 ],
			"obj-229" : [ "Part 12 Pan", "pan", 0 ],
			"obj-232" : [ "Part 13 Switch", "on", 0 ],
			"obj-234" : [ "Part 13 Channel", "ch", 0 ],
			"obj-237" : [ "Part 13 Bank", "bank", 0 ],
			"obj-243" : [ "Part 13 Patch", "patch", 0 ],
			"obj-246" : [ "Part 13 Level", "level", 0 ],
			"obj-248" : [ "Part 13 Pan", "pan", 0 ],
			"obj-251" : [ "Part 14 Switch", "on", 0 ],
			"obj-253" : [ "Part 14 Channel", "ch", 0 ],
			"obj-256" : [ "Part 14 Bank", "bank", 0 ],
			"obj-262" : [ "Part 14 Patch", "patch", 0 ],
			"obj-265" : [ "Part 14 Level", "level", 0 ],
			"obj-267" : [ "Part 14 Pan", "pan", 0 ],
			"obj-270" : [ "Part 15 Switch", "on", 0 ],
			"obj-272" : [ "Part 15 Channel", "ch", 0 ],
			"obj-275" : [ "Part 15 Bank", "bank", 0 ],
			"obj-281" : [ "Part 15 Patch", "patch", 0 ],
			"obj-284" : [ "Part 15 Level", "level", 0 ],
			"obj-286" : [ "Part 15 Pan", "pan", 0 ],
			"obj-289" : [ "Part 16 Switch", "on", 0 ],
			"obj-291" : [ "Part 16 Channel", "ch", 0 ],
			"obj-294" : [ "Part 16 Bank", "bank", 0 ],
			"obj-300" : [ "Part 16 Patch", "patch", 0 ],
			"obj-303" : [ "Part 16 Level", "level", 0 ],
			"obj-305" : [ "Part 16 Pan", "pan", 0 ],
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
