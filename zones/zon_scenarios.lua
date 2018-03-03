local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local zones = {
	{L["ZONE_SCEN_A Brewing Storm"], 878},
	{L["ZONE_SCEN_A Little Patience"], 912},
	{L["ZONE_SCEN_Arena of Annihilation"], 899},
	{L["ZONE_SCEN_Assault on Zan'vess"], 883},
	{L["ZONE_SCEN_Battle on the High Seas"], 940},
	{L["ZONE_SCEN_Blood in the Snow"], 939},
	{L["ZONE_SCEN_Brewmoon Festival"], 884},
	{L["ZONE_SCEN_Celestial Tournament"], 955},
	{L["ZONE_SCEN_Crypt of Forgotten Kings"], 900},
	{L["ZONE_SCEN_Dagger in the Dark"], 914},
	{L["ZONE_SCEN_Dark Heart of Pandaria"], 937},
	{L["ZONE_SCEN_Domination Point H"], 920},
	{L["ZONE_SCEN_Greenstone Village"], 880},
	{L["ZONE_SCEN_Lion's Landing A"], 911},
	{L["ZONE_SCEN_The Secrets of Ragefire"], 938},
	{L["ZONE_SCEN_Theramore's Fall A"], 906},
	{L["ZONE_SCEN_Theramore's Fall H"], 851},
	{L["ZONE_SCEN_Unga Ingoo"], 882},
}

GJB.zonetable[GJB.ZONE_SCENARIOS] = zones