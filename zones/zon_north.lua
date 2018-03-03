local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local zones = {
	{L["ZONE_BOREANTUNDRA"], 486},
	{L["ZONE_CRYSTALSONG"], 510},
	{L["ZONE_DALARAN"], 504},
	{L["ZONE_DRAGONBLIGHT"], 488},
	{L["ZONE_GRIZZLYHILLS"], 490},
	{L["ZONE_HOWLINGFJORD"], 491},
	{L["ZONE_HROTHGARSLANDING"], 541},
	{L["ZONE_ICECROWN"], 492},
	{L["ZONE_SHOLAZAR"], 493},
	{L["ZONE_STORMPEAKS"], 495},
	{L["ZONE_WINTERGRASP"], 501},
	{L["ZONE_ZULDRAK"], 496},
}

GJB.zonetable[GJB.ZONE_NORTH] = zones