--[[
	Author:  Azmaedus
	Created: 12/31/2014
	License: GPLv2
	
	Change Log
	--------------------
	11/29/2014 - 0.1 		Creation of addon

	11/29/2014 - 0.1.1 		Support for tier 1, 2, and 3 garrison (Outpost, Fort, and Garrison)

	12/01/2014 - r8			1st commit to wowace.com (alpha)

	12/02/2014 - r9			Added multi-dimensional table to hold music filename references

	12/26/2014 - r9			Fixed issue with music not playing inside garrison buildings by changing the way to detect if we are inside Lunarfall

	12/27/2014 - r10			2 minute timer added between random playlist items.
									Dropdown music now functional per expansion selected.
									Fixed reload (musiclist) not loading in profile; forgot DB at the end of savedvars .toc

	12/28/2014 - r11			Fixed /reload issue not playing music

	12/29/2014 - 0.2b		1st beta: Fixed error when opening the options UI

	12/29/2014 - 0.3b		Changed from using 2 table design to a single table for holding music information

	12/29/2014 - 0.3.1b		Added Evil Forest 1, 2 and 3 music (Silverpine & Tirisfal)

	12/30/2014 - 0.4b		Code review & optimization (1st pass)
									Re-design of options UI
									Added Audio tab to let users play a wow embedded file by copy/paste into the input control
									Added About tab with relative information
									Localization of music titles and options table.

	12/31/2014 - 0.4.1b		Fixed issue with options UI not showing up on first /gjb command
									Added playlist controls in audio tab
									Added more music to the musictable
									Added slash commands play, prev, next, stop
									Fixed small misc bugs and some naughty coding practices
									Started to implement a zonelist so the user can choose to play the jukebox in multiple locations.

	12/31/2014 - 0.4.2b		Removed unecessary xml frame file to trigger OnLoad event
									Moved audio player in the jukebox tab
									Added a function with enums to manage string colours
									Added more music

	12/31/2014 - 0.4.3b		Fixed issue with zone changing always calling play music.

	01/01/2015 - 0.5b		Changed musictable structure to include multiple files under one music item
									Added Pet Battle music management (Menagerie) processes next song on pet battle start and end
									Separated musictable in it's own file
									Changed the way "Play Sample" works. Click multiple times to cycle through the title's sub-items
									Added music requested by ticket3

	01/01/2014 - 0.5.1b		Fixed missing localization when playing a file in the audio tab
									Added created date in about tab
									Added most of the remaining classic wow music

	01/01/2014 - 0.5.2b		Added most of the remaining burning crusade music

	01/02/2015 - 0.5.3b		Fixed zone changing bug in which the zoneID didn't update; use of timer to wait until it populates with the correct zoneID value.

	01/02/2015 - 0.5.3b-r1	Fixed an issue where the music timer was not playing the next song.
									Added sub-item index and length of song output.
							
	01/02/2015 - 0.5.4b		Reduced the size of the options table. Still needs some work...
									Added wotlk music
						
	01/02/2015 - 0.5.5b		Fixed issue where if an invalid item was trying to play from a previous version of the addon, the playlist was stopped.
									Added Cataclysm music
	
	01/04/2015 - 0.5.6b 	Added alphabetical sorting on titles in musictable
									Added MoP music
						
	==== RELEASE version 1.0 ===
	01/04/2015 - 1.0			Fixed a bug where the removal of items in the jukebox would cause it to stop playing because the index entry was set to nil instead of table.remove().
									Added a feature that doesn't replay the same title twice in a row unless it is the only title in the jukebox list.
						
	01/04/2015 - 1.0.1		Added Orgrimmar and Frostwall to the zonelist.
	01/04/2015 - 1.0.2		Added sort of zones
	
	01/05/2015 - 1.0.3		Modified the zonetable structure to hold all zones of WoW. Also seperated the zonetable code into it's own file.
									Modified the zone options to take in consideration this new design.
									Added all zones to the zonetable.
									Added code check to remove invalid zone entries from the profile's zonelist.
									Added check to not add a zone multiple times into the profile zonelist.
									Fixed issue when changing from and to a zone that were within the profile zonelist where the music would also change. This was an unwanted behaviour.
	
	01/05/2014 - 1.0.3.1 	Fixed a svn issue

	01/05/2014 - 1.0.3.2 	Fixed a debug output issue
	
	01/05/2015 - 1.0.4		Added WoD music
	
	01/06/2015 - 1.0.5		Added profile management
	
	01/07/2015 - 1.0.6		Fixed an issue where pet battles inside a garrison caused the jukebox to stop playing.
									Code Cleanup/Optimizations
									Added minimap icon
						
	01/10/2015 - 1.0.7		Added a toggle for the display of the minimap icon.
	
	01/10/2015 - 1.0.7.1 	Fixed issue with slash commands showicon & hideicon.
									Fixed Add zone button position.
	
	01/11/2015 - 1.0.7.2 	Fixed issue with minimap icon not saving current state.
	
	01/11/2015 - 1.0.7.3 	Fixed issue when changing profiles not loading correct minimap icon state.
	
	01/16/2015 - 1.0.7.4 	Added a toggle in the options UI to turn on/off chat output.

	01/21/2015 - 1.0.7.5 	Added a toggle in the options UI to play every item in a title inline while shuffle is active.
	
	01/21/2015 - 1.0.7.6 	Added zhCN localization.
									Fixed locale header for zhCN.
						 
	01/22/2015 - 1.0.8.0 	Added inter-communication feature to share party leader's currently playing music.
	
	01/23/2015 - 1.0.8.1 	Added internal version identifier.
									Added LibTColor lib to ease colour management of text.
									Added GJBPlayer lib to show a music player on screen.
									Added Right-Click option on minimap button to show/hide the music player.
									Added and changed a few localizations.
									Added a couple music titles.
	01/26/2015 - 1.0.8.2	Added toggle in options UI to show/hide music player.
									Added slash command /gjb showplayer ~ hideplayer.
	01/28/2015 - 1.0.9.0	Switched from using GJBPlayer to FrameX lib for managing the creation of frames.
	
	Known Bugs
	--------------------
	- Sometimes, the music player dimensions are incorrect and the frame appears bloated. A simple drag and /reload should solve it temporarily.
	- The option "Hide Music Player" in the options UI works reversely to its intended behaviour. When checked, it shows the player.
	
	TODO List
	--------------------
	- TODO[1]: Will we allow duplicate titles to be added to the jukebox list?
]]

-- Lua APIs
local tinsert, tconcat, tremove = table.insert, table.concat, table.remove
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget

