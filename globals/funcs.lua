local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")
local AceGUI = LibStub("AceGUI-3.0")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

-------------------------------------
-- Extracts the filename from a path+filename string
-------------------------------------
function GJB:ExtractMP3Filename(str)
	local fn = ""
	local last = 1
	local i = 1

	while i ~= nil do
		i = strfind( str, "\\", i )
		if i ~= nil then
			i = i + 1
			last = i
		end
	end

	if last > 1 then
		fn = strsub( str, last )
	end
	
	return fn
end

-- -------------------------------------------
-- function to find out if music file is a PlaySoundKitID callable item
-- -------------------------------------------
function GJB:IsKitMusic(sample)
	if sample[GJB.MT_KITACTIVE] ~= nil and sample[GJB.MT_KITACTIVE] == true then
		return true
	else
		return false
	end
end

-- -------------------------------------------
-- function to sort a musictable
-- -------------------------------------------
function GJB:SortMusicTable(tbl)
	for _, v in pairs(tbl) do
		tsort(v, function(a,b) return a["name"] < b["name"] end)
	end
	return tbl
end

-- -------------------------------------------
-- function to sort a zonetable
-- -------------------------------------------
function GJB:SortZoneTable(tbl)
	for _, v in pairs(tbl) do
		tsort(v, function(a,b) return a[1] < b[1] end)
	end
	return tbl
end

-- ------------------------------------------------------
-- localver is the current version of the requester, remotever is the one being tested against(the one received from another player)
-- ------------------------------------------------------
function GJB:isVersionOOD(localver, remotever)
	for i=1,5 do
		if localver[i] < remotever[i] then
			return true
		elseif localver[i] > remotever[i] then
			return false
		end
	end
	
	return false
end

-------------------------------------
-- Function to return the string representation of the version table
-------------------------------------
function GJB:VersionDataToString(version)
	local ret = ""
	
	for i=1,5 do
		if i <= 3 then
			ret = ret .. version[i] .. "."
		elseif i == 4 then
			ret = ret .. version[i] .. " "
		elseif i == 5 then
			if version[i] == 0 then
				ret = ret .. "alpha"
			elseif version[i] == 1 then
				ret = ret .. "beta"
			elseif version[i] == 2 then
				ret = ret .. "release"
			end
		end
	end
	
	return ret
end

-- -------------------------------------------
-- function to reset profile save if older version detected (1.x)
-- -------------------------------------------
function GJB:VersionCheckResetData()
	local p = self.db.profile
	
	--print(p.addonversion)
	if p.addonversion == nil or getn(p.addonversion) == 0 then
		p.addonversion = GJB.gVersionID
	elseif GJB:isVersionOOD(p.addonversion, GJB.gVersionID) then
		p.addonversion = GJB.gVersionID

		-- check for previous version to reset saved variables
		if GJB:isVersionOOD(p.addonversion, GJB.gMilestone1210) then
			GJB:VersionCheckWarning()
		end
	end
end

