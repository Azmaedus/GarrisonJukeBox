local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local zones = {
	{L["ZONE_BLADESEDGE"], 475},
	{L["ZONE_HELLFIRE"], 465},
	{L["ZONE_NAGRAN"], 477},
	{L["ZONE_NETHERSTORM"], 479},
	{L["ZONE_SHADOWMOON"], 473},
	{L["ZONE_SHATTRATH"], 481},
	{L["ZONE_TEROKKAR"], 478},
	{L["ZONE_ZANGARMARSH"], 467},
}

GJB.zonetable[GJB.ZONE_OUTLAND] = zones