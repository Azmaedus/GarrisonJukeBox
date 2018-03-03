local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local COMM_PREFIX = GJB.COMM_PREFIX			-- Used with AceComm prefix concatenation
local ON_LOAD_TIMER = GJB.ON_LOAD_TIMER	-- HACK!!! wait n seconds when PLAYYER_LOGIN is triggered before playing music (make sure Blizz level loading script doesn't override PlayMusic() call)
local ON_ZONE_TIMER = GJB.ON_ZONE_TIMER	-- HACK!!! wait n seconds when one of 3 zone change events are triggered before playing music (make sure the zoneID has been updated)
local ON_PETBATTLE_TIMER = GJB.ON_PETBATTLE_TIMER	-- Number of seconds to wait after a pet battle has ended before starting to play jukebox.

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

-- -------------------------------------------
-- OnInitialize
-- -------------------------------------------
function GJB:OnInitialize()
	-- Create the default settings for this addon 
	local defaults = { 
		profile =  {
			addonversion = {},
			addonenabled = true,
			musiclist = {},
			zonelist = {},
			tshuffle = false,
			mshuffle = false,
			inlinetitle = false,
			petbattle = true,
			allmusic = false,
			chatoutput = true,
			shareparty = false,
			allowleadermusic = false,
			silentpause = SILENT_PAUSE,
			silentpauseon = false,
			bfixes = {
				contmusic = true,
			},
			musicplayer = {
				pos= {
					a = "CENTER",
					r = "UIParent",
					rp = "CENTER",
					x = 0,
					y = 0,
				},
				dim = {
					w = MUSICPLAYER_WIDTH,
					h = MUSICPLAYER_HEIGHT,
					s = 1,
				},
			},
			hidemusicplayer = false,
			allzones = false,
			minimap = {
				hide = false,
			},
			advenabled = false,
			advzonelist = {},
			advexcludelist = {},
			stmode = false,
			stm_files = {},
			history = {
				enabled = false,
				open = false,
				maxitems = 10,
				items = {},
			}
		},
	}

	self.db = LibStub("AceDB-3.0"):New("GarrisonJukeBoxDB", defaults, true)
	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")

	-- ------------------------------------------------------------
	-- Option table for the slash command only
	local slashcmd = {
		type = "group",
		name = L["ADDON_SLASHCMD"],
		order = -3,
		func = function() GJB:ShowConfig() end,
		args = {
			intro = {
				order = 1,
				type = "description",
				name = L["ADDON_SLASHCMD_DESC"],
				cmdHidden = true,
			},
			play = {
				order = 2,
				type = "execute",
				name = L["CMD_PLAY"],
				desc = L["CMD_PLAY_DESC"],
				func = function() StopMusic() GJB:ProcessInfo() end,
			},
			prev = {
				order = 3,
				type = "execute",
				name = L["CMD_PREV"],
				desc = L["CMD_PREV_DESC"],
				func = function()
					StopMusic()
					GJB.gMusicIndex	= GJB.gMusicIndex - 1
					if GJB.gMusicIndex < 1 then
						GJB.gMusicIndex = GJB.gMaxMusic
					end
					GJB:ProcessInfo()
				end,
			},
			next = {
				order = 4,
				type = "execute",
				name = L["CMD_NEXT"],
				desc = L["CMD_NEXT_DESC"],
				func = function() StopMusic() GJB:ProcessInfo() end,
			},
			stop = {
				order = 5,
				type = "execute",
				name = L["CMD_STOP"],
				desc = L["CMD_STOP_DESC"],
				func = function()
					StopMusic()
					GJB.gMusicPlaying = false
					GJB:CancelTimer(GJB.musicTimer)
					GJB:SetNowPlayingText("...")
				end,
			},
			showicon = {
				order = 6,
				type = "execute",
				name = L["CMD_MINIMAP_SHOW"],
				desc = L["CMD_MINIMAP_SHOW_DESC"],
				func = function()
					local icon = LibStub("LibDBIcon-1.0", true)
					GJB.db.profile.minimap.hide = false
					icon:Show("GarrisonJukeBox")
				end,
			},
			hideicon = {
				order = 7,
				type = "execute",
				name = L["CMD_MINIMAP_HIDE"],
				desc = L["CMD_MINIMAP_HIDE_DESC"],
				func = function()
					local icon = LibStub("LibDBIcon-1.0", true)
					GJB.db.profile.minimap.hide = true 
					icon:Hide("GarrisonJukeBox")
				end,
			},
			showplayer = {
				order = 8,
				type = "execute",
				name = L["TOG_SHOWMUSICPLAYER"],
				desc = L["TOG_SHOWMUSICPLAYER_DESC"],
				func = function()
					GJB.db.profile.hidemusicplayer = false
					GJB:SetPlayerVisibility(true)
				end,
			},
			hideplayer = {
				order = 9,
				type = "execute",
				name = L["TOG_HIDEMUSICPLAYER"],
				desc = L["TOG_HIDEMUSICPLAYER_DESC"],
				func = function()
					GJB.db.profile.hidemusicplayer = true
					GJB:SetPlayerVisibility(false)
				end,
			},
			resetpos = {
				order = 10,
				type = "execute",
				name = L["CMD_RESETPOS"],
				desc = L["CMD_RESETPOS_DESC"],
				func = function()
					local pos = {
						a = "CENTER",
						r = "UIParent",
						rp = "CENTER",
						x = 0,
						y = 0,
					}
					
					GJB.db.profile.musicplayer.pos = pos
					GJB:SetPlayerPos( pos )
				end,
			},
			config = {
				type = "execute",
				name = L["CMD_CONFIG"],
				desc = L["CMD_CONFIG_DESC"],
				func = function() GJB:ShowConfig() end,
				guiHidden = true,
			},
		},
	}

	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("GarrisonJukeBoxDB", self.GenerateOptions)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("GarrisonJukeBox", slashcmd, "gjb")
	
	local ACD3 = LibStub("AceConfigDialog-3.0")
	self.optionsFrames = {}
	self.optionsFrames.JukeBox = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["ADDON_NAME"], nil, "JukeBox")
	self.optionsFrames.Zones = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["OPT_ZONES"], L["ADDON_NAME"], "Zones")
	self.optionsFrames.Advanced = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["OPT_ADVANCED"], L["ADDON_NAME"], "Advanced")
	self.optionsFrames.STMode = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["OPT_STMODE"], L["ADDON_NAME"], "STMode")
	self.optionsFrames.Settings = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["OPT_SETTINGS"], L["ADDON_NAME"], "Settings")
	self.optionsFrames.Audio = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["OPT_AUDIO"], L["ADDON_NAME"], "Audio")
	self:RegisterModuleOptions("GJBSlashCmd", slashcmd, L["ADDON_SLASHCMD"])
	self:RegisterModuleOptions("Profiles", function() return LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) end, L["Profiles"])
	self.optionsFrames.About = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["OPT_ABOUT"], L["ADDON_NAME"], "About")

	GJB.Expansions = 
	{
		{id = GJB.EXP_WOW,	name = EXPANSION_NAME0},
		{id = GJB.EXP_BC, name = EXPANSION_NAME1},
		{id = GJB.EXP_WOTLK, name = EXPANSION_NAME2},
		{id = GJB.EXP_CATA1, name = EXPANSION_NAME3},
		{id = GJB.EXP_CATA2,	name = EXPANSION_NAME3 .. L["EXP_REVAMP"]},
		{id = GJB.EXP_MOP, name = EXPANSION_NAME4},
		{id = GJB.EXP_WOD, name = EXPANSION_NAME5},
		{id = GJB.EXP_EVENTS, name = L["EXP_WCEVENTS"]	},
		{id = GJB.EXP_BLIZZJB, name = L["EXP_BLIZZJB"]},
		{id = GJB.EXP_LEGION, name = EXPANSION_NAME6},
	}

	GJB.Continents = 
	{
		{id = GJB.ZONE_KALIMDOR, name = L["KALIMDOR"]},
		{id = GJB.ZONE_EASTERN,	name = L["EASTERNKINGDOMS"]},
		{id = GJB.ZONE_OUTLAND,	name = L["OUTLAND"]},
		{id = GJB.ZONE_NORTH,	name = L["NORTHREND"]},
		{id = GJB.ZONE_CATA,  name = L["CATACLYSM"]},
		{id = GJB.ZONE_PANDA, name = L["PANDARIA"]},
		{id = GJB.ZONE_DRAENOR,	name = L["DRAENOR"]},
		{id = GJB.ZONE_RAIDS, name = L["RAIDS"]},
		{id = GJB.ZONE_DUNGEONS, name = L["DUNGEONS"]},
		{id = GJB.ZONE_BATTLEGROUNDS, name = L["BATTLEGROUNDS"]},
		{id = GJB.ZONE_SCENARIOS, name = L["SCENARIOS"]},
		{id = GJB.ZONE_LEGION, name = L["LEGION"]},
	}
	
	self.expac = 1
	self.title = 1
	self.advexpac = 1
	self.advtitle = 1
	
	self.gTitleIndex = 1
	self.gTitleIndexIn = 1
	self.gMusicPlaying = false
	self.gMaxTitle = 0
	self.gMaxMusic = 0
	self.gPrevZone = 0
	self.gErrorPlay = false
	self.loadTimer = nil
	self.zoneTimer = nil
	self.musicTimer = nil
	self.isPartyLeader = false
	
	-- Deltas
	GJB.PEWdelta = 0
	GJB.PEWlasttime = 0
	
	if self.db.profile.silentpauseon == nil then
		self.db.profile.silentpauseon = false
	end
	if self.db.profile.silentpause == nil then
		self.db.profile.silentpause = SILENT_PAUSE
	end

	self:CreateMinimapIcon()
	self:CreateMusicPlayer()
	self:CreateHistoryButtonFrames()
	
	if 	GJB.mplayerloaded == true then
		self:UpdateMusicPlayer()
	else
		self:Print(L["ERROR_MUSICPLAYER_FRAME_NOT_LOADED"] .. " (OnInitialize)")
	end
	
	self:UpdateHistory()
	
	self:Print(L["ADDON_NAME"] .. " " .. self.gVersion .. " " .. L["ADDON_LOADED"])
	
	self.mtid = self:CreateMTID(self.musictable)

	-- Update profile addon version in use
	self:VersionCheckResetData()
	
	
