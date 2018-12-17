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
									Fixed a few issues with inter-addon communication
									Added 90% compatibility with 1.0.8.0+
									Fixed option "Hide Music Player" in the options UI that worked reversely to its intended behaviour. When checked, it showed the player.
	02/07/2015 - 1.0.9.1	Added Raids & Dungeons (Highmaul & BR Foundry) others to come
									Fixed issue of hiding the music player caused a lua error on line 595
									Fixed a few issues with inter-addon communication. (still not fully working)
	02/07/2015 - 1.1.0.0	Split up options UI into several categories to create some space for other features.
									Implemented an exclusion list to avoid playing specific unwanted mp3s from titles.
	02/08/2015 - 1.1.0.1	Fixed issue with inline play and non shuffle play.
									Added nil check for function SongInBlackList .
									Added some more evens and other musics.
									Added an option to disregard zonelist and play the jukebox everywhere.
	02/23/2015 - 1.1.0.2	Added the Angelic music to Classic >> Ashenvale.
	02/23/2015 - 1.1.0.3	Added resetpos slash command.
									Fixed issue where during a pet battle and having the pet battle option checked, would play the original garrison music instead of the pet battle music.
									Fixed localization of slash command buttons showplayer and hideplayer.
									Fixed issue with frame positioning; wasn't calling ClearAllPoints() prior in LibFrameX:setPosition.
									Updated the about tab with missing slash commands.
	02/23/2015 - 1.1.0.4 	Forgot to upload locale enUS.
	
	==== 6.1 (60100) ===
	02/24/2015 - 1.1.0.5	Updated toc for interface version 60100.
	02/26/2015 - 1.1.0.6	Fixed issue when a single entry was in the jukebox list and the options 'Shuffle' + 'Inline' were selected would cause the item to play without changing subindex.
									Fixed issue with exclusion list entering an infinite loop that caused the game to freeze.
									Completed the Classic >> Molten Core music title.
	02/27/2015 - 1.2.0.0	Added an advanced tab to create customized playlists that play within select zones.
									Fixed issues related to exclusions that would cause an invalid error message or infinte loop
	03/01/2015 - 1.2.0.1	Fixed issue with exclusion of multiple non consecutive items would crash the game (infinite loop)
	03/03/2015 - 1.2.0.2	Fixed issue with possible nil in exclusion list finder
									Added missing Molten Core music files
	03/04/2015 - 1.2.0.3	Fixed error in music of Teldrasil; seperated Elwynn Forest into its own title.
	03/06/2015 - 1.2.0.4	Devised a better way of sampling music.
	03/07/2015 - 1.2.0.5	Fixed issue with playing music when all music is selected without anything configured in the jukebox.
	03/07/2015 - 1.2.0.6	Fixed all Stop commands that were not cancelling the timer to play the next song.
	03/10/2015 - 1.2.0.7	Fixed infinite loop when All Zones was checked with an empty jukebox.
	05/09/2015 - 1.2.0.8	Added a feature to play a silent file between songs in the playlist.
	05/09/2015 - 1.2.0.9	Fixed lazy programming of added feature in 1.2.0.8. Bad Az!
									Changed from an input box to a range select for time of pause setting.
	05/16/2015 - 1.2.0.10	Added Proving Grounds zone
	
	==== 6.2 (60200) ===
	05/16/2015 - 1.2.0.11	Changed version ID to 60200
	08/06/2015 - 1.2.1.0	Added STMode (Single Track Mode) To create another type of musiclist populated with .mp3s instead of titles.

	==== Version 2 rewrite ===
	09/19/2015 - 2.0.0.0	Version 2 complete rewrite of the code with modularization.
										Fixed creation of music player main frame to UIParent. (alt+z)
	
	10/04/2015 - 2.0.0.2	Added a message box to display beta information.
										Fixed inter-addon communication.
										
	10/05/2015 - 2.0.0.3	Release
	
	10/09/2015 - 2.0.0.4	Fixed a bug to get excluded files in advanced mode.
	
	10/30/2015 - 2.0.0.5	Added better search capabilities to fetch items in the musictable by using an indexing table.
										Converted the Blizzard Music Rolls 6.1 to use PlayMusic instead of PlaySoundKitID
										Added Tanaan Jungle Music
										Added Invincible Music
										Added Valley of the Four Winds Music
	
	11/15/2015 - 2.0.0.6	Disabled support for PlaySoundKitID() as it was causing unwanted behaviour (SetCVar Sound_EnableMusic)

	11/15/2015 - 2.0.0.7	Minor bug fixes.
	
	12/13/2015 - 2.0.0.8	Added Bug Helper (Fix) for music continuing to play (Tune-O-Tron 5000) after exiting the Garrison.

	03/28/2016 - 2.0.0.11 Fixed issue with server response "cannot find player x" when sharing music with party.
	
	05-23-2016 - 2.0.1.0	Started work on history list.
	
	07-10-2016 - 2.0.1.1	Started to add Legion Zones & Music into Legion Beta.
	
	07-20-2016 - 2.0.1.2	Completed Legion related entries that I could find.
										Disabled Legion entries until launch.
										Fixed issue on PEW event triggering twice using PEW delta time.
	
	07-21-2016 - 2.0.1.3	Commented debug OnZone trigger.
										
	07-20-2016 - 2.0.1.2	Completed Legion related entries that I could find.
										Disabled Legion entries until launch.
										Fixed issue on PEW event triggering twice using PEW delta time.
										
	07-20-2016 - 2.0.1.3	Commented OnZone trigger. Deleted version (bad build)
	
	07-23-2016 - 2.0.1.4	Fixed Zones category bug in options screen.
	
	07-31-2016 - 2.0.1.5	Removed anoying empty history frame.
	
	07-31-2016 - 2.0.1.6	Fixed a non tested change /slapmyself.
	
	08-04-2016 - 2.0.2.3b	Added missing zones up to WoD.
										Enhanced the localization code (embedded localization with addon as a member).
										Fixed music player back and play buttons (bug)
										Removed GJB from the global space.
										Temp fixed previous version saved variables reset with user choice (work in progress).
										
	08-30-2016 - 2.0.2.3	Release version
	
	09-10-2016 - 2.0.2.4	Added a reset button in settings to reset all addon configurations except for the playlists and zones.
	
	03-03-2017 - 2.0.2.5	Changed interface version to 70100
									
	03-03-2018 - 2.0.2.6	Changed interface version to 70300
										Added some Legion Zones & Music
	
	08-13-2018 - 2.1.0.0	Changed interface version to 80000
										Added zone translation table for patch 8.0.1 new zone handling.
										Added BFA music
										Changed GetZoneID calls to new C_Map.GetBestMapForUnit("player")
	
	12-17-2018 - 2.1.0.1	Changed interface version to 80100
										Added BFA zones (new raids and battlegrounds to come...)

	Known Bugs/Issues
	-------------------------
	- The alignment of text in the selected sample music is aligned to the right but should be left. This is caused by Ace3 GUI; not a bug.
	- Sometimes when changing from a zone not on the zonelist to a zone that is, GJB will play 2 consecutive songs. Possibly fixed but needs additional testing. FIXED!
	- Enable/Disable checkbox in settings for the addon seems not to function properly.
]]

