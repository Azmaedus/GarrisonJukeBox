local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

GJB.About = {
	name = L["OPT_ABOUT"],
	desc = "",
	type = "group",
	order = 70,
	args = {
		desctitle = {
			name = L["ADDON_NAME"] .. " " .. GJB.gVersion .. " - " .. GJB.gCurReleaseDate,
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 1,
		},
		descauthor = {
			name = L["ADDON_AUTHOR"] .. " " .. "Azmaedus",
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
			name = L["ABOUT_SLASHCMD_CONFIG"] .. L["ABOUT_SLASHCMD_PLAY"] .. L["ABOUT_SLASHCMD_PREV"] .. L["ABOUT_SLASHCMD_NEXT"] .. L["ABOUT_SLASHCMD_STOP"] .. 
				L["ABOUT_SLASHCMD_SHOWICON"] .. L["ABOUT_SLASHCMD_HIDEICON"] .. L["ABOUT_SLASHCMD_SHOWPLAYER"] .. L["ABOUT_SLASHCMD_HIDEPLAYER"] .. L["ABOUT_SLASHCMD_RESETPOS"],
			type = "description",
			width = "full",
			fontSize = "small",
			order = 4,
		},
	},
}