--[[	if self:VersionCheckResetData() then
		self.db.profile.addonenabled = true
	else
		self.db.profile.addonenabled = false
	end
]]	
	self.db.profile.addonenabled = true
	self:SetEnabledState(self.db.profile.addonenabled)
end

-- -------------------------------------------
-- OnEnable
-- -------------------------------------------
function GJB:OnEnable()
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "OnPEWEvent")
	self:RegisterEvent("PET_BATTLE_OPENING_START", "OnPetBattleStart")
	self:RegisterEvent("PET_BATTLE_OVER", "OnPetBattleEnd")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "OnZoneChangedNewArea")
	self:RegisterEvent("ZONE_CHANGED_INDOORS", "OnZoneChangedIndoors")
	self:RegisterEvent("ZONE_CHANGED", "OnZoneChanged")
	self:RegisterEvent("GROUP_ROSTER_UPDATE", "OnJoinParty")

	-- Register callbacks for inter-addon comms
	self:RegisterComm(COMM_PREFIX .. "ReqVersion", "OnBuddyReqVersion") 	-- Sends requesters version and name-realm to all party members
	self:RegisterComm(COMM_PREFIX .. "SentVersion", "OnBuddySentVersion") 	-- Sends version back to requester
	self:RegisterComm(COMM_PREFIX .. "GetMusic", "OnBuddyListenMusic")		-- Get music sent by leader
