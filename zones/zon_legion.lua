local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local zones = {
	{L["ZONE_LEGION_ACHERUS"], 1021},
	{L["ZONE_LEGION_AZSUNA"], 1015},
	{L["ZONE_LEGION_BROKENSHORE"], 1021},
	{L["ZONE_LEGION_DALARAN"], 1014},
	{L["ZONE_LEGION_EYEOFAZSHARA"], 1096},
	{L["ZONE_LEGION_HIGHMOUNTAIN"], 1024},
	{L["ZONE_LEGION_SKYHOLD"], 1035},
	{L["ZONE_LEGION_STORMHEIM"], 1017},
	{L["ZONE_LEGION_SURAMAR"], 1033},
	{L["ZONE_LEGION_VALSHARA"], 1018},
}

GJB.zonetable[GJB.ZONE_LEGION] = zones