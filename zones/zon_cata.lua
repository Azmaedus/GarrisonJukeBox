local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local zones = {
	{L["ZONE_DEEPHOLM"], 640},
	{L["ZONE_KEZAN"], 605},
	{L["ZONE_LOSTISLES"], 544},
}

GJB.zonetable[GJB.ZONE_CATA] = zones