-- Load the Ace libraries --
GJB = LibStub("AceAddon-3.0"):NewAddon("GarrisonJukeBox", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceComm-3.0", "AceSerializer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local LTC = LibStub("LibTColor-1.0")
assert(LTC, "LibTColor-1.0 not loaded!")

local LFX = LibStub("LibFrameX-1.0")
assert(LFX, "LibFrameX-1.0 not loaded!")

-- Embedding functions from LFX
GJB.makeFrames = LFX.makeFrames
GJB.getBD = LFX.getBD
GJB.setBD = LFX.setBD
GJB.getBRGBA = LFX.getBRGBA
GJB.setBRGBA = LFX.setBRGBA
GJB.getRGBA = LFX.getRGBA
GJB.setRGBA = LFX.setRGBA
GJB.getDimensions = LFX.getDimensions
GJB.setDimensions = LFX.setDimensions
GJB.getVisibility = LFX.getVisibility
GJB.setVisibility = LFX.setVisibility
GJB.getPosition = LFX.getPosition
GJB.setPosition = LFX.setPosition
GJB.getFrameCaption = LFX.getFrameCaption
GJB.setFrameCaption = LFX.setFrameCaption

-- metadata
GJB.gVersion = GetAddOnMetadata("GarrisonJukeBox", "Version")
GJB.gVersionID = {1,0,9,0,2} -- release major, release minor, build major, build minor, type (alpha 0, beta 1, release 2)
GJB.gCurReleaseDate = "01/28/2015"
_G["GJB"] = GJB

-- table to hold all music and zone data
GJB.musictable = {}
GJB.zonetable = {}

-- constants
local ON_LOAD_TIMER = 5			-- HACK!!! wait n seconds when PLAYYER_LOGIN is triggered before playing music (make sure Blizz level loading script doesn't override PlayMusic() call)
local ON_ZONE_TIMER = 2			-- HACK!!! wait n seconds when one of 3 zone change events are triggered before playing music (make sure the zoneID has been updated)
local ON_PETBATTLE_TIMER = 1	-- Number of seconds to wait after a pet battle has ended before starting to play jukebox.
local PLAYERROR_INV_STRING = 1	-- When an invalid string is passed (nil or "")
local PLAYERROR_INV_TITLE = 2	-- When an invalid title is passed (remove the corrupted entry from jukebox)
local COMM_PREFIX = "GJB"		-- Used with AceComm prefix concatenation

-- globals
GJB.gMusicPlaying = false 		-- is the music currently playing
GJB.gMusicIndex = 1				-- current item index of table musicfiles
GJB.gMusicIndexPrev = 0			-- previous index to make sure that items don't play twice in a row
GJB.gMusicIndexIn = 1			-- current item index of sub-items inside the musictable structure
GJB.gMaxMusic = 0				-- number of items in musicfiles table
GJB.gMaxMusicIn = 0				-- number of sub-items in musictable structure
GJB.gCurZoneID = 0				-- Current Zone ID returned from GetCurrentMapAreaID()
GJB.gPrevZone = 0				-- holder for comparison when changing zones (in case going into same zone) O.o
GJB.gPetBattleEnabled = false 	-- Pet battle event state
GJB.gSampleIndex = 1			-- current index of sub-item for playing sample music
GJB.gSampleLastIndex = 1		-- last index used to play sub-item sample music
GJB.gSamplePlayed = ""			-- expansion+title string of last played sample music
GJB.gErrorPlay = false			-- state of last play attempt (true == error)
GJB.gOODShouted = false;		-- set to true when addon has printed an out-of-date message to the chat pane

GJB.Party = {}					-- table to hold all player names that are in the party (used for the party leader)
GJB.BlackList = {}				-- BNlacklist of already queried characters for version OOD

GJB.expac = "i1wow"				-- Holder for Expansion/Category select
GJB.music = 1					-- Holder for Music select
GJB.jukebox = ""				-- Holder for currently selected item in jukebox select
GJB.playsoundfile = ""			-- Holder for Play File input
GJB.doubleslashes = true		-- Holder for Double Slashes toggle
GJB.continent = "i1kalimdor"	-- Holder for Continent select
GJB.zone = 1					-- Holder for Zone select
GJB.zonebox = ""				-- Holder for currently selected item in zone select

local moduleOptions = {}    	-- Table for [Load On Demand] module options registration

-- ---------------------------------------------
-- create minimap icon
-- ---------------------------------------------
function GJB:CreateMinimapIcon()
	local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
	local plugin = ldb:NewDataObject("GarrisonJukeBox", {
		type = "data source",
		text = "0",
		icon = "Interface\\AddOns\\GarrisonJukeBox\\media\\icon",
	})

	function plugin.OnClick(self, button)
		if button == "LeftButton" then
			GJB:ShowConfig()
		elseif button == "RightButton" then
			if GJB.db.profile.hidemusicplayer == true then
				GJB.db.profile.hidemusicplayer = false
				GJB:setVisibility("GJBP_BG", true)
			else
				GJB.db.profile.hidemusicplayer = true
				GJB:setVisibility("GJBP_BG", false)
			end
		end
	end

	local hint = L["ICON_CLICK"]
	local hint2 = L["ICON_RCLICK"]
	function plugin.OnTooltipShow(tt)
		tt:AddLine(L["ADDON_NAME"])
		tt:AddLine(" ")
		tt:AddLine(hint, 0.2, 1, 0.2, 1)
		tt:AddLine(" ")
		tt:AddLine(hint2, 0.2, 1, 0.2, 1)
	end

	local f = CreateFrame("Frame")
	f:SetScript("OnEvent", function()
		GJB.icon = LibStub("LibDBIcon-1.0", true)
		if not GarrisonJukeBoxLDBIconDB then GarrisonJukeBoxLDBIconDB = {} end
		GJB.icon:Register("GarrisonJukeBox", plugin, GarrisonJukeBoxLDBIconDB)
	end)
	f:RegisterEvent("PLAYER_LOGIN")
end

-- Music Player Config
local musicplayer = {
	{
		--root = true,
		ftype = "Frame",
		name = "GJBP_BG",
		rgba = {r = 0, g = 0, b = 0, a = 0.7},
		brgba = {r = 255, g = 255, b = 255, a = 0.5},
		dim = {w = 200, h = 40, s = 1},
		pos = {x = 0, y = 0, a = "TOPLEFT", r = UIParent, rp = "CENTER"},
		bd = {
			bgFile = [[Interface\ChatFrame\ChatFrameBackground]],
			edgeFile = [[Interface/Tooltips/UI-Tooltip-Border]],
			tile = true, tileSize = 4, edgeSize = 4,
			insets = { left = 1, right = 1, top = 1, bottom = 1 }
		},
		show = true,
		movable = {
			enabled = true, 
			drag = {"RightButton"},
		},
		scripts = {
			{
				event = "OnDragStart", 
				func = function( self )
					if IsAltKeyDown() then
						self:StartMoving()
					end
				end
			},
			{
				event = "OnDragStop", 
				func = function( self )
					self:StopMovingOrSizing()
					pos = GJB.db.profile.musicplayer.pos
					pos.a, pos.r, pos.rp, pos.x, pos.y = self:GetPoint(1)
				end
			},
		},
		children = {
			{
				ftype = "Frame",
				name = "GJBP_HeaderBG",
				text = { show = true, caption = L["GJBP_TITLE"], color = {r = 255, g = 255,	b = 255,	a = 1}, fs = "NumberFont_Shadow_Small", halign = "CENTER", valign = "CENTER"},
				rgba = {r = 123, g = 123, b = 123, a = 0},
				brgba = {r = 0, g = 0, b = 0, a = 0},
				dim = {w = 190, h = 20, s = 1},
				pos = {x = 5, y = -1, a = "TOPLEFT", r = "GJBP_BG", rp = "TOPLEFT"},
				show = true,
			},
			{
				ftype = "Button",
				name = "GJBP_Btn_Prev",
				template = "UIPanelButtonTemplate",
				text = { show = true, caption = L["CMD_PREV"], color = {r = 255, g = 255,	b = 255,	a = 1}, fs = "NumberFont_Shadow_Small", halign = "CENTER", valign = "CENTER"},
				rgba = {r = 123, g = 123, b = 123, a = 0},
				brgba = {r = 0, g = 0, b = 0, a = 0},
				dim = {w = 45, h = 17, s = 1},
				pos = {x = 5, y = 1, a = "BOTTOMLEFT", r = "GJBP_BG", rp = "BOTTOMLEFT"},
				show = true,
				clicks = {"LeftButtonUp"},
				scripts = {
					{
						event = "OnClick", 
						func = function( self, button, down )
							StopMusic()
							GJB.gMusicIndex	= GJB.gMusicIndex - 1
							if GJB.gMusicIndex < 1 then
								GJB.gMusicIndex = GJB.gMaxMusic
							end
							GJB:ProcessInfo()
						end
					},
				},
			},
			{
				ftype = "Button",
				name = "GJBP_Btn_Play",
				template = "UIPanelButtonTemplate",
				text = { show = true, caption = L["CMD_PLAY"], color = {r = 255, g = 255,	b = 255,	a = 1}, fs = "NumberFont_Shadow_Small", halign = "CENTER", valign = "CENTER"},
				rgba = {r = 123, g = 123, b = 123, a = 0},
				brgba = {r = 0, g = 0, b = 0, a = 0},
				dim = {w = 45, h = 17, s = 1},
				pos = {x = 3, y = 0, a = "BOTTOMLEFT", r = "GJBP_Btn_Prev", rp = "BOTTOMRIGHT"},
				show = true,
				clicks = {"LeftButtonUp"},
				scripts = {
					{
						event = "OnClick", 
						func = function( self, button, down )
							StopMusic() GJB:ProcessInfo()
						end
					},
				},
			},
			{
				ftype = "Button",
				name = "GJBP_Btn_Stop",
				template = "UIPanelButtonTemplate",
				text = { show = true, caption = L["CMD_STOP"], color = {r = 255, g = 255,	b = 255,	a = 1}, fs = "NumberFont_Shadow_Small", halign = "CENTER", valign = "CENTER"},
				rgba = {r = 123, g = 123, b = 123, a = 0},
				brgba = {r = 0, g = 0, b = 0, a = 0},
				dim = {w = 45, h = 17, s = 1},
				pos = {x = 3, y = 0, a = "BOTTOMLEFT", r = "GJBP_Btn_Play", rp = "BOTTOMRIGHT"},
				show = true,
				clicks = {"LeftButtonUp"},
				scripts = {
					{
						event = "OnClick", 
						func = function( self, button, down )
							StopMusic()
						end
					},
				},
			},
			{
				ftype = "Button",
				name = "GJBP_Btn_Next",
				template = "UIPanelButtonTemplate",
				text = { show = true, caption = L["CMD_NEXT"], color = {r = 255, g = 255,	b = 255,	a = 1}, fs = "NumberFont_Shadow_Small", halign = "CENTER", valign = "CENTER"},
				rgba = {r = 123, g = 123, b = 123, a = 0},
				brgba = {r = 0, g = 0, b = 0, a = 0},
				dim = {w = 45, h = 17, s = 1},
				pos = {x = 3, y = 0, a = "BOTTOMLEFT", r = "GJBP_Btn_Stop", rp = "BOTTOMRIGHT"},
				show = true,
				clicks = {"LeftButtonUp"},
				scripts = {
					{
						event = "OnClick", 
						func = function( self, button, down )
							StopMusic() GJB:ProcessInfo()
						end
					},
				},
			},			
		},
	},
}

-- ---------------------------------------------
-- Create the default settings for this addon 
-- ---------------------------------------------
local defaults = { 
    profile =  {
		musiclist = {},
		zonelist = {},
		shuffle = false,
		inlinetitle = false,
		petbattle = true,
		allmusic = false,
		chatoutput = true,
		shareparty = false,
		allowleadermusic = false,
		musicplayer = {
			pos= {
				a = "CENTER",
				r = "UIParent",
				rp = "CENTER",
				x = 0,
				y = 0,
			},
		},
		hidemusicplayer = false,
		minimap = {
			hide = false,
		},
	},
}

--[[=============================================================
						OnInitialize
    =============================================================]]
function GJB:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("GarrisonJukeBoxDB", defaults, true)
	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")

	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("GarrisonJukeBoxDB", self.GenerateOptions)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("GarrisonJukeBox", self.slashcmd, "gjb")
	
	local ACD3 = LibStub("AceConfigDialog-3.0")
	self.optionsFrames = {}
	self.optionsFrames.JukeBox = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["ADDON_NAME"], nil, "JukeBox")
	self.optionsFrames.Audio = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["OPT_AUDIO"], L["ADDON_NAME"], "Audio")
	self:RegisterModuleOptions("GJBSlashCmd", self.slashcmd, L["ADDON_SLASHCMD"])
	self:RegisterModuleOptions("Profiles", function() return LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) end, L["Profiles"])
	self.optionsFrames.About = ACD3:AddToBlizOptions("GarrisonJukeBoxDB", L["OPT_ABOUT"], L["ADDON_NAME"], "About")
	
	self.gMusicIndex = 1
	self.gMusicIndexIn = 1
	self.gMusicPlaying = false
	self.gMaxMusic = 0
	self.gMaxMusicIn = 0
	self.gPrevZone = 0
	self.gErrorPlay = false
	self.loadTimer = nil
	self.zoneTimer = nil
	self.musicTimer = nil
	self.isPartyLeader = false

	self:makeFrames(musicplayer)
	local pos = self.db.profile.musicplayer.pos
	self:setPosition("GJBP_BG", pos)
	
	self:CleanupProfileZoneList() -- verifies for invalid entries in the profile zonelist.
	self:CreateMinimapIcon()
	
	-- set minimap show/hide
	if self.db.profile.minimap.hide == true then
		
	else
	end

	self:Print(L["ADDON_NAME"] .. " " .. self.gVersion .. " " .. L["ADDON_LOADED"])
	
	self.OnInitialize = nil
