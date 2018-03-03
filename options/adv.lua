local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

GJB.Advanced = {
	name = L["OPT_ADVANCED"],
	desc = L["OPT_ADVANCED_DESC"],
	type = "group",
	order = 30,
	args = {
		desc = {
			name = L["ADVSECTION_DESC"],
			type = "description",
			order = 1,
		},
		enable = {
			type = "toggle",
			name = L["TOG_ADVANCED"],
			desc = L["TOG_ADVANCED_DESC"],
			set = function(info, value) 
				GJB.db.profile.advenabled = value 
				GJB.gMusicIndex = 1
				GJB.gTitleIndex = 1
				GJB.gMusicIndexPrev = 0
				GJB.gTitleIndexPrev = 0
				if value == true and GJB.db.profile.stmode == true then
					GJB.db.profile.stmode = false
				end
			end,
			get = function(info) return GJB.db.profile.advenabled end,
			width = "full",
			order = 2,
		},
		continent = {
			type = "select",
			name = L["SEL_CONTINENT"],
			desc = L["SEL_CONTINENT_DESC"],
			style = "dropdown",
			values = "GetContinents",
			set = function(info, value) GJB.advcont = value end,
			get = "GetAdvContinent",
			width = "normal",
			order = 3,
		},
		zone = {
			type = "select",
			name = L["SEL_ZONE"],
			desc = L["SEL_ZONE_DESC"],
			style = "dropdown",
			values = "GetAdvCurContZoneList",
			set = function(info, value) GJB.advzone = value end,
			get = "GetAdvZone",
			width = "normal",
			order = 4,
		},
		zoneadd = {
			type = "execute",
			name = L["CMD_ADD"],
			desc = L["CMD_ADDZONE_DESC"],
			func = function()
				local cid = GJB.Continents[GJB.GetAdvContinent()].id
				local zid = GJB.zonetable[GJB.GetAdvContinent()][GJB.GetAdvZone()][GJB.ZT_ZONEID]
				local zlist = GJB.db.profile.advzonelist
				local zname = GJB.Continents[GJB.GetAdvContinent()].name .. " / " .. GJB.zonetable[GJB.GetAdvContinent()][GJB.GetAdvZone()][GJB.ZT_ZONENAME]
				
				-- do not add a double entry
				local addok = true
				for k, v in ipairs(zlist) do
					if v.zone == zid then
						addok = false
						break
					end
				end
				
				if addok == true then
					tinsert(zlist, { name = zname, cont = cid, zone = zid, titles = {} } )
					GJB.advzonebox = #zlist
				else
					GJB:Print("|cffff0000" .. zname .. " is already in the advzonelist!|r")
				end
			end,
			width = "half",
			order = 5,
		},
		space_zone = {name = " ",type = "description",width = "full",fontSize = "small",order = 6,},
		zonelist = {
			type = "select",
			name = L["SEL_YOUR_ZONES"],
			desc = L["SEL_YOUR_ZONES_DESC"],
			style = "dropdown",
			values = "GetAdvZoneList",
			set = function(info, value) GJB.advzonebox = value end,
			get = function(info) return GJB.advzonebox	end,
			width = "double",
			order = 7,
		},
		zonedelete = {
			type = "execute",
			name = L["CMD_REMOVE"],
			desc = L["CMD_REMOVE_DESC"],
			func = function() tremove(GJB.db.profile.advzonelist, GJB.advzonebox) end,
			width = "half",
			order = 8,
		},
		zonedeleteall = {
			type = "execute",
			name = L["CMD_REMOVEALL"],
			desc = L["CMD_REMOVEALL_DESC"],
			func = function() GJB.db.profile.advzonelist = {} GJB.advzonebox = 1 end,
			width = "half",
			order = 9,
		},
		space_music = {name = " ",type = "description",width = "full",fontSize = "small",order = 10,},
		hdr_music = {
			name = L["SEL_MUSIC"],
			type = "header",
			order = 11,
		},
		expac = {
			type = "select",
			name = L["SEL_EXPANSION"],
			desc = L["SEL_EXPANSION_DESC"],
			style = "dropdown",
			values = "GetExpansions",
			set = function(info, value) 
				GJB.advexpac = value
				GJB.advtitle = 1
			end,
			get = "GetAdvExpac",
			width = "normal",
			order = 12,
		},
		music = {
			type = "select",
			name = L["SEL_MUSIC"],
			desc = L["SEL_MUSIC_DESC"],
			style = "dropdown",
			values = "GetAdvCurExpacTitleList",
			set = function(info, value) GJB.advtitle = value end,
			get = "GetAdvTitle",
			width = "normal",
			order = 13,
		},
		musicadd = {
			type = "execute",
			name = L["CMD_ADD"],
			desc = L["CMD_ADD_DESC"],
			func = function()
				local zlist = GJB.db.profile.advzonelist
				local ztbl = zlist[GJB.advzonebox]
				if ztbl ~= nil then
					local xid = GJB.Expansions[GJB:GetAdvExpac()].id
					local tid = GJB.musictable[GJB:GetAdvExpac()][GJB:GetAdvTitle()].id
					local tname = GJB.Expansions[GJB:GetAdvExpac()].name .. " / " .. GJB.musictable[GJB:GetAdvExpac()][GJB:GetAdvTitle()].name
					
					tinsert(ztbl.titles, {name = tname, expac = xid, title = tid, xlist = {} })
					GJB.advmusicbox = #ztbl.titles
				end
			end,
			width = "half",
			order = 14,
		},
		space_musicadd = {name = " ",type = "description",width = "full",fontSize = "small",order = 15,},
		jukebox = {
			type = "select",
			name = L["SEL_YOUR_MUSIC"],
			desc = L["SEL_YOUR_MUSIC_DESC"],
			style = "dropdown",
			values = "GetAdvTitlesForZone",
			set = function(info, value) GJB.advtitlebox = value	end,
			get = function(info) return GJB.advtitlebox end,
			width = "double",
			order = 16,
		},
		musicdelete = {
			type = "execute",
			name = L["CMD_REMOVE"],
			desc = L["CMD_REMOVE_DESC"],
			func = function()
				local zlist = GJB.db.profile.advzonelist
				local ztbl = zlist[GJB.advzonebox]
				if ztbl ~= nil then
					for k, v in pairs(ztbl.titles) do
						if k == GJB.advtitlebox then
							tremove(ztbl.titles, k)
							GJB.advtitlebox = 1
							break
						end
					end
				end
			end,
			width = "half",
			order = 17,
		},
		musicdeleteall = {
			type = "execute",
			name = L["CMD_REMOVEALL"],
			desc = L["CMD_REMOVEALL_DESC"],
			func = function() 
				local zlist = GJB.db.profile.advzonelist
				local ztbl = zlist[GJB.advzonebox]
				if ztbl ~= nil then
					ztbl.titles = {}
					GJB.advtitlebox = 1
				end
			end,
			width = "half",
			order = 18,
		},
		space_remallmusic = {name = " ",type = "description",width = "full",fontSize = "small",order = 19,},
		descspaceshuffle = {
			name = "",
			type = "description",
			width = "full",
			fontSize = "small",
			order = 20,
		},
		hdrplayer = {
			name = L["HDR_BLACKLIST"],
			desc= L["HDR_BLACKLIST_DESC"],
			type = "header",
			order = 21,
		},
		songlist = {
			type = "multiselect",
			name = L["SEL_SONGS"],
			desc = L["SEL_SONGS_DESC"],
			style = "dropdown",
			values = "GetAdvExcludedSongList",
			set = "SetAdvExcludedSong",
			get = "GetAdvExcludedSong",
			width = "full",
			order = 22,
		},
	},
}
