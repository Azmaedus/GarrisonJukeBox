local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

GJB.STMode = {
	name = L["OPT_STMODE"],
	desc = "Test",
	type = "group",
	order = 40,
	args = {
		desc = {
			name = L["STMSECTION_DESC"],
			type = "description",
			order = 1,
		},
		enable = {
			type = "toggle",
			name = L["TOG_STM"],
			desc = L["TOG_STM_DESC"],
			set = function(info, value) 
				GJB.db.profile.stmode = value
				GJB.gMusicIndex = 1
				GJB.gTitleIndex = 1
				GJB.gMusicIndexPrev = 0
				GJB.gTitleIndexPrev = 0
				if value == true and GJB.db.profile.advenabled == true then
					GJB.db.profile.advenabled = false
				end
			end,
			get = function(info) return GJB.db.profile.stmode end,
			width = "full",
			order = 2,
		},
		stm_expac = {
			type = "select",
			name = L["SEL_EXPANSION"],
			desc = L["SEL_EXPANSION_DESC"],
			style = "dropdown",
			values = "GetExpansions",
			set = function(info, value)
				GJB.stm_expac = value
				GJB.stm_samplesound = 1
				GJB.stm_title = 1
			end,
			get = "GetSTMExpac",
			width = "normal",
			order = 2,
		},
		stm_music = {
			type = "select",
			name = L["SEL_MUSIC"],
			desc = L["SEL_MUSIC_DESC"],
			style = "dropdown",
			values = "GetCurSTMExpacMusicList",
			set = function(info, value) GJB.stm_title = value end,
			get = "GetSTMTitle",
			width = "normal",
			order = 3,
		},
		stm_sampleselect = {
			type = 'select',
			--dialogControl = 'LSM30_Sound', 
			name = L["SEL_STMFILE"],
			desc = L["SEL_STMFILE_DESC"],
			values = "getSTMSongList", 
			get = function() return  GJB.stm_samplesound end,
			set = function(self, key) GJB.stm_samplesound = key end,
			width = "full",
			order = 6,
		},
		stm_cmdplaysamplemusic = {
		-- press multiple times to play next sub-item in list
			type = "execute",
			name = L["OPT_PLAYSAMPLE"],
			desc = L["OPT_PLAYSAMPLE_DESC"],
			func = function()
				-- play music
				SetCVar("Sound_EnableMusic", 1)
				StopMusic()
				GJB.gMusicPlaying = false
				GJB:CancelTimer(GJB.musicTimer)
				local sample = GJB.musictable[GJB.stm_expac][GJB.stm_title].files[GJB.stm_samplesound]
				local musicfile = sample[GJB.MT_MUSICFILE]

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
		stm_cmdstopsound = {
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
		stm_musicadd = {
			type = "execute",
			name = L["CMD_ADD"],
			desc = L["CMD_ADDSTM_DESC"],
			func = function()
				local stmfiles = GJB.db.profile.stm_files
				local musicfile = GJB.musictable[GJB.stm_expac][GJB.stm_title].files[GJB.stm_samplesound][GJB.MT_MUSICFILE]
				tinsert(stmfiles, {file = musicfile, expac = GJB.stm_expac, title = GJB.musictable[GJB.stm_expac][GJB.stm_title].id, index = GJB.musictable[GJB.stm_expac][GJB.stm_title].files[GJB.stm_samplesound][GJB.MT_MUSICID]})
			end,
			width = "half",
			order = 10,
		},
		stm_space_stopsound = {name = " ",type = "description",width = "full",fontSize = "small",order = 11,},
		stm_musiclist = {
			type = "select",
			name = L["SEL_JUKEBOX"],
			desc = L["SEL_JUKEBOX_DESC"],
			style = "dropdown",
			values = "GetSTMMusicList",
			set = function(info, value) GJB.stm_jukebox = value	end,
			get = function(info) return GJB.stm_jukebox	end,
			width = "full",
			order = 12,
		},
		stm_musicdelete = {
			type = "execute",
			name = L["CMD_REMOVE"],
			desc = L["CMD_REMOVE_DESC"],
			func = function()
				if GJB.jukebox ~= "" then
					local i = GJB.stm_jukebox
					tremove(GJB.db.profile.stm_files, GJB.stm_jukebox)
					if i > #GJB.db.profile.stm_files then
						i = #GJB.db.profile.stm_files
					end
				end
			end,
			width = "half",
			order = 13,
		},
		stm_musicdeleteall = {
			type = "execute",
			name = L["CMD_REMOVEALL"],
			desc = L["CMD_REMOVEALL_DESC"],
			func = function() 
				GJB.db.profile.stm_files = {}
				GJB.stm_jukebox = 1 
			end,
			width = "half",
			order = 14,
		},
	},
}
