local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local zones = {
	{L["ZONE_BG_Alterac Valley"], 401},
	{L["ZONE_BG_Arathi Basin"], 461},
	{L["ZONE_BG_Deepwind Gorge"], 935},
	{L["ZONE_BG_Eye of the Storm"], 482},
	{L["ZONE_BG_Isle of Conquest"], 540},
	{L["ZONE_BG_Silvershard Mines"], 860},
	{L["ZONE_BG_Strand of the Ancients"], 512},
	{L["ZONE_BG_Temple of Kotmogu"], 856},
	{L["ZONE_BG_The Battle for Gilneas"], 736},
	{L["ZONE_BG_Twin Peaks"], 626},
	{L["ZONE_BG_Warsong Gulch"], 443},
}

GJB.zonetable[GJB.ZONE_BATTLEGROUNDS] = zones