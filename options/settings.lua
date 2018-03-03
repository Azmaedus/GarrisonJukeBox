local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

GJB.Settings = {
	name = L["OPT_SETTINGS"],
	desc = "",
	type = "group",
	order = 50,
	args = {
		tshuffle = {
			type = "toggle",
			name = L["TOG_TSHUFFLE"],
			desc = L["TOG_TSHUFFLE_DESC"],
			set = function(info, value) GJB.db.profile.tshuffle = value end,
			get = function(info) return GJB.db.profile.tshuffle end,
			width = "normal",
			order = 13,
		},
		mshuffle = {
			type = "toggle",
			name = L["TOG_MSHUFFLE"],
			desc = L["TOG_MSHUFFLE_DESC"],
			set = function(info, value) GJB.db.profile.mshuffle = value end,
			get = function(info) return GJB.db.profile.mshuffle end,
			width = "normal",
			order = 14,
		},
		petbattle = {
			type = "toggle",
			name = L["TOG_PETBATTLE"],
			desc = L["TOG_PETBATTLE_DESC"],
			set = function(info, value) GJB.db.profile.petbattle = value end,
			get = function(info) return GJB.db.profile.petbattle end,
			width = "normal",
			order = 15,
		},
		allmusic = {
			type = "toggle",
			name = L["TOG_ALLMUSIC"],
			desc = L["TOG_ALLMUSIC_DESC"],
			set = function(info, value) GJB.db.profile.allmusic = value end,
			get = function(info) return GJB.db.profile.allmusic end,
			width = "normal",
			order = 16,
		},
		minimap = {
			type = "toggle",
			name = L["CMD_MINIMAP"],
			desc = L["CMD_MINIMAP_DESC"],
			set = function(info, value)	
				local icon = LibStub("LibDBIcon-1.0", true)
				GJB.db.profile.minimap.hide = value
				if value == true then
					icon:Hide("GarrisonJukeBox")
				else
					icon:Show("GarrisonJukeBox")
				end
			end,
			get = function(info) return GJB.db.profile.minimap.hide end,
			order = 17,
		},
		chatoutput = {
			type = "toggle",
			name = L["CMD_CHATOUTPUT"],
			desc = L["CMD_CHATOUTPUT_DESC"],
			set = function(info, value)	GJB.db.profile.chatoutput = value end,
			get = function(info) return GJB.db.profile.chatoutput end,
			order = 18,
		},
		shareparty = {
			type = "toggle",
			name = L["TOG_SHAREPARTY"],
			desc = L["TOG_SHAREPARTY_DESC"],
			set = function(info, value) GJB.db.profile.shareparty = value end,
			get = function(info) return GJB.db.profile.shareparty end,
			width = "normal",
			order = 19,
		},
		allowleadermusic = {
			type = "toggle",
			name = L["TOG_ALLOWLEADERMUSIC"],
			desc = L["TOG_ALLOWLEADERMUSIC_DESC"],
			set = function(info, value) GJB.db.profile.allowleadermusic = value end,
			get = function(info) return GJB.db.profile.allowleadermusic end,
			width = "normal",
			order = 20,
		},
		allzones = {
			type = "toggle",
			name = L["CMD_ALLZONES"],
			desc = L["CMD_ALLZONES_DESC"],
			set = function(info, value)	GJB.db.profile.allzones = value end,
			get = function(info) return GJB.db.profile.allzones end,
			order = 21,
		},
		space_silentpause = {name = " ",type = "description",width = "full",fontSize = "small",order = 22,},
		Silent = {
			name = L["OPT_SILENT"],
			desc = "",
			type = "group",
			inline = true,
			order = 22,
			args = {
				silentpause = {
					type = "toggle",
					name = L["TOG_SILENTPAUSE"],
					desc = L["TOG_SILENTPAUSE_DESC"],
					set = function(info, value)	GJB.db.profile.silentpauseon = value end,
					get = function(info) return GJB.db.profile.silentpauseon end,
					order = 1,
				},
				silentpausetxt = {
					name = L["INP_SILENTPAUSE"],
					type = "range",
					width = "double",
					min = 1,
					max = 300,
					step = 1,
					set = function(info, value) GJB.db.profile.silentpause = value end,
					get = function(info) return GJB.db.profile.silentpause end,
					order = 2,
				},
			},
		},
		space_history = {name = " ",type = "description",width = "full",fontSize = "small",order = 23,},
		History = {
			name = L["OPT_HISTORY"],
			desc = "",
			type = "group",
			inline = true,
			order = 24,
			args = {
				contmusic = {
					type = "toggle",
					name = L["TOG_HISTORY"],
					desc = L["TOG_HISTORY_DESC"],
					set = function(info, value)	GJB.db.profile.history.enabled = value end,
					get = function(info) return GJB.db.profile.history.enabled end,
					order = 1,
				},
				historycounttxt = {
					name = L["INP_HISTORYCOUNT"],
					type = "range",
					width = "double",
					min = 1,
					max = 10,
					step = 1,
					set = function(info, value) GJB.db.profile.history.maxitems = value end,
					get = function(info) return GJB.db.profile.history.maxitems end,
					order = 2,
				},
			},
		},
		
		space_bfixes = {name = " ",type = "description",width = "full",fontSize = "small",order = 34,},
		BFixes = {
			name = L["OPT_BLIZFIXES"],
			desc = "",
			type = "group",
			inline = true,
			order = 35,
			args = {
				contmusic = {
					type = "toggle",
					name = L["TOG_CONTMUSIC"],
					desc = L["TOG_CONTMUSIC_DESC"],
					set = function(info, value)	GJB.db.profile.bfixes.contmusic = value end,
					get = function(info) return GJB.db.profile.bfixes.contmusic end,
					order = 1,
				},
			},
		},

		space_softreset = {name = " ",type = "description",width = "full",fontSize = "small",order = 36,},
		softreset = {
			type = "execute",
			name = L["CMD_SOFTRESET"],
			desc = L["CMD_SOFTRESET_DESC"],
			func = function()
				local musicplayer = {
					pos= {
						a = "CENTER",
						r = "UIParent",
						rp = "CENTER",
						x = 0,
						y = 0,
					},
					dim = {
						w = GJB.MUSICPLAYER_WIDTH,
						h = GJB.MUSICPLAYER_HEIGHT,
						s = 1,
					},
				}
			
				GJB.db.profile.addonenabled = true
				GJB.db.profile.tshuffle = false
				GJB.db.profile.mshuffle = false
				GJB.db.profile.petbattle = true
				GJB.db.profile.inlinetitle = false
				GJB.db.profile.allmusic = false
				GJB.db.profile.minimap.hide = false
				GJB.db.profile.musicplayer = musicplayer
				GJB.db.profile.chatoutput = true
				GJB.db.profile.shareparty = false
				GJB.db.profile.allowleadermusic = false
				GJB.db.profile.hidemusicplayer = false
				GJB.db.profile.allzones = false
				GJB.db.profile.advenabled = false
				GJB.db.profile.silentpause = GJB.SILENT_PAUSE
				GJB.db.profile.silentpauseon = false
				GJB.db.profile.stmode = false
				GJB.db.profile.bfixes.contmusic = true
				GJB.db.profile.history.enabled = false
				GJB.db.profile.history.open = false
				GJB.db.profile.history.maxitems = 10
				GJB.db.profile.history.items = {}
				
				if 	GJB.mplayerloaded == true then
					GJB:UpdateMusicPlayer()
				else
					GJB:Print(L["ERROR_MUSICPLAYER_FRAME_NOT_LOADED"] .. " (OnProfileChange)")
				end
			end,
			width = "normal",
			order = 37,
		},
	},
}
