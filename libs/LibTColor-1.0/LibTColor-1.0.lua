--[[
Name:		  LibTColor-1.0
Author(s): 	  Azmaedus
Revision: 	  $Rev: 1 $
Created:	  01/23/2015
Description:  Library that handles chat output.
Dependencies: LibStub
License:	  GPLv2

	Change Log
	--------------------
	01/23/2015 - 1.0a 	Creation of addon
]]

local TCOLOR = "LibTColor-1.0"
local TCOLOR_MINOR = 90000 + tonumber(("$Revision: 1 $"):match("(%d+)"))

local LTC = LibStub:NewLibrary(TCOLOR, TCOLOR_MINOR)
if not LTC then return end

if not LTC.frame then
  LTC.frame = CreateFrame("Frame")
end

local L_ERROR = "#LTC-Error!#"

local l = GetLocale()
if l == "frFR" then
	L_ERROR = "#LTC-Erreur!#"
elseif l == "koKR" then
	-- Missing
elseif l == "deDE" then
	-- Missing
elseif l == "zhCN" then
	-- Missing
elseif l == "zhTW" then
	-- Missing
elseif l == "ruRU" then
	-- Missing
elseif l == "esES" or l == "esMX" then
	-- Missing
elseif l == "ptBR" then
	-- Missing
elseif l == "itIT" then
	-- Missing
end

-- color constants (argb)
LTC_GREEN = "ff38ce39"
LTC_BLUE = "ff539ce8"
LTC_WHITE = "ffffffff"
LTC_BLACK = "ff000000"
LTC_RED = "ffff0000"

function LTC:setColor(str, color)
	if not str or str == "" then return L_ERROR end
	if not color or color == "" then
		color = LWHITE
	end
	
	return "|c" .. color .. str .. "|r"
end

--[[
local function OnUpdate()
  -- timing stuff here
end

LTC.frame:SetScript("OnUpdate", OnUpdate);
]]