end

function GJB:RegisterModuleOptions(name, optionTbl, displayName)
	if moduleOptions then
		moduleOptions[name] = optionTbl
	else
		self.options.args[name] = (type(optionTbl) == "function") and optionTbl() or optionTbl
	end
	self.optionsFrames[name] = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("GarrisonJukeBoxDB", displayName, L["ADDON_NAME"], name)
end

function GJB.GenerateOptions()
	if not GJB.options then
		GJB.GenerateOptionsInternal()
		GJB.GenerateOptionsInternal = nil
		moduleOptions = nil
	end
	return GJB.options
end

-- Option table for the slash command only
GJB.slashcmd = {
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
			func = function() StopMusic() end,
		},
		showicon = {
			order = 6,
			type = "execute",
			name = L["CMD_MINIMAP_SHOW"],
			desc = L["CMD_MINIMAP_SHOW_DESC"],
			func = function()
				GJB.db.profile.minimap.hide = false
				GJB.icon:Show("GarrisonJukeBox")
			end,
		},
		hideicon = {
			order = 7,
			type = "execute",
			name = L["CMD_MINIMAP_HIDE"],
			desc = L["CMD_MINIMAP_HIDE_DESC"],
			func = function()
				GJB.db.profile.minimap.hide = true 
				GJB.icon:Hide("GarrisonJukeBox")
			end,
		},
		showplayer = {
			order = 8,
			type = "execute",
			name = L["CMD_MINIMAP_HIDE"],
			desc = L["CMD_MINIMAP_HIDE_DESC"],
			func = function()
				GJB.db.profile.hidemusicplayer = false
				GJB:setVisible("GJBP_BG", true)
			end,
		},
		hideplayer = {
			order = 9,
			type = "execute",
			name = L["TOG_HIDEMUSICPLAYER"],
			desc = L["TOG_HIDEMUSICPLAYER_DESC"],
			func = function()
				GJB.db.profile.hidemusicplayer = true
				GJB:setVisible("GJBP_BG", false)
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

function GJB.GenerateOptionsInternal()
	-- Create the options variable to use in the config screen --
	GJB.options = {
		name = L["OPT_JUKEBOX_OPTIONS"],
		handler = GJB,
		type = "group",
		args = {
			JukeBox = {
				name = L["OPT_JUKEBOX"],
				desc = L["OPT_JUKEBOX_DESC"],
				type = "group",
				order = 1,
				args = {
					hdrjukebox = {
						name = L["SEL_JUKEBOX"],
						type = "header",
						order = 1,
					},
					expac = {
						type = "select",
						name = L["SEL_EXPANSION"],
						desc = L["SEL_EXPANSION_DESC"],
						style = "dropdown",
						values = "GetExpansions",
						set = function(info, value) GJB.expac = value end,
						get = "GetExpac",
						width = "normal",
						order = 2,
					},
					music = {
						type = "select",
						name = L["SEL_MUSIC"],
						desc = L["SEL_MUSIC_DESC"],
						style = "dropdown",
						values = "GetCurExpacMusicList",
						set = function(info, value) GJB.music = value end,
						get = "GetMusic",
						width = "normal",
						order = 3,
					},
					musicadd = {
						type = "execute",
						name = L["CMD_ADD"],
						desc = L["CMD_ADD_DESC"],
						func = function()
							local xps = GJB:GetExpansions()
							local xp = xps[GJB:GetExpac()]
							local mus = GJB:GetCurExpacMusicList()
							local mu = mus[GJB:GetMusic()]
							-- TODO[1]: Will we support multiple identical entries?
							tinsert(GJB.db.profile.musiclist, #GJB.db.profile.musiclist + 1, xp .. "/" .. mu)
							jukebox = xp .. "/" .. mu
						end,
						width = "half",
						order = 4,
					},
					space_musicadd = {name = " ",type = "description",width = "full",fontSize = "small",order = 5,},
					cmdplaysamplemusic = {
					-- press multiple times to play next sub-item in list
						type = "execute",
						name = L["OPT_PLAYSAMPLE"],
						desc = L["OPT_PLAYSAMPLE_DESC"],
						func = function()
							local xps = GJB:GetExpansions()
							local xp = xps[GJB:GetExpac()]
							local mus = GJB:GetCurExpacMusicList()
							local mu = mus[GJB:GetMusic()]
							local ft = GJB:MusicListFromJukeBoxItem(xp .. "/" .. mu) -- gets a table of music files to play from musictable[n]
							
							-- check if there are sub-items
							if #ft > 0 then
								-- check what sub-item we play
								if GJB.gSamplePlayed ~= GJB.expac .. GJB.music then
									GJB.gSampleIndex = 1
									GJB.gSamplePlayed = GJB.expac .. GJB.music
								else
									GJB.gSampleIndex = GJB.gSampleIndex + 1
									if GJB.gSampleIndex > #ft then
										GJB.gSampleIndex = 1
									end
								end
								
								-- play music
								StopMusic()
								GJB.gMusicPlaying = false
								GJB:CancelTimer(GJB.musicTimer)
								PlayMusic(GJB.musictable[GJB.expac][GJB.music].files[GJB.gSampleIndex][1])
								GJB:Print(L["SAMPLE_MUSIC"] .. xp .. "/" .. mu)
								GJB:Print(L["SAMPLE_FILE"] .. GJB.musictable[GJB.expac][GJB.music].files[GJB.gSampleIndex][1])
							end
						end,
						width = "normal",
						order = 6,
					},
					cmdstopsound = {
						type = "execute",
						name = L["CMD_STOP"],
						func = function() StopMusic() GJB:ProcessInfo()	end,
						width = "half",
						order = 7,
					},
					space_stopsound = {name = " ",type = "description",width = "full",fontSize = "small",order = 8,},
					musiclist = {
						type = "select",
						name = L["SEL_JUKEBOX"],
						desc = L["SEL_JUKEBOX_DESC"],
						style = "dropdown",
						values = function() return GJB.db.profile.musiclist	end,
						set = function(info, value) GJB.jukebox = value	end,
						get = function(info) return GJB.jukebox	end,
						width = "double",
						order = 9,
					},
					musicdelete = {
						type = "execute",
						name = L["CMD_REMOVE"],
						desc = L["CMD_REMOVE_DESC"],
						func = function() tremove(GJB.db.profile.musiclist, GJB.jukebox) end,
						width = "half",
						order = 10,
					},
					musicdeleteall = {
						type = "execute",
						name = L["CMD_REMOVEALL"],
						desc = L["CMD_REMOVEALL_DESC"],
						func = function() GJB.db.profile.musiclist = {}	GJB.jukebox = "" end,
						width = "normal",
						order = 11,
					},
					space_remallmusic = {name = " ",type = "description",width = "full",fontSize = "small",order = 12,},
					descspaceshuffle = {
						name = "",
						type = "description",
						width = "full",
						fontSize = "small",
						order = 13,
					},
					shuffle = {
						type = "toggle",
						name = L["TOG_SHUFFLE"],
						desc = L["TOG_SHUFFLE_DESC"],
						set = function(info, value) GJB.db.profile.shuffle = value end,
						get = function(info) return GJB.db.profile.shuffle end,
						width = "normal",
						order = 14,
					},
					inlinetitle = {
						type = "toggle",
						name = L["TOG_INLINE"],
						desc = L["TOG_INLINE_DESC"],
						set = function(info, value) GJB.db.profile.inlinetitle = value end,
						get = function(info) return GJB.db.profile.inlinetitle end,
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
							GJB.db.profile.minimap.hide = value
							if value == true then
								GJB.icon:Hide("GarrisonJukeBox")
							else
								GJB.icon:Show("GarrisonJukeBox")
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
					hdrselection = {
						name = L["HDR_ZONES"],
						type = "header",
						order = 21,
					},
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
						values = "GetCurContZoneList",
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
							local cts = GJB:GetContinents()
							local ct = cts[GJB:GetContinent()]
							local zns = GJB:GetCurContZoneList()
							local zn = zns[GJB:GetZone()]
							-- do not add a double entry
							local addok = true
							for i = 1, #GJB.db.profile.zonelist do
								if GJB.db.profile.zonelist[i] == ct .. "/" .. zn then
									addok = false
									break
								end
							end
							
							if addok == true then
								tinsert(GJB.db.profile.zonelist, #GJB.db.profile.zonelist + 1, ct .. "/" .. zn)
								zonebox = ct .. "/" .. zn
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
						values = function()	return GJB.db.profile.zonelist end,
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
						func = function() GJB.db.profile.zonelist = {} GJB.zonebox = ""	end,
						width = "normal",
						order = 27,
					},			
					space_remallzones = {name = " ",type = "description",width = "full",fontSize = "small",order = 26,},
					hdrplayer = {
						name = L["HDR_AUDIOPLAYER"],
						type = "header",
						order = 28,
					},
					play = {
						type = "execute",
						name = L["CMD_PLAY"],
						func = function() StopMusic() GJB:ProcessInfo() end,
						width = "half",
						order = 29,
					},
					prev = {
						type = "execute",
						name = L["CMD_PREV"],
						func = function()
							StopMusic()
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
						func = function() StopMusic() GJB:ProcessInfo() end,
						width = "half",
						order = 31,
					},
					stop = {
						type = "execute",
						name = L["CMD_STOP"],
						func = function() StopMusic() end,
						width = "half",
						order = 32,
					},
					hidemusicplayer = {
						type = "toggle",
						name = L["TOG_HIDEMUSICPLAYER"],
						desc = L["TOG_HIDEMUSICPLAYER_DESC"],
						set = function(info, value)
							GJB.db.profile.hidemusicplayer = value
							GJB:setVisibility("GJBP_BG", not value)
						end,
						get = function(info) return GJB.db.profile.hidemusicplayer end,
						width = "normal",
						order = 33,
					},
				},
			},
			Audio = {
				name = L["OPT_AUDIO"],
				desc = L["OPT_AUDIO_DESC"],
				type = "group",
				order = 2,
				args = {
					txtplaysound = {
						name = L["INP_WOWAUDIOFILE"],
						type = "input",
						width = "double",
						set = function(info, value)	GJB.playsoundfile = value end,
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
							PlayMusic(GJB.playsoundfile)
							GJB:Print(L["PLAYING"] .. GJB.playsoundfile)
						end,
						width = "half",
						order = 2,
					},
					cmdstopsound = {
						type = "execute",
						name = L["CMD_STOP"],
						func = function() StopMusic() GJB:ProcessInfo() end,
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
				},
			},
			About = {
				name = L["OPT_ABOUT"],
				desc = "",
				type = "group",
				order = 3,
				args = {
					desctitle = {
						name = LTC:setColor(L["ADDON_NAME"] .. " " .. GJB.gVersion .. " - " .. GJB.gCurReleaseDate, LTC_GREEN),
						type = "description",
						width = "full",
						fontSize = "medium",
						order = 1,
					},
					descauthor = {
						name = LTC:setColor(L["ADDON_AUTHOR"] .. " " .. "Azmaedus", LTC_BLUE),
						type = "description",
						width = "full",
						fontSize = "medium",
						order = 2,
					},
					descslashhdr = {
						name = "\r" .. L["ABOUT_SLASHCMD_TITLE"],
						type = "description",
						width = "full",
						fontSize = "medium",
						order = 3,
					},
					descslashplay = {
						name = L["ABOUT_SLASHCMD_CONFIG"] .. L["ABOUT_SLASHCMD_PLAY"] .. L["ABOUT_SLASHCMD_PREV"] .. L["ABOUT_SLASHCMD_NEXT"] .. L["ABOUT_SLASHCMD_STOP"],
						type = "description",
						width = "full",
						fontSize = "small",
						order = 4,
					},
				},
			},
		},
	}
	
	for k, v in pairs(moduleOptions) do
		GJB.options.args[k] = (type(v) == "function") and v() or v
	end

	-- Add ordering data to the option table generated by AceDBOptions-3.0
	GJB.options.args.Profiles.order = -2
end

-- function to get a table of all expansion/category names with keys that match the options table
function GJB:GetExpansions()
	return {i1wow = EXPANSION_NAME0,i2bc = EXPANSION_NAME1,i3wotlk = EXPANSION_NAME2,i4cata = EXPANSION_NAME3,i4catarevamp = EXPANSION_NAME3 .. L["EXP_REVAMP"],i5mop = EXPANSION_NAME4,i6wod = EXPANSION_NAME5,i7events = L["EXP_WCEVENTS"],}
end

-- function to get a table of all continent/world names with keys that match the options table
function GJB:GetContinents()
	return {i1kalimdor = L["KALIMDOR"],i2eastern = L["EASTERNKINGDOMS"],i3outland = L["OUTLAND"],i4north = L["NORTHREND"],i5cata = L["CATACLYSM"],i6pandaria = L["PANDARIA"],i7draenor = L["DRAENOR"],}
end

-- options table functions that may be called from more than one component
function GJB:GetCurExpacMusicList()
	local tbl = self.musictable[self:GetExpac()]
	local t = {}
	for k, v in pairs(tbl) do
		tinsert(t, k, v["name"])
	end
	return t
end

-- options table functions that may be called from more than one component
function GJB:GetCurContZoneList()
	local tbl = self.zonetable[self:GetContinent()]
	local t = {}
	for k, v in ipairs(tbl) do
		tinsert(t, k, v[1])
	end
	return t
end

function GJB:GetExpac(info) return GJB.expac end
function GJB:GetMusic(info) return GJB.music end
function GJB:GetContinent(info) return GJB.continent end
function GJB:GetZone(info) return GJB.zone end

function GJB:GetZones()
	local tbl = {}
	for i = 1, #self.zonetable do
		tinsert(tbl, self.zonetable[i][1])
	end
	return tbl
end

function GJB:ShowConfig()
	-- Open the profiles tab before, so the menu expands
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrames.Profiles)
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrames.JukeBox)
end

--[[=============================================================
						OnEnable
    =============================================================]]
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

--[[=============================================================
						OnDisable
    =============================================================]]
function GJB:OnDisable()
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	self:UnregisterEvent("PET_BATTLE_OPENING_START")
	self:UnregisterEvent("PET_BATTLE_OVER")
	self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
	self:UnregisterEvent("ZONE_CHANGED_INDOORS")
	self:UnregisterEvent("ZONE_CHANGED")
	self:UnregisterEvent("GROUP_ROSTER_UPDATE")
end

-- -------------------------------------------
-- Events
-- -------------------------------------------
-- TODO: implement a blacklist to avoid asking the same players in the group that you already asked this group session.
function GJB:OnJoinParty(event, ...)
	if IsInRaid() then return end -- cannot be in a raid
	if not IsInGroup() then return end -- must be in a group
	
	local temp = {}
	local found = false
	-- build list of current group members
	local n = GetNumGroupMembers()
	for i=1,n-1 do -- n-1 because there are 4 members + "player" (you)
		local name = GetUnitName("party"..i, true)
		for y=1,#self.BlackList do
			if self.BlackList[y] == name then
				found = true
				break
			end
		end
		
		if found == false then
			table.insert(temp, name)
		end
	end

	-- loop through the tables and send messages to query for version only if not already done this login session
	if GJB.gOODShouted == false then
		if table.getn(temp) > 0 then
			local t = {}
			local s = self:Serialize(t)
			for i=1,#temp do
				if GJB.gOODShouted == true then return
				else
					--print("Sent version request to: " .. temp[i])
					self:SendCommMessage(COMM_PREFIX.."ReqVersion", s, "WHISPER", temp[i])
				end
			end
		end
	end
	self.Party = temp
end

-- localver is the current version of the requester, remotever is the one being tested against(the one received from another player)
function GJB:isVersionOOD(localver, remotever)
	for i=1,5 do
		if localver[i] < remotever[i] then
			return true
		end
	end
	
	return false
end

function GJB:sendMusicToParty(m, l)
	local n = GetNumGroupMembers()
	if n > 1 and n <= 5 then
		local t = { music = m, sec = l }
		local s = self:Serialize(t)
		for u=2,n do
			local name = GetUnitName("party"..u-1)
			if name or name ~= "" then
				self:SendCommMessage(COMM_PREFIX.."GetMusic", s, "WHISPER", name)
			end
		end
	end
end

--[[=============================================================
					Inter-Addon Communications
    =============================================================]]
-- only can be received from the party leader. Tells other party members what music the leader is currently playing
function GJB:OnBuddyListenMusic(prefix, message, dist, sender)
	-- make sure the addon only computes messages from GJB and in the WHISPER channel and that the values are ok to process
	if prefix ~= COMM_PREFIX .. "GetMusic" and dist ~= "WHISPER" then return
	elseif sender == nil or sender == "" then return
	elseif message == nil or message == "" then return
	else
		if self.db.profile.allowleadermusic and UnitIsGroupLeader("player") == false then
			-- only play the music from the leader if you are in one of your selected zones
			self.gCurZoneID = GetCurrentMapAreaID()
			if self:IsInZoneList(self.gCurZoneID) then
				local success, o = self:Deserialize(message)
				if success == false then return -- Failure
				else
					self:CancelTimer(self.musicTimer)
					-- stop and play
					StopMusic()
					PlayMusic(t["music"])
					
					if GJB.db.profile.chatoutput then
						self:Print(L["PLAYING"] .. " " .. t["music"] .. " " .. "from" .. " " .. sender)
					end
					
					gMusicPlaying = true
					self.musicTimer = self:ScheduleTimer("TimerEventMusic", t["sec"])
				end
			end
		end
	end
end
	
-- Receive a request to send the version info to another party member
function GJB:OnBuddyReqVersion(prefix, message, dist, sender)
	-- make sure the addon only computes messages from GJB and in the WHISPER channel and that the values are ok to process
	if prefix ~= COMM_PREFIX .. "ReqVersion" and dist ~= "WHISPER" then return
	elseif sender == nil or sender == "" then return
	else
		local t = { version = self.gVersionID }
		local s = self:Serialize(t)
		self:SendCommMessage(COMM_PREFIX.."SentVersion", s, "WHISPER", sender)
	end
end

-- Receive a message with a versionID. Compare it to your own and if you are out-of-date, print to chat pane
function GJB:OnBuddySentVersion(prefix, message, dist, sender)
	-- make sure the addon only computes messages from GJB and in the WHISPER channel
	if prefix ~= COMM_PREFIX .. "SentVersion" and dist ~= "WHISPER" then return
	elseif sender == nil or sender == "" or message == nil or message == "" then return
	else
		local success, o = self:Deserialize(message)
		if success == false then return -- Fail
		else
			if o["version"] == nil or o["version"] == "" then return -- Fail
			else
				if self:isVersionOOD(self.gVersionID, o["version"]) then
					self:Print(LTC:setColor( L["ADDON_OUT_OF_DATE"], LTC_RED) .. " " .. o["version"])
					GJB.gOODShouted = true
				else
					-- add to blacklist
					table.insert(self.BlackList, sender) 
				end
			end
		end
	end
end

-- -------------------------------------------
-- Events
-- -------------------------------------------
function GJB:OnProfileChanged(event, database, newProfileKey)
	db = database.profile
	self.db.profile.musiclist = db.musiclist
	self.db.profile.zonelist = db.zonelist
	self.db.profile.shuffle = db.shuffle
	self.db.profile.petbattle = db.petbattle
	self.db.profile.allmusic = db.allmusic
	self.db.profile.enabled = db.enabled
	self.db.profile.minimap.hide = db.minimap.hide
	self.db.profile.musicplayer = db.musicplayer

	--LFX:makeFrames(musicplayer)
	local pos = self.db.profile.musicplayer.pos
	self:setPosition("GJBP_BG", pos)

	if self.db.profile.hidemusicplayer == true then
		self:setVisibility("GJBP_BG", false)
	else
		self:setVisibility("GJBP_BG", true)
	end

	if self.db.profile.minimap.hide == true then
		self.icon:Hide("GarrisonJukeBox")
	else
		self.icon:Show("GarrisonJukeBox")
	end
	
	self:CancelTimer(self.musicTimer)
	self.loadTimer = self:ScheduleTimer("TimerLoaded", ON_LOAD_TIMER)
end

function GJB:OnPEWEvent(event, ...)
	--self:Print("OnPEWEvent fired!")
	StopMusic()
	self.gMusicPlaying = false
	self.gPrevZone = GetCurrentMapAreaID()
	
	if self.db.profile.minimap.hide then
		self.icon:Hide("GarrisonJukeBox")
	else
		self.icon:Show("GarrisonJukeBox")
	end

	self.loadTimer = self:ScheduleTimer("TimerLoaded", ON_LOAD_TIMER)
end
function GJB:TimerLoaded()
	--self:Print("TimerEventLoaded fired!" )
	self:CancelTimer(self.loadTimer)
	self.gCurZoneID = GetCurrentMapAreaID()
	self:ProcessInfo()
end

function GJB:TimerEvent()
	--self:Print("TimerEvent fired!")
	self.gCurZoneID = GetCurrentMapAreaID() 
	if self.gPrevZone ~= self.gCurZoneID or self.gErrorPlay == true then
		if self:IsInZoneList(self.gPrevZone) == true and self:IsInZoneList(self.gCurZoneID) == true then
		else
			self.gPrevZone = self.gCurZoneID
			self.gErrorPlay = false
			self:ProcessInfo()
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

function GJB:OnZoneChanged(event, ...)
	self.zoneTimer = self:ScheduleTimer("TimerEvent", ON_ZONE_TIMER)
	--self:Print("OnZoneChanged:" .. gCurZoneID)
end

function GJB:OnZoneChangedIndoors(event, ...)
	self.zoneTimer = self:ScheduleTimer("TimerEvent", ON_ZONE_TIMER)
	--self:Print("OnZoneChangedIndoors:" .. gCurZoneID)
end

function GJB:OnZoneChangedNewArea(event, ...)
	self.zoneTimer = self:ScheduleTimer("TimerEvent", ON_ZONE_TIMER)
	--self:Print("OnZoneChangedNewArea:" .. gCurZoneID)
end

function GJB:OnPetBattleStart(event, ...)
	if self:IsInZoneList(self.gCurZoneID) then
		self.gPetBattleEnabled = true
		self:ProcessInfo()
	end
end

function GJB:OnPetBattleEnd(event, ...)
	if self:IsInZoneList(self.gCurZoneID) then
		self.gPetBattleEnabled = false
		self.zoneTimer = self:ScheduleTimer("TimerEventPetBattle", ON_PETBATTLE_TIMER)
	end
end

-- -------------------------------------------
-- function to sort a musictable
-- -------------------------------------------
function GJB:SortMusicTable(tbl)
	for _, v in pairs(tbl) do
		table.sort(v, function(a,b) return a["name"] < b["name"] end)
	end
	return tbl
end

-- -------------------------------------------
-- function to sort a zonetable
-- -------------------------------------------
function GJB:SortZoneTable(tbl)
	for _, v in pairs(tbl) do
		table.sort(v, function(a,b) return a[1] < b[1] end)
	end
	return tbl
end

-- -------------------------------------------
-- function to set the musictable from musictable.lua
-- -------------------------------------------
function GJB:SetMusicTable(tbl)
	-- sort titles alphabetically ASC ( A --> Z )
	 self.musictable = self:SortMusicTable(tbl)
end

-- -------------------------------------------
-- function to set the zonetable from zonetable.lua
-- -------------------------------------------
function GJB:SetZoneTable(tbl)
	-- sort zones alphabetically ASC ( A --> Z )
	 self.zonetable = self:SortZoneTable(tbl)
end

-- -------------------------------------------
-- function to verify if supplied zone is a valid entry for a profile zonelist
-- -------------------------------------------
function GJB:IsZoneValid(s)
	-- find continent
	local b = strfind(s, "/") -- slash
	local ns = strsub(s, 1, b-1) -- continent
	local cns = self:GetContinents()
	local cni = table_invert(cns)
	local idx = cni[ns]
	if idx ~= nil then
		-- find zone
		ns = strsub(s, b+1)
		for _, v in ipairs(self.zonetable[idx]) do
			if v[1] == ns then
				return true
			end
		end
	end
	return false
end

-- -------------------------------------------
-- function to clean up the profile zonelist for invalid entries
-- -------------------------------------------
function GJB:CleanupProfileZoneList()
	for i = 1, #self.db.profile.zonelist do
		if self:IsZoneValid(self.db.profile.zonelist[i]) == false then
			
			-- remove entry
			if GJB.db.profile.chatoutput then
				self:Print(self.db.profile.zonelist[i] .. L["ADDON_REMOVEZONE"])
			end
			tremove(self.db.profile.zonelist, i)
		end
	end
end

-- -------------------------------------------
-- function called to determine if music needs to be played or stopped
-- -------------------------------------------
function GJB:ProcessInfo()
	local playstate = false
	--self:Print("ProcessInfo gCurZoneID: " .. tostring(gCurZoneID))
	if self:IsInZoneList(self.gCurZoneID) then
		if self.gPetBattleEnabled == true then
			if self.db.profile.petbattle == false then
				playstate = true
			end
		else
			playstate = true
		end
	end
	
	if playstate == true then
		self.gMaxMusic = table.getn(self.db.profile.musiclist)
		if self.gMaxMusic > 0 then
			self:PlayMusicList()
		end
	elseif self.gMusicPlaying == true then
		StopMusic()
		self.gMusicPlaying = false
		self:CancelTimer(self.musicTimer)
	end
end

-- gets the zone name by id
function GJB:GetZoneNameByID(id)
	for k, v in pairs(self.zonetable) do
		for _, v2 in ipairs(v) do
			if v2[2] == id then
				return self:GetContinents()[k] .. "/" .. v2[1]
			end
		end
	end
	return 0
end

-- verifies if the submitted zone name is in the selected zones (zonelist)
function GJB:IsInZoneList(id)
	for _, v in ipairs(self.db.profile.zonelist) do
		if v == self:GetZoneNameByID(id) then
			return true
		end
	end
	return false
end

-- -------------------------------------------
-- Table Invert for query of key
-- -------------------------------------------
function table_invert(t)
   local s={}
   for k,v in pairs(t) do
     s[v]=k
   end
   return s
end

-- -------------------------------------------
-- break apart the musiclist item to find out what file to play in the musicfile table
-- returns a table representing the music info
-- -------------------------------------------
function GJB:MusicListFromJukeBoxItem(s)
	local idx = 0
	
	-- get the expansion key
	local b = strfind(s, "/")
	local ns = strsub(s, 1, b-1)
	local xp = self:GetExpansions() -- 
	local xpi = table_invert(xp)
	idx = xpi[ns]

	-- get music info
	ns = strsub(s, b+1)
	local mt = self.musictable[idx] -- get table of music infos relative to the expansion
	
	-- loop through tables to find the music info
	for k, v in ipairs(mt) do
		if v["name"] == ns then
			return v["files"]
		end
	end
end

-- -------------------------------------------
-- function to play an item in the musiclist table
-- -------------------------------------------
function GJB:PlayMusicList()
	if self.db.profile.allmusic == true then -- disregard the jukebox list and play a random file
		self:CancelTimer(self.musicTimer)
		-- play a random song from the musictable
		local xpkeys = {"i1wow","i2bc","i3wotlk","i4cata","i4catarevamp","i5mop","i6wod","i7events"}
		local xps = self:GetExpansions()
		local xpi = xpkeys[math.random(1, #xpkeys)] -- random key
		local mui = math.random(1, #self.musictable[xpi])
		local muii = math.random(1, #self.musictable[xpi][mui].files) 
		
		-- stop and play
		StopMusic()
		PlayMusic(self.musictable[xpi][mui].files[muii][1])
		local ptime = self.musictable[xpi][mui].files[muii][2]
		local mins = floor(ptime/60)
		local secs = ptime - (mins * 60)
		
		if GJB.db.profile.chatoutput then
			self:Print(L["PLAYING"] .. xps[xpi] .. "/" .. self.musictable[xpi][mui]["name"] .. " " .. mins .. ":" .. fmt("%02d", secs))
		end
		
		gMusicPlaying = true
		self.musicTimer = self:ScheduleTimer("TimerEventMusic", self.musictable[xpi][mui].files[muii][2])
	else
		self.gErrorPlay = false
		self:CancelTimer(self.musicTimer)
		
		-- check if the list has shrunk since last pass and index is greater than number of list items
		if self.gMusicIndex > self.gMaxMusic then
			self.gMusicIndex = self.gMaxMusic
		end
		
		-- check if the playlist is in shuffle mode
		if self.db.profile.shuffle == true then
			if self.gMusicIndexPrev == 0 or self.gMaxMusic == 1 then -- just random it! first pass or only 1 item in list
				-- make sure we don't random a single item
				if self.gMaxMusic > 1 then
					self.gMusicIndex = math.random(1, self.gMaxMusic)
				end
			else
				-- check if inlinetitle is enabled. If it is, play next mp3 in title
				if self.db.profile.inlinetitle == true then
					-- test if there's a next sub-item in title to play
					if self.gMusicIndexIn == nil then
						self.gMusicIndexIn = 1
					elseif self.gMusicIndexIn < table.getn(self:MusicListFromJukeBoxItem(self.db.profile.musiclist[self.gMusicIndex])) then
						self.gMusicIndexIn = self.gMusicIndexIn + 1
					else
						-- random title and set musicindexin to 0
						while self.gMusicIndex == self.gMusicIndexPrev do
							self.gMusicIndex = math.random(1, self.gMaxMusic)
						end
						self.gMusicIndexIn = 1
					end
				else
					while self.gMusicIndex == self.gMusicIndexPrev do
						self.gMusicIndex = math.random(1, self.gMaxMusic)
					end
				end
			end
			self.gMusicIndexPrev = self.gMusicIndex
		end
		
		-- get table of music files to play
		local mli = self.db.profile.musiclist[self.gMusicIndex] -- get the string representing what title should be playing
		if mli == nil then
			self.gErrorPlay = PLAYERROR_INV_STRING
		end

		-- check for errors
		if (mli ~= nil or mli ~= "") and self.gErrorPlay == false then
			local ft = self:MusicListFromJukeBoxItem(mli) -- gets a table of sub-items to play from musictable
			-- there is sometimes an error when ft == nil. I have not been able to debug this one as it doesn't happen often.
			-- I will try to detect the title's file list against nil and retry it a few seconds later
			if ft ~= nil then
				if self.db.profile.shuffle == true then 
					if self.db.profile.inlinetitle == false then
						-- get random index of sub-item to play
						self.gMaxMusicIn = table.getn(ft) -- get number of sub-items
						self.gMusicIndexIn = math.random(1, self.gMaxMusicIn)
					end
				end
				
				local info = ft[self.gMusicIndexIn]
					
				-- stop and play
				StopMusic()
				
				-- check if we send music to other party members
				if self.db.profile.shareparty and UnitIsGroupLeader("player") then
					self:sendMusicToParty(info[1], info[2]+2) -- I'm adding 2 secs to make sure that the leader has time to send next tune
				end
								
				PlayMusic(info[1])
				local ptime = info[2]
				local mins = floor(ptime/60)
				local secs = ptime - (mins * 60)
				
				if GJB.db.profile.chatoutput then
					self:Print(L["PLAYING"] .. "#" .. self.gMusicIndex .. " - " .. self.db.profile.musiclist[self.gMusicIndex] .. " (" .. self.gMusicIndexIn .. ") " .. mins .. ":" .. fmt("%02d", secs))
				end
				
				self.gMusicPlaying = true
				self.musicTimer = self:ScheduleTimer("TimerEventMusic", info[2])

				-- increment index after item is playing
				if self.gMusicIndex == self.gMaxMusic then
					self.gMusicIndex = 1
				elseif self.db.profile.shuffle == false then
					self.gMusicIndex = self.gMusicIndex + 1
				end
			else
				self.gErrorPlay = PLAYERROR_INV_TITLE
			end
		else
			self.gErrorPlay = PLAYERROR_INV_STRING
		end
		
		-- Do timer based on error type
		if self.gErrorPlay == PLAYERROR_INV_TITLE then
			if GJB.db.profile.chatoutput then
				self:Print(L["ADDON_TITLENOTFOUND"] .. self.db.profile.musiclist[self.gMusicIndex] .. "[" .. self.gMusicIndex .. "]" .. "\r" .. L["ADDON_FILEREMOVEMSG"])
			end
			
			tremove(self.db.profile.musiclist, self.gMusicIndex)
			self.zoneTimer = self:ScheduleTimer("TimerEvent", ON_ZONE_TIMER) -- set timer to play next in list
		elseif self.gErrorPlay == PLAYERROR_INV_STRING then
			if GJB.db.profile.chatoutput then
				self:Print(L["ADDON_SEARCHFAILED"] .. self.gMusicIndex)
			end
			
			self.zoneTimer = self:ScheduleTimer("TimerEvent", ON_ZONE_TIMER) -- set timer to play next in list
		end
	end
end
