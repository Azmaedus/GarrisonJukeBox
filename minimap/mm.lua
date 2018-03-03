local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

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
			if GJB.db.profile.hidemusicplayer then
				GJB.db.profile.hidemusicplayer = false
				GJB:SetPlayerVisibility(true)
			else
				GJB.db.profile.hidemusicplayer = true
				GJB:SetPlayerVisibility(false)
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
		local icon = LibStub("LibDBIcon-1.0", true)
		icon:Register("GarrisonJukeBox", plugin, GJB.db.profile.minimap)
	end)
	f:RegisterEvent("PLAYER_LOGIN")
end
