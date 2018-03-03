local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local zones = {
	{L["ZONE_ASHRAN"], 978},
	{L["ZONE_FROSTFIRE"], 941},
	{L["ZONE_FROSTWALL"], 976},
	{L["ZONE_GORGROND"], 949},
	{L["ZONE_LUNARFALL"], 971},
	{L["ZONE_NAGRAN"], 950},
	{L["ZONE_SHADOWMOON"], 947},
	{L["ZONE_SPIRES"], 948},
	{L["ZONE_STORMSHIELD"], 1009},
	{L["ZONE_TALADOR"], 946},
	{L["ZONE_TANAANJUNGLE"], 945},
	{L["ZONE_TANAANJUNGLE_ASSAULT"], 970},
	{L["ZONE_WARSPEAR"], 1011},
}

GJB.zonetable[GJB.ZONE_DRAENOR] = zones