end

-- -------------------------------------------
-- OnDisable
-- -------------------------------------------
function GJB:OnDisable()
	self:UnregisterAllEvents()
end

-- -------------------------------------------
-- OnProfileChanged
-- -------------------------------------------
function GJB:OnProfileChanged(event, database, newProfileKey)
	db = database.profile

	self.db.profile.addonenabled = db.addonenabled
	self.db.profile.musiclist = db.musiclist
	self.db.profile.zonelist = db.zonelist
	self.db.profile.tshuffle = db.tshuffle
	self.db.profile.mshuffle = db.mshuffle
	self.db.profile.petbattle = db.petbattle
	self.db.profile.inlinetitle = db.inlinetitle
	self.db.profile.allmusic = db.allmusic
	self.db.profile.minimap.hide = db.minimap.hide
	self.db.profile.musicplayer.pos = db.musicplayer.pos
	self.db.profile.chatoutput = db.chatoutput
	self.db.profile.shareparty = db.shareparty
	self.db.profile.allowleadermusic = db.allowleadermusic
	self.db.profile.hidemusicplayer = db.hidemusicplayer
	self.db.profile.allzones = db.allzones
	self.db.profile.advenabled = db.advenabled
	self.db.profile.advexcludelist = db.advexcludelist
	self.db.profile.advzonelist = db.advzonelist
	self.db.profile.silentpause = db.silentpause
	self.db.profile.silentpauseon = db.silentpauseon
	self.db.profile.stmode = db.stmode
	self.db.profile.stm_files = db.stm_files
	self.db.profile.bfixes.contmusic = db.bfixes.contmusic
	self.db.profile.history.enabled = db.history.enabled
	self.db.profile.history.open = db.history.open
	self.db.profile.history.maxitems = db.history.maxitems
	self.db.profile.history.items = db.history.items
	
	self:VersionCheckResetData()

	if 	GJB.mplayerloaded == true then
		self:UpdateMusicPlayer()
	else
		self:Print(L["ERROR_MUSICPLAYER_FRAME_NOT_LOADED"] .. " (OnProfileChange)")
	end
	
	self:CancelTimer(self.musicTimer)
	self.loadTimer = self:ScheduleTimer("TimerLoaded", ON_LOAD_TIMER)
