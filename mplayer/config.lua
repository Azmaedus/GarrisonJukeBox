local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

function GJB:CreateMusicPlayer()
	local MUSICPLAYER_WIDTH = 200 				--width of the music player
	local MUSICPLAYER_HEIGHT = 70				--height of the music player
	local MUSICPLAYER_BUTTONMARGIN = 15	-- Left margin for the buttons' positions
	local MUSICPLAYER_BUTTON_Y = -40			-- Y position of the buttons

	-------------------------------------
	-- Background Frame
	-------------------------------------
	GJB.mplayer.fbg = CreateFrame("Frame", "GJBP_BG", UIParent)
	local fbg = GJB.mplayer.fbg
	assert(fbg, "Failed to create frame " .. "GJBP_BG") -- failed to create the frame
	fbg:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
	fbg:SetMovable(true)
	fbg:EnableMouse(true)
	fbg:RegisterForDrag(unpack({"RightButton"}))

	fbg:SetScript("OnDragStart", 
		function( self )
			if IsAltKeyDown() then
				self:StartMoving()
			end
		end
	)
	fbg:SetScript("OnDragStop", 
		function(self)
			self:StopMovingOrSizing()
			pos = GJB.db.profile.musicplayer.pos
			pos.a, pos.r, pos.rp, pos.x, pos.y = self:GetPoint(1)
		end
	)

	fbg:SetBackdrop(
	{
		bgFile = "Interface/Tooltips/UI-Tooltip-Background",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	})
	fbg:SetBackdropColor(0, 0, 0, 0.5)
	fbg:SetBackdropBorderColor(1, 1, 0.5, 1)
	fbg:SetWidth(MUSICPLAYER_WIDTH)
	fbg:SetHeight(MUSICPLAYER_HEIGHT)
	fbg:SetScale(1)
	fbg:Show()

	-------------------------------------
	-- Header Frame
	-------------------------------------
	GJB.mplayer.fhdr = CreateFrame("Frame", "GJBP_Header", fbg)
	local fhdr = GJB.mplayer.fhdr
	assert(fhdr, "Failed to create frame " .. "GJBP_Header") -- failed to create the frame
	fhdr.root = false
	fhdr:SetPoint("TOPLEFT", "GJBP_BG", "TOPLEFT", 5, -1)
	do
		local text = {}
		text = fhdr:CreateFontString(nil, "ARTWORK", "NumberFont_Shadow_Small")
		assert(text, "Error creating font string.")
		text:SetAllPoints(true)
		text:SetJustifyH("CENTER")
		text:SetJustifyV("CENTER")
		text:SetTextColor(1, 1, 0.5, 1)
		text:SetText(L["GJBP_TITLE"])
	end
	fhdr:SetBackdropColor(123, 123, 123, 0)
	fhdr:SetBackdropBorderColor(0, 0, 0, 0)
	fhdr:SetWidth(190)
	fhdr:SetHeight(20)
	fhdr:SetScale(1)
	fhdr:Show()

	-------------------------------------
	-- History Scroll
	-------------------------------------
	-- Create the parent frame that will contain the inner scroll child,
	-- song history items, and the scroll bar slider.
	--GJB.mplayer.fp = FPreviewFrame or CreateFrame("ScrollFrame", "FPreviewFrame", fbg)
	GJB.mplayer.fp = CreateFrame("ScrollFrame", "FPreviewFrame", fbg)
	local fp = GJB.mplayer.fp
	fp:SetPoint("TOPLEFT", "GJBP_BG", "BOTTOMLEFT", 0, 0)
	fp:SetBackdrop(
	{
--		bgFile = "Interface/Tooltips/UI-Tooltip-Background",
		bgFile = "Interface/FrameGeneral/UI-Background-Rock",
		edgeFile = "",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 0, right = 0, top = 0, bottom = 0 }
	})

	fp:SetBackdropColor(0, 0, 0, 1)

	fp:SetWidth(400)
	fp:SetHeight(150)

	-- This is a bare-bones frame is used to encapsulate the contents of
	-- the scroll frame.  Each scrollframe can have one scroll child.
	--GJB.mplayer.fpsc = FPreviewSC or CreateFrame("Frame", "FPreviewSC")
	GJB.mplayer.fpsc = CreateFrame("Frame", "FPreviewSC")
	local fpsc =  GJB.mplayer.fpsc
	
	-- Create the slider that will be used to scroll through the results
	--GJB.mplayer.fpsb = FPreviewScrollBar or CreateFrame("Slider", "FPreviewScrollBar", fp)
	GJB.mplayer.fpsb = CreateFrame("Slider", "FPreviewScrollBar", fp)
	local fpsb = GJB.mplayer.fpsb 
	
	-- Set up internal textures for the scrollbar, background and thumb texture
	fpsb.bg = fpsb:CreateTexture(nil, "BACKGROUND")
	fpsb.bg:SetAllPoints(true)
	fpsb.bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
 
	fpsb.thumb = fpsb:CreateTexture(nil, "OVERLAY")
	fpsb.thumb:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
	fpsb.thumb:SetSize(25, 25)
	fpsb:SetThumbTexture(fpsb.thumb)
	 
	GJB:UpdateHistory()

	-------------------------------------
	-- Title Frame
	-------------------------------------
	GJB.mplayer.ftitle = CreateFrame("Frame", "GJBP_Title", fbg)
	local ftitle = GJB.mplayer.ftitle
	assert(ftitle, "Failed to create frame " .. "GJBP_Title") -- failed to create the frame
	ftitle.root = false
	ftitle:SetPoint("TOPLEFT", "GJBP_BG", "TOPLEFT", 5, -17)
	do
		local text = {}
		text = ftitle:CreateFontString(nil, "ARTWORK", "NumberFont_Shadow_Small")
		assert(text, "Error creating font string.")
		text:SetAllPoints(true)
		text:SetJustifyH("CENTER")
		text:SetJustifyV("TOP")
		text:SetTextColor(1, 1, 1, 1)
		text:SetText("...")
		GJB.mplayer.ftitletext = text
	end
	ftitle:SetBackdropColor(123, 123, 123, 0)
	ftitle:SetBackdropBorderColor(0, 0, 0, 0)
	ftitle:SetWidth(190)
	ftitle:SetHeight(20)
	ftitle:SetScale(1)
	ftitle:Show()

	-------------------------------------
	-- Back Button Frame
	-------------------------------------
	GJB.mplayer.fback = CreateFrame("Button", "GJBP_Back", fbg, UIPanelButtonTemplate)
	local fback = GJB.mplayer.fback
	assert(fback, "Failed to create frame " .. "GJBP_Back") -- failed to create the frame
	fback.root = false
	fback:SetPoint("TOPLEFT", "GJBP_BG", "TOPLEFT", MUSICPLAYER_BUTTONMARGIN, MUSICPLAYER_BUTTON_Y)
	fback:SetBackdrop(
	{
		bgFile = "Interface\\AddOns\\GarrisonJukeBox\\media\\back",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		tile = true, tileSize = 24, edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 }
	})
	fback:RegisterForClicks(unpack({"LeftButtonUp"}))

	fback:SetScript("OnClick", 
		function(self, button, down)
			StopMusic()
			GJB:SetNowPlayingText( "..." )
			GJB.gMusicPlaying = false
			GJB.gMusicIndex	= GJB.gMusicIndex - 1
			if GJB.gMusicIndex < 1 then
				GJB.gMusicIndex = GJB.gMaxMusic
			end
			GJB:ProcessInfo()
		end
	)
		
	fback:SetScript("OnEnter",
		function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
			GameTooltip:SetText(L["CMD_PREV"])  -- This sets the top line of text, in gold.
			--GameTooltip:AddLine("Back", 1, 1, 1)
			GameTooltip:Show()
		end
	)

	fback:SetScript("OnLeave",
		function(self)
			GameTooltip:Hide()
		end
	)

	fback:SetHighlightTexture("Interface\\AddOns\\GarrisonJukeBox\\media\\btn-light", "ADD")
	fback:SetBackdropColor(1, 1, 1, 1)
	fback:SetBackdropBorderColor(0, 0, 0, 0)
	fback:SetWidth(24)
	fback:SetHeight(24)
	fback:SetScale(1)
	fback:Show()

	-------------------------------------
	-- Play Button Frame
	-------------------------------------
	GJB.mplayer.fplay = CreateFrame("Button", "GJBP_Play", fbg, UIPanelButtonTemplate)
	local fplay = GJB.mplayer.fplay
	assert(fplay, "Failed to create frame " .. "GJBP_Play") -- failed to create the frame
	fplay.root = false
	fplay:SetPoint("TOPLEFT", "GJBP_BG", "TOPLEFT", MUSICPLAYER_BUTTONMARGIN + 30, MUSICPLAYER_BUTTON_Y)
	fplay:SetBackdrop(
	{
		bgFile = "Interface\\AddOns\\GarrisonJukeBox\\media\\play",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		tile = true, tileSize = 24, edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 }
	})
	fplay:RegisterForClicks(unpack({"LeftButtonUp"}))

	fplay:SetScript("OnClick", 
		function(self, button, down)
			StopMusic()
			GJB:SetNowPlayingText( "..." )
			GJB.gMusicPlaying = false
			GJB:ProcessInfo()
		end
	)

	fplay:SetScript("OnEnter",
		function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
			GameTooltip:SetText(L["CMD_PLAY"])  -- This sets the top line of text, in gold.
			--GameTooltip:AddLine("Back", 1, 1, 1)
			GameTooltip:Show()
		end
	)

	fplay:SetScript("OnLeave",
		function(self)
			GameTooltip:Hide()
		end
	)

	fplay:SetHighlightTexture("Interface\\AddOns\\GarrisonJukeBox\\media\\btn-light", "ADD")
	fplay:SetBackdropColor(1, 1, 1, 1)
	fplay:SetBackdropBorderColor(0, 0, 0, 0)
	fplay:SetWidth(24)
	fplay:SetHeight(24)
	fplay:SetScale(1)
	fplay:Show()

	-------------------------------------
	-- Stop Button Frame
	-------------------------------------
	GJB.mplayer.fstop = CreateFrame("Button", "GJBP_Stop", fbg, UIPanelButtonTemplate)
	local fstop = GJB.mplayer.fstop
	assert(fplay, "Failed to create frame " .. "GJBP_Stop") -- failed to create the frame
	fstop.root = false
	fstop:SetPoint("TOPLEFT", "GJBP_BG", "TOPLEFT", MUSICPLAYER_BUTTONMARGIN + 60, MUSICPLAYER_BUTTON_Y)
	fstop:SetBackdrop(
	{
		bgFile = "Interface\\AddOns\\GarrisonJukeBox\\media\\stop",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		tile = true, tileSize = 24, edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 }
	})
	fstop:RegisterForClicks(unpack({"LeftButtonUp"}))

	fstop:SetScript("OnClick", 
		function(self, button, down)
			StopMusic()
			GJB:SetNowPlayingText("...")
			GJB.gMusicPlaying = false
			GJB:CancelTimer(self.musicTimer)
		end
	)

	fstop:SetScript("OnEnter",
		function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
			GameTooltip:SetText(L["CMD_STOP"])  -- This sets the top line of text, in gold.
			--GameTooltip:AddLine("Back", 1, 1, 1)
			GameTooltip:Show()
		end
	)

	fstop:SetScript("OnLeave",
		function(self)
			GameTooltip:Hide()
		end
	)

	fstop:SetHighlightTexture("Interface\\AddOns\\GarrisonJukeBox\\media\\btn-light", "ADD")
	fstop:SetBackdropColor(1, 1, 1, 1)
	fstop:SetBackdropBorderColor(0, 0, 0, 0)
	fstop:SetWidth(24)
	fstop:SetHeight(24)
	fstop:SetScale(1)
	fstop:Show()

	-------------------------------------
	-- Next Button Frame
	-------------------------------------
	GJB.mplayer.fnext = CreateFrame("Button", "GJBP_Next", fbg, UIPanelButtonTemplate)
	local fnext = GJB.mplayer.fnext
	assert(fnext, "Failed to create frame " .. "GJBP_Next") -- failed to create the frame
	fnext.root = false
	fnext:SetPoint("TOPLEFT", "GJBP_BG", "TOPLEFT", MUSICPLAYER_BUTTONMARGIN + 90, MUSICPLAYER_BUTTON_Y)
	fnext:SetBackdrop(
	{
		bgFile = "Interface\\AddOns\\GarrisonJukeBox\\media\\next",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		tile = true, tileSize = 24, edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 }
	})
	fnext:RegisterForClicks(unpack({"LeftButtonUp"}))

	fnext:SetScript("OnClick", 
		function(self, button, down)
			StopMusic() 
			GJB:SetNowPlayingText( "..." )
			GJB.gMusicPlaying = false
			GJB:ProcessInfo()
		end
	)

	fnext:SetScript("OnEnter",
		function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
			GameTooltip:SetText(L["CMD_NEXT"])  -- This sets the top line of text, in gold.
			--GameTooltip:AddLine("Back", 1, 1, 1)
			GameTooltip:Show()
		end
	)

	fnext:SetScript("OnLeave",
		function(self)
			GameTooltip:Hide()
		end
	)

	fnext:SetHighlightTexture("Interface\\AddOns\\GarrisonJukeBox\\media\\btn-light", "ADD")
	fnext:SetBackdropColor(1, 1, 1, 1)
	fnext:SetBackdropBorderColor(0, 0, 0, 0)
	fnext:SetWidth(24)
	fnext:SetHeight(24)
	fnext:SetScale(1)
	fnext:Show()

	-------------------------------------
	-- History Button Frame
	-------------------------------------
	GJB.mplayer.fbtnhistory = CreateFrame("Button", "GJBP_BTNHistory", fbg, UIPanelButtonTemplate)
	local fbhist = GJB.mplayer.fbtnhistory
	assert(fbhist, "Failed to create frame " .. "GJBP_BTNHistory") -- failed to create the frame
	fbhist.root = false
	fbhist:SetPoint("TOPLEFT", "GJBP_BG", "TOPLEFT", MUSICPLAYER_BUTTONMARGIN + 150, MUSICPLAYER_BUTTON_Y)
	fbhist:SetBackdrop(
	{
		bgFile = "Interface\\AddOns\\GarrisonJukeBox\\media\\history",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		tile = true, tileSize = 24, edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 }
	})
	fbhist:RegisterForClicks(unpack({"LeftButtonUp"}))

	fbhist:SetScript("OnClick", 
		function(self, button, down)
			local bVisible = true
			if( GJB.db.profile.history.open ) then
				bVisible = false
			end

			GJB.db.profile.history.open = bVisible
			GJB:SetPlayerHistoryVisibility(bVisible)

			if( bVisible ) then
				GameTooltip:SetText(L["CMD_HISTORY_CLOSE"])  -- This sets the top line of text, in gold.
			else
				GameTooltip:SetText(L["CMD_HISTORY_OPEN"])  -- This sets the top line of text, in gold.
			end
		end
	)

	fbhist:SetScript("OnEnter",
		function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")

			if( GJB.db.profile.history.open ) then
				GameTooltip:SetText(L["CMD_HISTORY_CLOSE"])  -- This sets the top line of text, in gold.
			else
				GameTooltip:SetText(L["CMD_HISTORY_OPEN"])  -- This sets the top line of text, in gold.
			end
			
			--GameTooltip:AddLine("Back", 1, 1, 1)
			GameTooltip:Show()
		end
	)

	fbhist:SetScript("OnLeave",
		function(self)
			GameTooltip:Hide()
		end
	)

	fbhist:SetHighlightTexture("Interface\\AddOns\\GarrisonJukeBox\\media\\history-over", "BLEND")
	fbhist:SetBackdropColor(1, 1, 1, 1)
	fbhist:SetBackdropBorderColor(0, 0, 0, 0)
	fbhist:SetWidth(24)
	fbhist:SetHeight(24)
	fbhist:SetScale(1)
	fbhist:Show()
	
	GJB.mplayerloaded = true
	--==============================================================
