local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local MBOX_W = 400 				--width of the messagebox
local MBOX_H = 200				--height of the messagebox

-------------------------------------
-- Background Frame
-------------------------------------
GJB.mbox.fbg = CreateFrame("Frame", "GJBMBOX_BG", UIParent)
local fbg = GJB.mbox.fbg
assert(fbg, "Failed to create frame " .. "GJBMBOX_BG") -- failed to create the frame
fbg:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
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
	text:SetText(L["ADDON_NAME"] .. " v" .. GJB.gVersion)
end
fhdr:SetBackdropColor(123, 123, 123, 0)
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
	text:SetText("")
	GJB.mbox.fmsgtext = text
end
fmsg:SetBackdropColor(123, 123, 123, 0)
fmsg:SetBackdropBorderColor(0, 0, 0, 0)
fmsg:SetWidth(MBOX_W - 30)
fmsg:SetHeight(100)
fmsg:SetScale(1)
fmsg:Show()

-------------------------------------
-- Background Frame
-------------------------------------
GJB.mbox.fok = CreateFrame("Button", "GJBMBOX_OK", fbg, "UIPanelButtonTemplate")
local fok = GJB.mbox.fok
assert(fok, "Failed to create frame " .. "GJBMBOX_OK") -- failed to create the frame
fok:SetPoint("CENTER", "GJBMBOX_BG", "BOTTOM", 0, 30)
fok:EnableMouse(true)
fok:RegisterForClicks((unpack({"LeftButtonUp"})))

fok:SetScript("OnClick", function( self ) fbg:Hide() end)

do
	local text = {}
	text = fok:CreateFontString(nil, "ARTWORK", "GameFontNormalLeft")
	assert(text, "Error creating font string.")
	text:SetAllPoints(true)
	text:SetJustifyH("CENTER")
	text:SetJustifyV("MIDDLE")
	text:SetTextColor(1, 1, 1, 1)
	text:SetWordWrap(false)
	text:SetText(L["CMD_CLOSE"])
end

fok:SetWidth(100)
fok:SetHeight(22)
fok:Show()

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

-------------------------------------
-- Function to set the text
-------------------------------------
function GJB:SetMessageBoxText(msg)
	local text = GJB.mbox.fmsgtext
	assert(text, "Error creating font string.")
	text:SetAllPoints(true)
	text:SetJustifyH("LEFT")
	text:SetJustifyV("TOP")
	text:SetTextColor(1, 1, 1, 1)
	text:SetWordWrap(true)
	text:SetText(msg)
end