function GJB:VersionCheckWarning()
	self:Disable()
	self:Print(L["ADDON_HAS_BEEN_DISABLED"])
	self:SetPlayerVisibility(false)

	local MBOX_W = 500 				--width of the messagebox
	local MBOX_H = 250				--height of the messagebox

	-------------------------------------
	-- Background Frame
	-------------------------------------
	GJB.mbox.fbg = CreateFrame("Frame", "GJBMBOX_BG", UIParent)
	local fbg = GJB.mbox.fbg
	assert(fbg, "Failed to create frame " .. "GJBMBOX_BG") -- failed to create the frame
	fbg:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
	fbg:SetFrameLevel(9999)
	fbg:SetMovable(true)
	fbg:EnableMouse(true)
	fbg:RegisterForDrag(unpack({"LeftButton"}))

	fbg:SetScript("OnDragStart", function( self ) self:StartMoving() end)
	fbg:SetScript("OnDragStop", function( self ) self:StopMovingOrSizing()	end)

	fbg:SetBackdrop(
	{
		bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
		edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
		tile = true, tileSize = 4, edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	})
	fbg:SetBackdropColor(0, 0, 0, 1)
	fbg:SetBackdropBorderColor(1, 1, 1, 1)
	fbg:SetWidth(MBOX_W)
	fbg:SetHeight(MBOX_H)
	fbg:SetScale(1)
	fbg:Show()

	-------------------------------------
	-- Header Frame
	-------------------------------------
	GJB.mbox.fhdr = CreateFrame("Frame", "GJBMBOX_Header", fbg)
	local fhdr = GJB.mbox.fhdr
	assert(fhdr, "Failed to create frame " .. "GJBMBOX_Header") -- failed to create the frame
	fhdr.root = false
	fhdr:SetPoint("TOPLEFT", "GJBMBOX_BG", "TOPLEFT", 0, -3)
	do
		local text = {}
		text = fhdr:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		assert(text, "Error creating font string.")
		text:SetAllPoints(true)
		text:SetJustifyH("CENTER")
		text:SetJustifyV("MIDDLE")
		text:SetTextColor(1, 1, 0.5, 1)
		text:SetText(L["ADDON_NAME"])
	end

	fhdr:SetBackdrop(
	{
		bgFile = "Interface/DialogFrame/UI-DialogBox-Gold-Background",
		edgeFile = "",
		tile = true, tileSize = 4, edgeSize = 16,
		insets = { left = 6, right = 6, top = 3, bottom = 0 }
	})

	fhdr:SetBackdropColor(123, 123, 123, 1)
	fhdr:SetBackdropBorderColor(0, 0, 0, 0)
	fhdr:SetWidth(MBOX_W)
	fhdr:SetHeight(20)
	fhdr:SetScale(1)
	fhdr:Show()

	-------------------------------------
	-- Message Frame
	-------------------------------------
	GJB.mbox.fmsg = CreateFrame("Frame", "GJBMBOX_Message", fbg)
	local fmsg = GJB.mbox.fmsg
	assert(fmsg, "Failed to create frame " .. "GJBMBOX_Message") -- failed to create the frame
	fmsg.root = false
	fmsg:SetPoint("TOPLEFT", "GJBMBOX_BG", "TOPLEFT", 15, -40)
	do
		local text = {}
		text = fmsg:CreateFontString(nil, "ARTWORK", "GameFontNormalLeft")
		assert(text, "Error creating font string.")
		text:SetAllPoints(true)
		text:SetJustifyH("LEFT")
		text:SetJustifyV("TOP")
		text:SetTextColor(1, 1, 1, 1)
		text:SetWordWrap(true)
		text:SetText(L["ADDON_BETA_WARNING"])
		GJB.mbox.fmsgtext = text
	end
	fmsg:SetBackdropColor(123, 123, 123, 0)
	fmsg:SetBackdropBorderColor(0, 0, 0, 0)
	fmsg:SetWidth(MBOX_W - 30)
	fmsg:SetHeight(100)
	fmsg:SetScale(1)
	fmsg:Show()

	-------------------------------------
	-- Reset Button Frame
	-------------------------------------
	GJB.mbox.fok = CreateFrame("Button", "GJBMBOX_OK", fbg, "UIPanelButtonTemplate")
	local fok = GJB.mbox.fok
	assert(fok, "Failed to create frame " .. "GJBMBOX_OK") -- failed to create the frame
	fok:SetPoint("CENTER", "GJBMBOX_BG", "BOTTOM", -60, 30)
	fok:EnableMouse(true)
	fok:RegisterForClicks((unpack({"LeftButtonUp"})))

	fok:SetScript("OnClick", 
		function( self ) 
			self:Enable()
			local p = GJB.db.profile
			p.firstrun_2 = false
			p.firstrun2003 = true
			p.musiclist = {}
			p.zonelist = {}
			p.songlist = nil
			p.shuffle = nil
			p.inlinetitle = nil
			p.musicplayer.dim = nil
			p.advzonelist = {}
			p.stm_files = {}
			p.stminfo = nil
			p.advenabled = false
			p.stmode = false
			p.allzones = false
			ReloadUI()
		end)

	do
		local text = {}
		text = fok:CreateFontString(nil, "ARTWORK", "GameFontNormalLeft")
		assert(text, "Error creating font string.")
		text:SetAllPoints(true)
		text:SetJustifyH("CENTER")
		text:SetJustifyV("MIDDLE")
		text:SetTextColor(1, 1, 1, 1)
		text:SetWordWrap(false)
		text:SetText(L["CMD_RESET"])
	end

	fok:SetWidth(100)
	fok:SetHeight(22)
	fok:Show()

	-------------------------------------
	-- Cancel Button Frame
	-------------------------------------
	GJB.mbox.fclose = CreateFrame("Button", "GJBMBOX_CLOSE", fbg, "UIPanelButtonTemplate")
	local fclose = GJB.mbox.fclose
	assert(fclose, "Failed to create frame " .. "GJBMBOX_CLOSE") -- failed to create the frame
	fclose:SetPoint("CENTER", "GJBMBOX_BG", "BOTTOM", 60, 30)
	fclose:EnableMouse(true)
	fclose:RegisterForClicks((unpack({"LeftButtonUp"})))

	fclose:SetScript("OnClick", function( self ) fbg:Hide() end)

	do
		local text = {}
		text = fclose:CreateFontString(nil, "ARTWORK", "GameFontNormalLeft")
		assert(text, "Error creating font string.")
		text:SetAllPoints(true)
		text:SetJustifyH("CENTER")
		text:SetJustifyV("MIDDLE")
		text:SetTextColor(1, 1, 1, 1)
		text:SetWordWrap(false)
		text:SetText(L["CMD_CLOSE"])
	end

	fclose:SetWidth(100)
	fclose:SetHeight(22)
	fclose:Show()

	-------------------------------------
	-- Version Frame
	-------------------------------------
	GJB.mbox.fver = CreateFrame("Frame", "GJBMBOX_Version", fbg)
	local fver = GJB.mbox.fver
	assert(fver, "Failed to create frame " .. "GJBMBOX_Version") -- failed to create the frame
	fver.root = false
	fver:SetPoint("BOTTOMLEFT", "GJBMBOX_BG", "BOTTOMLEFT", 15, 0)
	do
		local text = {}
		text = fver:CreateFontString(nil, "ARTWORK", "SystemFont_Tiny")
		assert(text, "Error creating font string.")
		text:SetAllPoints(true)
		text:SetJustifyH("LEFT")
		text:SetJustifyV("TOP")
		text:SetTextColor(1, 1, 1, 1)
		text:SetWordWrap(false)
		text:SetText(GJB.gVersion)
	end
	fver:SetBackdropColor(123, 123, 123, 0)
	fver:SetBackdropBorderColor(0, 0, 0, 0)
	fver:SetWidth(MBOX_W - 30)
	fver:SetHeight(20)
	fver:SetScale(1)
	fver:Show()
end

-- -------------------------------------------
-- function to store musictable id's as keys to increase searching speed.
-- -------------------------------------------
function GJB:CreateMTID(mt)
	local x = {}
	
	if mt ~= nil then
		-- loop through expansions
		for k, v in ipairs(mt) do
			local t = {}
			-- loop through titles
			for k2, v2 in ipairs(v) do
				local m = {}
				-- loop through music
				for k3, v3 in ipairs(v2.files) do
					m[v3[1]] = k3
				end
				t[v2.id] = m
				t[v2.id].key = k2
			end
			x[k] = t
		end
	end
	
	return x
end

-- -------------------------------------------
-- Table Invert for query of key
-- -------------------------------------------
function GJB:table_invert(t)
   local it={}
   for k,v in pairs(t) do
     it[v]=k
   end
   return it
end
