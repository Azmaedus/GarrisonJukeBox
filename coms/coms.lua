local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

local COMM_PREFIX = GJB.COMM_PREFIX			-- Used with AceComm prefix concatenation

-- Lua APIs
local tinsert, tconcat, tremove, tsort = table.insert, table.concat, table.remove, table.sort
local fmt, tostring = string.format, tostring
local select, pairs, next, type, unpack = select, pairs, next, type, unpack
local loadstring, assert, error = loadstring, assert, error
local setmetatable, getmetatable, rawset, rawget = setmetatable, getmetatable, rawset, rawget
local mrand = math.random

-- ------------------------------------------------------
-- Function to build a table of party members when they join or leave a 5man group and ask for GJB's version.
-- OOD == Out Of Date
-- ------------------------------------------------------
function GJB:OnJoinParty(event, ...)
	if IsInRaid() then return end -- cannot be in a raid
	if not IsInGroup() then return end -- must be in a group
	
	local temp = {}
	local found = false
	
	-- build list of current group members
	local n = GetNumGroupMembers()
	for i=1,n-1 do -- n-1 because there are 4 members + "player"
		if UnitIsConnected("party"..i) then -- Must be online
			local name = GetUnitName("party"..i, true)
			for _, v in pairs(self.BlackList) do
				if v == name then
					found = true
					break
				end
			end
			
			if found == false then
				tinsert(temp, name)
			end
		end
	end

	-- loop through the tables and send messages to query for version only if not already done this login session
	if GJB.gOODShouted == false then
		if table.getn(temp) > 0 then
			local t = {"table"}
			local s = self:Serialize(t)
			for _, v in pairs(temp) do
				if GJB.gOODShouted == true then return
				else
					--print("Sent version request to: " .. temp[i])
					self:SendCommMessage(COMM_PREFIX.."ReqVersion", s, "WHISPER", v)
				end
			end
		end
	end
	self.Party = temp
end

-- ------------------------------------------------------
-- Receive a request to send the version info to another party member
-- ------------------------------------------------------
function GJB:OnBuddyReqVersion(prefix, message, dist, sender)
	-- make sure the addon only computes messages from GJB and in the WHISPER channel and that the values are ok to process
	if prefix ~= COMM_PREFIX .. "ReqVersion" and dist ~= "WHISPER" then return end
	if sender == nil or sender == "" or message == nil or message == "" then return end -- invalid sender and/or message

	local success, o = self:Deserialize(message)
	if success == false then return end -- Fail

	local msg = ""
	local t = {}
	if o[1] ~= "table" then 
		t = {version = self.gVersion}
	else
		t = {version = self.gVersionID}
	end
	
	local s = self:Serialize(t)
	self:SendCommMessage(COMM_PREFIX.."SentVersion", s, "WHISPER", sender)
end

-- ------------------------------------------------------
-- convert version table to string
-- ------------------------------------------------------
function GJB:VersionTableToString(t)
	if type(t) ~= "table" then return "????" end
	local str = ""
	for i=1, #t do
		local v = t[i]
		if i < VERSION_TABLE_SIZE - 1 then
			str = str .. v .. "."
		elseif i == VERSION_TABLE_SIZE - 1 then
			str = str .. v
		end
	end
	
	return str
end

-- ------------------------------------------------------
-- Receive a message with a versionID. Compare it to your own and if you are out-of-date, print to chat pane
-- ------------------------------------------------------
function GJB:OnBuddySentVersion(prefix, message, dist, sender)
	-- make sure the addon only computes messages from GJB and in the WHISPER channel
	-- There are 2 versions that have been released and we will detect what version of the checker has been sent
	if not dist or dist ~= "WHISPER" then return end -- no distribution or not in whisper channel
	if not prefix or prefix ~= COMM_PREFIX .. "SentVersion" then return end -- no prefix, not for us, reject this
	if sender == nil or sender == "" or message == nil or message == "" then return end -- invalid sender and/or message

	local success, o = self:Deserialize(message)
	if success == false then return end -- Fail

	-- version of OOD checker
	local OOD = false
	if not o.version then return end

	-- 1.0.8.0 uses o.version == "string"

	-- 1.0.8.2+
	local ver = o.version
	if type(ver) == "table" then
		if table.getn(ver) == VERSION_TABLE_SIZE then
			if self:isVersionOOD(self.gVersionID, ver) then
				OOD = true
			end
		end
	end

	if OOD then
		self:Print("|cffff0000" .. L["ADDON_OUT_OF_DATE"] .. " " .. self:VersionTableToString(ver) .. "|r")
		GJB.gOODShouted = true
	else
		-- add to blacklist
		tinsert(self.BlackList, sender) 
	end
end

-- ------------------------------------------------------
-- Sends the currently playing music to all party members except yourself (leader)
-- ------------------------------------------------------
function GJB:sendMusicToParty(data)
	local n = GetNumGroupMembers()
	if n > 1 and n <= 5 then
		local t = { expac = data.expac, title = data.title, index = data.index }
		local s = self:Serialize(t)
		for u = 1, n - 1 do
			if UnitIsConnected("party"..u) then -- Must be online
				local name = GetUnitName("party".. u, true)
				if name or name ~= "" then
					self:SendCommMessage(COMM_PREFIX.."GetMusic", s, "WHISPER", name)
				end
			end
		end
	end
end

-- ------------------------------------------------------
-- only can be received from the party leader. Tells other party members what music the leader is currently playing
-- ------------------------------------------------------
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
					music = self.musictable[o.expac][o.title].files[o.index]
					
					if music ~= nil then
						PlayMusic(music[GJB.MT_MUSICFILE])
						GJB:SetNowPlayingText( GJB:ExtractMP3Filename( music[GJB.MT_MUSICFILE] ) )

						local ptime = music[GJB.MT_MUSICLEN]
						local tmins = floor(ptime/60)
						local tsecs = ptime - (tmins * 60)
						
						if self.db.profile.chatoutput then
							self:Print(L["PLAYING"] .. " " .. music[GJB.MT_MUSICFILE] .. " " .. "from" .. " " .. sender)
						end
						
						self.gMusicPlaying = true
						self.musicTimer = self:ScheduleTimer("TimerEventMusic", ptime)
					end
				end
			end
		end
	end
end

