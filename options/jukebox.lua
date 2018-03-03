local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

GJB.JukeBox = {
	name = L["OPT_JUKEBOX"],
	desc = L["OPT_JUKEBOX_DESC"],
	type = "group",
	order = 10,
	args = {
		enable = {
			type = "toggle",
			name = L["TOG_ENABLED"],
			desc = L["TOG_ENABLED_DESC"],
			set = function(info, value) 
				GJB.db.profile.addonenabled = value
				if value then
					GJB:Enable()
				else
					GJB:Disable()
				end
			end,
			get = function(info) return GJB.db.profile.addonenabled end,
			width = "full",
			order = 1,
		},
		expac = {
			type = "select",
			name = L["SEL_EXPANSION"],
			desc = L["SEL_EXPANSION_DESC"],
			style = "dropdown",
			values = "GetExpansions",
			set = function(info, value)
				GJB.expac = value
				GJB.music = 1
				GJB.title = 1
			end,
			get = "GetExpac",
			width = "normal",
			order = 2,
		},
		music = {
			type = "select",
			name = L["SEL_MUSIC"],
			desc = L["SEL_MUSIC_DESC"],
			style = "dropdown",
			values = "GetCurExpacTitleList",
			set = function(info, value) GJB.title = value end,
			get = "GetTitle",
			width = "normal",
			order = 3,
		},
		musicadd = {
			type = "execute",
			name = L["CMD_ADD"],
			desc = L["CMD_ADD_DESC"],
			func = function()
				local xid = GJB.Expansions[GJB.GetExpac()].id
				local tid = GJB.musictable[xid][GJB.GetTitle()].id
				local tname = GJB.Expansions[GJB.GetExpac()].name .. " / " .. GJB.musictable[xid][GJB.GetTitle()].name
				tinsert(GJB.db.profile.musiclist, { name = tname, expac = xid, title = tid, xlist = {} } )
			end,
			width = "half",
			order = 4,
		},
		sampleselect = {
			type = 'select',
			--dialogControl = 'LSM30_Sound', 
			name = L["SEL_SAMPLEMUSIC"],
			desc = L["SEL_SAMPLEMUSIC_DESC"],
			values = "getSampleSongList", 
			get = function() return  GJB.samplesound end,
			set = function(self, key) GJB.samplesound = key end,
			width = "full",
			order = 6,
		},
		cmdplaysamplemusic = {
		-- press multiple times to play next sub-item in list
			type = "execute",
			name = L["OPT_PLAYSAMPLE"],
			desc = L["OPT_PLAYSAMPLE_DESC"],
			func = function()
				-- play music
				StopMusic()
				GJB.gMusicPlaying = false
				GJB:CancelTimer(GJB.musicTimer)
				local sample = GJB.musictable[GJB.GetExpac()][GJB.GetTitle()].files[GJB.samplesound]
				
				local ptime = sample[GJB.MT_MUSICLEN]
				local tmins = floor(ptime/60)
				local tsecs = ptime - (tmins * 60)

				PlayMusic(sample[GJB.MT_MUSICFILE])
				GJB:SetNowPlayingText( GJB:ExtractMP3Filename( sample[GJB.MT_MUSICFILE] ) )

				GJB.gMusicPlaying = true
				GJB.musicTimer = GJB:ScheduleTimer("TimerEventMusic", ptime)
				
				GJB:Print(L["SAMPLE_MUSIC"] .. sample[GJB.MT_MUSICFILE])
			end,
			width = "normal",
			order = 8,
		},
		cmdstopsound = {
			type = "execute",
			name = L["CMD_STOP"],
			func = function()
				GJB.gMusicPlaying = false
				GJB:CancelTimer(GJB.musicTimer)
				StopMusic()
				GJB:ProcessInfo()
			end,
			width = "half",
			order = 9,
		},
		space_stopsound = {name = " ",type = "description",width = "full",fontSize = "small",order = 10,},
		musiclist = {
			type = "select",
			name = L["SEL_JUKEBOX"],
			desc = L["SEL_JUKEBOX_DESC"],
			style = "dropdown",
			values = function() 
				local tbl = {}
				for k, v in ipairs( GJB.db.profile.musiclist ) do
					tinsert( tbl, #tbl + 1, v["name"] )
				end
				return tbl
			end,
			set = function(info, value) GJB.jukebox = value	end,
			get = function(info) return GJB.jukebox	end,
			width = "double",
			order = 11,
		},
		musicdelete = {
			type = "execute",
			name = L["CMD_REMOVE"],
			desc = L["CMD_REMOVE_DESC"],
			func = function()
				if GJB.jukebox ~= "" then
					tremove(GJB.db.profile.musiclist, GJB.jukebox)
				end
			end,
			width = "half",
			order = 12,
		},
		musicdeleteall = {
			type = "execute",
			name = L["CMD_REMOVEALL"],
			desc = L["CMD_REMOVEALL_DESC"],
			func = function() GJB.db.profile.musiclist = {}	GJB.jukebox = 1 end,
			width = "half",
			order = 13,
		},
		space_remallmusic = {name = " ",type = "description",width = "full",fontSize = "small",order = 12,},
		descspaceshuffle = {
			name = "",
			type = "description",
			width = "full",
			fontSize = "small",
			order = 14,
		},
		hdrplayer = {
			name = L["HDR_BLACKLIST"],
			desc= L["HDR_BLACKLIST_DESC"],
			type = "header",
			order = 15,
		},
		songlist = {
			type = "multiselect",
			name = L["SEL_SONGS"],
			desc = L["SEL_SONGS_DESC"],
			style = "dropdown",
			values = function() return GJB:getExcludedSongList() end,
			set = "SetExcludedSong",
			get = "GetExcludedSong",
			width = "full",
			order = 16,
		},
	},
}