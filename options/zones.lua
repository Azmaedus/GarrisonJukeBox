local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

GJB.Zones = {
	name = L["OPT_ZONES"],
	desc = "",
	type = "group",
	order = 20,
	args = {
		i1continent = {
			type = "select",
			name = L["SEL_CONTINENT"],
			desc = L["SEL_CONTINENT_DESC"],
			style = "dropdown",
			values = "GetContinents",
			set = function(info, value) GJB.continent = value end,
			get = "GetContinent",
			width = "normal",
			order = 22,
		},
		i1zone = {
			type = "select",
			name = L["SEL_ZONE"],
			desc = L["SEL_ZONE_DESC"],
			style = "dropdown",
			values = "GetCurContinentZoneList",
			set = function(info, value) GJB.zone = value end,
			get = "GetZone",
			width = "normal",
			order = 23,
		},
		zoneadd = {
			type = "execute",
			name = L["CMD_ADD"],
			desc = L["CMD_ADDZONE_DESC"],
			func = function()
				local cid = GJB.Continents[GJB.GetContinent()]["id"]
				local zid = GJB.zonetable[cid][GJB.GetZone()][GJB.ZT_ZONEID]
				local zlist = GJB.db.profile.zonelist
				local zname = GJB.Continents[GJB.GetContinent()]["name"] .. " / " .. GJB.zonetable[cid][GJB.GetZone()][GJB.ZT_ZONENAME]
				
				local addok = true
				for k, v in ipairs(zlist) do
					if v["zone"] == zid then
						addok = false
						break
					end
				end
				
				if addok == true then
					tinsert(zlist, { name = zname, cont = cid, zone = zid } )
					GJB.zonebox = 1
				else
					GJB:Print("|cffff0000" .. zname .. " is already in the zonelist!|r")
				end
			end,
			width = "half",
			order = 24,
		},
		space_zone = {name = " ",type = "description",width = "full",fontSize = "small",order = 22,},
		zonelist = {
			type = "select",
			name = L["SEL_YOUR_ZONES"],
			desc = L["SEL_YOUR_ZONES_DESC"],
			style = "dropdown",
			values = "GetZoneList",
			set = function(info, value)	GJB.zonebox = value	end,
			get = function(info) return GJB.zonebox	end,
			width = "double",
			order = 25,
		},
		zonedelete = {
			type = "execute",
			name = L["CMD_REMOVE"],
			desc = L["CMD_REMOVE_DESC"],
			func = function() tremove(GJB.db.profile.zonelist, GJB.zonebox) end,
			width = "half",
			order = 26,
		},
		zonedeleteall = {
			type = "execute",
			name = L["CMD_REMOVEALL"],
			desc = L["CMD_REMOVEALL_DESC"],
			func = function() GJB.db.profile.zonelist = {} GJB.zonebox = 1	end,
			width = "normal",
			order = 27,
		},			
	},
}