end
-------------------------------------
-- Function to show or hide the music player
-------------------------------------
function GJB:SetPlayerVisibility(visible)
	if visible then
		GJB.mplayer.fbg:Show()
	else
		GJB.mplayer.fbg:Hide()
	end
end

-------------------------------------
-- Function to show or hide the music player history list
-------------------------------------
function GJB:SetPlayerHistoryVisibility(visible)
	if visible then
		GJB.mplayer.fp:Show()
	else
		GJB.mplayer.fp:Hide()
	end
end

-------------------------------------
-- Function to set the text
-------------------------------------
function GJB:SetNowPlayingText(playing)
	local text = GJB.mplayer.ftitletext
	assert(text, "Error creating font string.")
	text:SetAllPoints(true)
	text:SetJustifyH("CENTER")
	text:SetJustifyV("CENTER")
	text:SetTextColor(1, 1, 1, 1)
	text:SetText(playing)
end

-------------------------------------
-- Function to set the position of the player
-------------------------------------
function GJB:SetPlayerPos(pos)
	self.db.profile.musicplayer.pos = pos
	GJB.mplayer.fbg:ClearAllPoints()
	GJB.mplayer.fbg:SetPoint(pos.a, pos.r, pos.rp, pos.x, pos.y)
end

-------------------------------------
-- Function to update the player
-------------------------------------
function GJB:UpdateMusicPlayer()
	local pos = self.db.profile.musicplayer.pos
	self:SetPlayerPos( pos )
	self:SetPlayerVisibility( not self.db.profile.hidemusicplayer )
	self:SetPlayerHistoryVisibility( self.db.profile.history.open )