end

-- -------------------------------------------
-- OnPlayerEnteringWorld
-- -------------------------------------------
function GJB:OnPEWEvent(event, ...)
	--print("OnPEWEvent fired!")
	--print("Last Delta : " .. GJB.PEWlasttime)
	--print("Current Delta : " .. GJB.PEWdelta)
	if GJB.PEWdelta == 0 or (GetTime() - GJB.PEWlasttime) >= GJB.PEWTIME_ALLOWANCE then
		GJB.PEWTriggered = true
		GJB.PEWdelta = 0.01
		StopMusic()
		self:SetNowPlayingText( "..." )
		self.gMusicPlaying = false
		self.gPrevZone = GetCurrentMapAreaID()
		
		local icon = LibStub("LibDBIcon-1.0", true)
		if self.db.profile.minimap.hide then
			icon:Hide("GarrisonJukeBox")
		else
			icon:Show("GarrisonJukeBox")
		end

		self.loadTimer = self:ScheduleTimer("TimerLoaded", ON_LOAD_TIMER)
	end
	
	-- Get the time delta
	GJB.PEWdelta = GetTime() - GJB.PEWlasttime 
end

-- -------------------------------------------
-- Pet Battles
-- -------------------------------------------
function GJB:OnPetBattleStart(event, ...)
	if self:IsInZoneList(self.gCurZoneID) or self.db.profile.allzones == true or self.db.profile.advenabled == true then
		self.gPetBattleEnabled = true
		self:ProcessInfo()
	end