-- Load the Ace libraries --
local GJB = LibStub("AceAddon-3.0"):NewAddon("GarrisonJukeBox", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceComm-3.0", "AceSerializer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")
GJB.L = L

-- DEBUG MODES --
GJB.DEBUG = true

-- metadata
GJB.gVersion = GetAddOnMetadata("GarrisonJukeBox", "Version")
GJB.gVersionID = {2,1,0,1,2} -- release major, release minor, build major, build minor, type (alpha 0, beta 1, release 2)
GJB.gCurReleaseDate = "12/17/2018"

-- table to hold all music and zone and music player data
GJB.musictable = {}
GJB.mtid = {}	-- Table to hold the musictable position references with id's as keys
GJB.zonetable = {}
GJB.mplayer = {}
GJB.mbox = {}
GJB.gMilestone1210 = {1,2,1,0,3} -- Used to test for previous or equal to version 1.2.1.0 (Milestone1)

-- constants
GJB.VERSION_TABLE_SIZE = 5			-- Number of elements in version table.
GJB.PLAYERROR_NONE = 0
GJB.PLAYERROR_TITLE_NIL = 1			-- When an nil table is passed to PlayMusicList
GJB.PLAYERROR_INV_TITLE = 2			-- When an invalid title is passed (remove the corrupted entry from jukebox)
GJB.SILENT_PAUSE = 3						-- default silent pause between songs in the playlist
GJB.MT_MUSICID = 1						-- Index of the id position in a musictable title's song table
GJB.MT_MUSICFILE = 2						-- Index of the filename position in a musictable title's song table
GJB.MT_MUSICLEN = 3						-- Index of the length position in a musictable title's song table
GJB.COMM_PREFIX = "GJB"				-- Used with AceComm prefix concatenation
GJB.ON_LOAD_TIMER = 5					-- HACK!!! wait n seconds when PLAYYER_LOGIN is triggered before playing music (make sure Blizz level loading script doesn't override PlayMusic() call)
GJB.ON_ZONE_TIMER = 2					-- HACK!!! wait n seconds when one of 3 zone change events are triggered before playing music (make sure the zoneID has been updated)
GJB.ON_PETBATTLE_TIMER = 1			-- Number of seconds to wait after a pet battle has ended before starting to play jukebox.
GJB.ZT_ZONENAME = 1
GJB.ZT_ZONEID = 2
GJB.ZL_ZONENAME = "name"
GJB.ZL_CONTID = "cont"
GJB.ZL_ZONEID = "zone"
GJB.PEWTIME_ALLOWANCE = 3		-- Allowance of time disabling double PEW from triggering next song.

-- Expansion Constants
GJB.EXP_WOW = 1
GJB.EXP_BC = 2
GJB.EXP_WOTLK = 3
GJB.EXP_CATA1 = 4
GJB.EXP_CATA2 = 5
GJB.EXP_MOP = 6
GJB.EXP_WOD = 7
GJB.EXP_EVENTS = 8
GJB.EXP_BLIZZJB = 9
GJB.EXP_LEGION = 10
GJB.EXP_BFA = 11

-- Zone Constants
GJB.ZONE_KALIMDOR = 1
GJB.ZONE_EASTERN = 2
GJB.ZONE_OUTLAND = 3
GJB.ZONE_NORTH = 4
GJB.ZONE_CATA = 5
GJB.ZONE_PANDA = 6
GJB.ZONE_DRAENOR = 7
GJB.ZONE_RAIDS = 8
GJB.ZONE_DUNGEONS = 9
GJB.ZONE_BATTLEGROUNDS = 10
GJB.ZONE_SCENARIOS = 11
GJB.ZONE_LEGION = 12
GJB.ZONE_BFA = 13

-- time related globals
GJB.PEWdelta = 0
GJB.PEWlasttime = 0
GJB.PEWTriggered = false

-- globals
GJB.gMusicPlaying = false 				-- is the music currently playing
GJB.gMaxTitles = 0							-- maximum number of titles in a playlist table
GJB.gTitleIndex = 1							-- current item index of table musicfiles
GJB.gTitleIndexPrev = 0						-- previous index to make sure that items don't play twice in a row
GJB.gMaxMusic = 0							-- number of sub-items in musictable structure
GJB.gMusicIndex = 1							-- current item index of sub-items inside the musictable structure
GJB.gMusicIndexPrev = 0					-- current item index of sub-items inside the musictable structure
GJB.gCurZoneID = 0							-- Current Zone ID returned from GetCurrentMapAreaID()
GJB.gPrevZone = 0							-- holder for comparison when changing zones (in case going into same zone) O.o
GJB.gPetBattleEnabled = false 			-- Pet battle event state
GJB.gSampleIndex = 1						-- current index of sub-item for playing sample music
GJB.gSampleLastIndex = 1					-- last index used to play sub-item sample music
GJB.gSamplePlayed = ""						-- expansion+title string of last played sample music
GJB.gErrorPlay = GJB.PLAYERROR_NONE	-- state of last play attempt (true == error)
GJB.gOODShouted = false					-- set to true when addon has printed an out-of-date message to the chat pane
GJB.gAllExcluded = false					-- tells the system if the selected title's sub-items are all excluded.
GJB.samplesound = 1							-- key for sample sound select
GJB.silentpause = SILENT_PAUSE		-- silent pause between songs in the playlist
GJB.silentpausestate = false				-- state of the silent pause. false indicates that a music file is being played from the playlist. true indicates that the system is in a pause before playing the next item.
GJB.mplayerloaded = false					-- Music Player loaded state

GJB.Party = {}									-- table to hold all player names that are in the party (used for the party leader)
GJB.BlackList = {}								-- BNlacklist of already queried characters for version OOD

GJB.expac = 1 --								-- Holder for Expansion/Category select
GJB.title = 1										-- Holder for Music select
GJB.jukebox = 1								-- Holder for currently selected item in jukebox select
GJB.playsoundfile = ""						-- Holder for Play File input
GJB.doubleslashes = true					-- Holder for Double Slashes toggle
GJB.continent = 1								-- Holder for Continent select
GJB.zone = 1										-- Holder for Zone select
GJB.zonebox = 1								-- Holder for currently selected item in zone select

GJB.moduleOptions = {}  					-- Table for [Load On Demand] module options registration

-- Advanced tab
GJB.advexpac = 1								-- Holder for Expansion/Category select
GJB.advtitle = 1									-- Holder for Music select
GJB.advcont = 1								-- Holder for Continent select
GJB.advzone = 1								-- Holder for Zone select
GJB.advzonebox = 1							-- Holder for currently selected item in your zones select
GJB.advtitlebox = 1							-- Holder for currently selected item in your titles select

-- STMode
GJB.stmode = false							-- checkbox for enabling disabling single track mode
GJB.stm_expac = 1							-- Holder for Expansion/Category select
GJB.stm_continent = 1						-- Holder for Continent select
GJB.stm_title = 1								-- Holder for Music select
GJB.stm_jukebox = 1							-- Holder for currently selected item in jukebox select
GJB.stm_samplesound = 1

-- History
GJB.historypool = {}						-- Pool for holding created button frames for the history list