end

-------------------------------------
-- Function to add an item to the history list
-------------------------------------
function GJB:AddToHistory(histdata)
	tinsert(self.db.profile.history.items, histdata )
	
	-- check if too many items
	if table.getn(self.db.profile.history.items) > self.db.profile.history.maxitems then
		self:DeleteHistoryItem(1)
	end
end

-------------------------------------
-- Function to update the history list
-------------------------------------
function GJB:UpdateHistory()
	-- Iterate the list of songs previously played
	local pool = GJB.historypool
	local songs = GJB.db.profile.history.items or {}
	
	self:ReleaseAllHistoryButtons()
	
	-- Reverse the temporary copy of the history list
	local temphist = ripairs(songs)
		
	-- Fill History List and assign events
	local size = getn(temphist) + 1
	for k, v in ipairs(temphist) do
		if pool[k] then
			pool[k]:SetText("|cFF0eb6a0" .. v.xname .. "|r\013" .. "|cFF1674b5" .. v.tname .. "|r")
			pool[k]:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			pool[k]:SetScript("OnClick", 
				function(self, btn, down) 
					if btn == "LeftButton" then
						GJB:CancelTimer(GJB.musicTimer)
						StopMusic()
						GJB:SetNowPlayingText("...")
						PlayMusic(songs[size - k]["file"])
						GJB:Print(L["PLAYINGHISTORY"] .. songs[size - k]["file"])
						GJB:SetNowPlayingText(GJB:ExtractMP3Filename(songs[size - k]["file"]))
					elseif btn == "RightButton" then
						GJB:DeleteHistoryItem(size - k)
						GJB:UpdateHistory()
					end
				end)
			pool[k]:SetScript("OnEnter", 
				function(self, motion)
					pool[k]:SetText("|cFFed770e" .. v.xname .. "\013" .. v.tname .. "|r")
				end)
			pool[k]:SetScript("OnLeave", 
				function(self, motion)
					pool[k]:SetText("|cFF0eb6a0" .. v.xname .. "|r\013" .. "|cFF1674b5" .. v.tname .. "|r")
				end)
			pool[k]:Show()
		end
	end
