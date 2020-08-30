local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

GJB.Audio = {
	name = L["OPT_AUDIO"],
	desc = L["OPT_AUDIO_DESC"],
	type = "group",
	order = 60,
	args = {
--[[		txtplaysound = {
			name = L["INP_WOWAUDIOFILE"],
			type = "input",
			width = "double",
			set = function(info, value) GJB.playsoundfile = value end,
			get = function(info) return GJB.playsoundfile end,
			order = 1,
		},
		cmdplaysound = {
			type = "execute",
			name = L["CMD_PLAY"],
			func = function()
				if GJB.doubleslashes == true then
					local s = "" -- temporary string holding newly created sound filename
					local i1, i2 = 1
					local l = strlen(GJB.playsoundfile)
					-- loop through the filename's characters to find double slashes
					while i1 <= l do
						local i2 = strfind(GJB.playsoundfile, "\\\\", i1)
						if i2 ~= nil then
							s = s .. strsub(GJB.playsoundfile, i1, i2-1) .. "\\"
							i1 = i2+2
						else
							s = s .. strsub(GJB.playsoundfile, i1)
							GJB.playsoundfile = s
							break
						end
					end
				end
				StopMusic()
				GJB.gMusicPlaying = false
				GJB:CancelTimer(GJB.musicTimer)
				GJB:SetNowPlayingText( "..." )
				PlayMusic(GJB.playsoundfile)
				GJB:Print(L["PLAYING"] .. GJB.playsoundfile)
			end,
			width = "half",
			order = 2,
		},
		cmdstopsound = {
			type = "execute",
			name = L["CMD_STOP"],
			func = function() StopMusic() GJB:SetNowPlayingText( "..." ) GJB:ProcessInfo() end,
			width = "half",
			order = 3,
		},
		doubleslashes = {
			type = "toggle",
			name = L["TOG_SLASHES"],
			desc = L["TOG_SLASHES_DESC"],
			set = function(info, value) GJB.doubleslashes = value end,
			get = function(info) return GJB.doubleslashes end,
			width = "full",
			order = 4,
		},
		--]]
		hdrplayer = {
			name = L["HDR_AUDIOPLAYER"],
			type = "header",
			order = 28,
		},
		play = {
			type = "execute",
			name = L["CMD_PLAY"],
			func = function() StopMusic() GJB:SetNowPlayingText( "..." ) GJB:ProcessInfo() end,
			width = "half",
			order = 29,
		},
		prev = {
			type = "execute",
			name = L["CMD_PREV"],
			func = function()
				StopMusic()
				GJB:SetNowPlayingText( "..." ) 
				GJB.gMusicIndex	= GJB.gMusicIndex - 1
				if GJB.gMusicIndex < 1 then
					GJB.gMusicIndex = GJB.gMaxMusic
				end
				GJB:ProcessInfo()
			end,
			width = "half",
			order = 30,
		},
		next = {
			type = "execute",
			name = L["CMD_NEXT"],
			func = function() StopMusic() GJB:SetNowPlayingText( "..." ) GJB:ProcessInfo() end,
			width = "half",
			order = 31,
		},
		stop = {
			type = "execute",
			name = L["CMD_STOP"],
			func = function()
				StopMusic()
				GJB:SetNowPlayingText( "..." ) 
				GJB.gMusicPlaying = false
				GJB:CancelTimer(self.musicTimer)
			end,
			width = "half",
			order = 32,
		},
		hidemusicplayer = {
			type = "toggle",
			name = L["TOG_HIDEMUSICPLAYER"],
			desc = L["TOG_HIDEMUSICPLAYER_DESC"],
			set = function(info, value)
				GJB.db.profile.hidemusicplayer = value
				GJB:SetPlayerVisibility(not value)
			end,
			get = function(info) return GJB.db.profile.hidemusicplayer end,
			width = "normal",
			order = 33,
		},
	},
}