end

function GJB:OnPetBattleEnd(event, ...)
	if self:IsInZoneList(self.gCurZoneID) or self.db.profile.allzones == true or self.db.profile.advenabled == true then
		self.gPetBattleEnabled = false
		self.zoneTimer = self:ScheduleTimer("TimerEventPetBattle", ON_PETBATTLE_TIMER)
	end
end

-- -------------------------------------------
-- Timers
-- -------------------------------------------
function GJB:TimerLoaded()
	--self:Print("TimerEventLoaded fired!" )
	GJB.PEWTriggered = false
	self:CancelTimer(self.loadTimer)
	self.gCurZoneID = GetCurrentMapAreaID()
	self:ProcessInfo()
end

function GJB:TimerEvent()
	--self:Print("TimerEvent fired!")
	--GJB:Print("Zone: " .. GetCurrentMapAreaID() ) 
	if GJB.PEWTriggered == false then
		self.gCurZoneID = GetCurrentMapAreaID() 
		
		-- ***********************
		-- BLIZZARD MUSICBOX BUG FIX
		
		if self.db.profile.bfixes.contmusic == true then
			-- Check if not still in the garrison
			if self.gCurZoneID ~= 976 and self.gCurZoneID ~= 971 then
				--print("Not in garrison")
				-- Check if coming out of a garrison
				if self.gPrevZone == 976 or self.gPrevZone == 971 then
					--print("came from garrison")
					-- Check if CVar Music is enabled
					if GetCVar("Sound_EnableMusic") == "1" then
						--print("music is enabled")
						-- Music Roll quest "Bringing the Bass" Alliance/Horde
						if IsQuestFlaggedCompleted(38356) or IsQuestFlaggedCompleted(37961) then
							--print("quest is completed")
							SetCVar("Sound_EnableMusic", "0")
							SetCVar("Sound_EnableMusic", "1")
						end
					end
				end
			end
		end
		-- ***********************

		if self.db.profile.allzones == true or self.db.profile.advenabled == true then
			if self.gPrevZone ~= self.gCurZoneID then
				if self.gMusicPlaying == false then
					self.gPrevZone = self.gCurZoneID
					self.gErrorPlay = false
					self:ProcessInfo()
				end
			end
		else
			if self.gPrevZone ~= self.gCurZoneID or self.gErrorPlay == true then
				if self:IsInZoneList(self.gPrevZone) == true and self:IsInZoneList(self.gCurZoneID) == true then
					-- HACK to do nothing if changing from two zones contained within the zonelist
				else
					self.gPrevZone = self.gCurZoneID
					self.gErrorPlay = false
					self:ProcessInfo()
				end
			end
		end
	end
end

function GJB:TimerEventPetBattle()
	--self:Print("TimerEvent fired!")
	self:ProcessInfo()
end

function GJB:TimerEventMusic()
	--self:Print("TimerEvent fired!")
	self:CancelTimer(self.zoneTimer)
	self.gCurZoneID = GetCurrentMapAreaID()
	self:ProcessInfo()
end

-- -------------------------------------------
-- Zone Change Events
-- -------------------------------------------
function GJB:OnZoneChanged(event, ...)
	self.zoneTimer = self:ScheduleTimer("TimerEvent", ON_ZONE_TIMER)
	--print("OnZoneChanged:" .. tostring(GetCurrentMapAreaID()))
end

function GJB:OnZoneChangedIndoors(event, ...)
	self.zoneTimer = self:ScheduleTimer("TimerEvent", ON_ZONE_TIMER)
	--print("OnZoneChangedIndoors:" .. tostring(GetCurrentMapAreaID()))
end

function GJB:OnZoneChangedNewArea(event, ...)
	self.zoneTimer = self:ScheduleTimer("TimerEvent", ON_ZONE_TIMER)
	--print("OnZoneChangedNewArea:" .. tostring(GetCurrentMapAreaID()))
end