end

function ripairs(t)
	local i = getn(t)
	local rt = {}
	for k, v in ipairs(t) do
		rt[i] = v
		i = i - 1
	end
	return rt
end

-------------------------------------
-- Function to prepare the history buttons for processing
-------------------------------------
function GJB:ReleaseAllHistoryButtons()
	for k, v in ipairs(GJB.historypool) do
		v:SetText("")
		v:RegisterForClicks()
		v:UnregisterEvent("OnClick")
		v:Hide()
	end
end

-------------------------------------
-- Function to update the history list
-------------------------------------
function GJB:DeleteHistoryItem(idx)
	tremove(self.db.profile.history.items, idx)
end

-------------------------------------
-- Function to create the history list's buttons and store them into a pool
-------------------------------------
function GJB:CreateHistoryButtonFrames()
	local pool = GJB.historypool
	
	local fp = GJB.mplayer.fp
	local fpsb = GJB.mplayer.fpsb
	local fpsc = GJB.mplayer.fpsc
	
	local height = 150
	local width = 400
	local Padding = 0
	
	for i = 1, 10 do
		local btn = CreateFrame("Button", "HistoryButton" .. i, fpsc)
		btn:SetPoint("LEFT", GJB.mplayer.fpsc, "LEFT", 0, 0)
		
		btn:SetBackdrop(
		{
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "",
			tile = true, tileSize = 16, edgeSize = 16,
			insets = { left = 1, right = 1, top = 1, bottom = 1 }
		})

		btn:SetBackdropColor(10, 10, 10, 0.15)

		btn:SetWidth(388)
		btn:SetHeight(28)
		
		btn:SetText("...")
		btn:SetNormalFontObject("GameFontDarkGraySmall")
		btn:SetHighlightFontObject("GameFontNormalSmall")
		
		local bfs = btn:GetFontString()
		bfs:SetJustifyH("left")
		bfs:SetAllPoints(true)
		btn:SetFontString(bfs)

		local fheight = 0

	   if i == 1 then
		  btn:SetPoint("TOPLEFT", 7, -7)
		  height = height + fheight
	   else
		  btn:SetPoint("TOPLEFT", "HistoryButton" .. (i - 1), "BOTTOMLEFT", 0, - Padding)
		  height = height + fheight + Padding
	   end
	   
	   btn:Hide()
	   
	   tinsert(pool, btn)
	   
	   -- Update the 'max' width of the frame
	   --width = (fwidth > width) and fwidth or width
	end
	
	-- Set the size of the scroll child
	fpsc:SetSize(width, 280)
	 
	-- Size and place the parent frame, and set the scrollchild to be the
	-- frame of font strings we've created
	fp:SetSize(width, height)
	fp:SetPoint("CENTER", UIParent, 0, 0)
	fp:SetScrollChild(fpsc)
	fp:Show()
	 
	fpsc:SetSize(width, height)
	 
	-- Set up the scrollbar to work properly
	local scrollMax = 280 - 140
	fpsb:SetOrientation("VERTICAL");
	fpsb:SetSize(16, height)
	fpsb:SetPoint("TOPLEFT", fp, "TOPRIGHT", 0, 0)
	fpsb:SetMinMaxValues(0, scrollMax)
	fpsb:SetValue(0)
	fpsb:SetScript("OnValueChanged", function(self) fp:SetVerticalScroll(self:GetValue()) end)
	 
	-- Enable mousewheel scrolling
	fp:EnableMouseWheel(true)
	fp:SetScript("OnMouseWheel", function(self, delta)
		  local current = fpsb:GetValue()
		   
		  if IsShiftKeyDown() and (delta > 0) then
			 fpsb:SetValue(0)
		  elseif IsShiftKeyDown() and (delta < 0) then
			 fpsb:SetValue(scrollMax)
		  elseif (delta < 0) and (current < scrollMax) then
			 fpsb:SetValue(current + 25)
		  elseif (delta > 0) and (current > 1) then
			 fpsb:SetValue(current - 25)
		  end
	end)
end
