local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local zones = {
	{L["ZONE_ZULDAZAR"], 862},
	{L["ZONE_NAZMIR"], 863},
	{L["ZONE_TIRAGARDESOUND"], 895},
	{L["ZONE_DRUSTVAR"], 896},
	{L["ZONE_STORMSONGVALLEY"], 942},
	{L["ZONE_BORALUS"], 1161},
	{L["ZON_DAZARALOR"], 1163},
}

GJB.zonetable[GJB.ZONE_BFA] = zones