--[[
==================================================================
Name:		  			LibFrameX-1.0
Author(s): 			Azmaedus
Revision: 	  			$Rev: 8 $
Created:	  			01/23/2015
Description:  		Library that creates a frame structure dynamically.
Dependencies: 	LibStub
License:	  			GPLv2
==================================================================
Change Log
--------------------
01/23/2015 - 1.0a 		Creation of addon
01/24/2015 - 1.0a-r2	Changed the name from GJBPlayer-1.0 to LibFrameX-1.0
01/24/2015 - 1.0a-r3	Optimization pass and documentation
01/27/2015 - 1.1a		Structure change to implement a children style design that requires recursive methodologies

==================================================================
Structure of the FrameX.tframes table
-----------------------------------------------------------------------------------------------------------------------
Example:
t = {
  {
    name = "root",
    children = {
      {
        name = "child1",
        children = {
          {
            name = "grandson1",
          },
        },
      },
    },
  },
}

- Each table within tframes can have the following elements, including sub-tables:
root: 		This frame's elements wont be drawn; acts as an invisible container. The children will be draw unless specified. |boolean|(optional)
ftype: 		Type of frame (Frame, Button, ...) |string|
name: 		Given name of the frame |string|
dim:			Dimensions |dimension table: w,h,s|(width, height, scale)
pos: 		Position |position table: a, r, ap, x, y| (anchor, relative to, r anchor, x, y)
show:		Visibility property |bolean|
template:	Template to be used for the CreateFrame call |string| (optional)

	---------------------------------------------
	||Text||
	---------------------------------------------
text: 			Table of text properties to show a string of characters in the frame |text table: str,color,fs,halign,valign|(optional)
	color:		Color of the text |RGBA table:0-255,0-255,0-255,1-255,0-1|(optional)
	fs: 			Font style |string| defaults to: "NumberFont_Shadow_Small"
	halign: 	Horizontal alignment |string| defaults to: "CENTER"
	valign: 	Vertical alignment |string| defaults to: "CENTER"
	show:		Show/hide text |boolean|
	caption:		Text shown |string|
	
	---------------------------------------------
	||Backdrops||
	---------------------------------------------
	A backdrop is the background part of a frame; it can be colourized
	Here is the structure:
	bgFile: Background image file; such as Interface\ChatFrame\ChatFrameBackground
	edgeFile: Edge file of the background image; such as Interface/Tooltips/UI-Tooltip-Border
	tile: Is the image tiled or stretched |boolean|
	tileSize: Size in pixels of each tile |integer|
	edgeSize: Size of the edge and corners |integer|
	insets: The bigger the edge, the bigger the inset. Controls overflow, making sure backdrop doesn't overflow outside of the edges.
		{ left, right, top, bottom } |integer|

bd: 			BackDrop of the element |BackDrop table|(optional)

	---------------------------------------------
	||Colors||
	---------------------------------------------
rgba: 					Color of the backdrop |RGBA table:0-255,0-255,0-255,1-255,0-1|(optional)
brgba: 					Color of the element's border |RGBA table:0-255,0-255,0-255,1-255,0-1|(optional)

	---------------------------------------------
	||Movement, Interactions & Scripts||
	---------------------------------------------
movable: 		Makes the frame movable with a specific mouse button and script. |movable table: enabled, drag table|(optional)
	enabled: 	Enable or disable the drag |boolean| 
	drag: 		List of buttons to register for the drag |drag table: str-1,...,str-n| ("LeftButton", "RightButton", ...)

clicks: 		List of possible registered mouse clicks |click table: str-1, ..., str-n| ("LeftButtonUp", "RightButtonUp", ...)
scripts: 	Table of scripts associated with this element |scripts table: event, func|
	event: 	Event name |string| ("OnSomething")
	func: 	Actual function to execute when event is triggered |function(self,...) ... end|
	
==================================================================
	Public Functions
-----------------------------------------------------------------------------------------------------------------------
	- makeFrames(t)
	- findFrame(t, name)
	
	---------------------------------------------
	||getter/setter||
	---------------------------------------------
	- getVisibility(name)
	- getBD(name)
	- setBD(name, bd)
	- getBRGBA(name)
	- setBRGBA(name, brgba)
	- getRGBA(name)
	- setRGBA(name, rgba)
	- setVisibility(name, vis)
	- getPositionByName(name)
	- setPosition(name, a, r, rp, x, y)
	- getFrameCaption(name)
	- setFrameCaption(name, cap)
==================================================================
]]

local LIBFRAMEX = "LibFrameX-1.0"
local LIBFRAMEX_MINOR = tonumber(("$Revision: 8 $"):match("(%d+)"))
assert(LibStub, LIBFRAMEX .. " requires LibStub.")
local lfx = LibStub:NewLibrary(LIBFRAMEX, LIBFRAMEX_MINOR)
if not lfx then return end

--lfx.frame = lfx.frame or CreateFrame("Frame")
lfx.data = lfx.data or {}

------------------------------------------------------------
-- Function to create a frame with values passed from FrameX:makeFrames
-- Arguments:
--		- v:  type tframe table/child table |table|
-- 	- p: Parent frame |Frame|
-- Return: 	- the configured frame |Frame|
-- 				- nil on error
------------------------------------------------------------
local function genFrame(v, p)
	assert(v.name and v.name ~= "", "Can't process a node without a name.") -- error, unnamed node
	
	-- create frame
	local fo = CreateFrame(v.ftype, v.name, p, v.template) -- type, name, parent, template
	assert(fo, "Failed to create frame " .. v.name) -- failed to create the frame

	-- set parameters
	fo.root = v.root or false -- make sure we set root to false if not supplied
	fo.name = v.name -- must have
	fo.rgba = v.rgba or {}
	fo.brgba = v.brgba or {}
	fo.bd = v.bd or {}
	fo.dim = v.dim or {}
	fo.text = v.text or {}
	fo.show = v.show or true -- make sure we set show to true if not supplied
	
	-- draw background if any
	if not fo.root or fo.root == false and (fo.bd or fo.rgba or fo.brgba) then
		if fo.bd and assert(type(fo.bd) == "table", "Invalid type for " .. fo.name .. "'s bd, table expected, got " .. type(fo.bd)) then
			fo:SetBackdrop(v.bd)
		end
		
		if fo.rgba and assert(type(fo.rgba) == "table", "Invalid type for " .. fo.name .. "'s rgba, table expected, got " .. type(fo.rgba)) then
			fo:SetBackdropColor(v.rgba.r/256, v.rgba.g/256, v.rgba.b/256, v.rgba.a)
		end
		
		if fo.brgba and assert(type(fo.brgba) == "table", "Invalid type for " .. fo.name .. "'s brgba, table expected, got " .. type(fo.brgba)) then
			fo:SetBackdropBorderColor(v.brgba.r/256, v.brgba.g/256, v.brgba.b/256, v.brgba.a)
		end
	end

	-- prepare to set dimensions
	if fo.dim and assert(type(fo.dim) == "table", "Invalid type for " .. fo.name .. "'s dim, table expected, got " .. type(fo.dim)) then
		fo:SetWidth(fo.dim.w)
		fo:SetHeight(fo.dim.h)
		fo:SetScale(fo.dim.s)
	end

	-- show the frame
	if fo.show == true then
		fo:Show()
	else
		fo:Hide()
	end

	return fo
end

------------------------------------------------------------
-- function to load frame data
-- Recursive function
-- Arguments:
--		- t:  type tframe table/child table |table|
-- 	- p: Parent frame |Frame|
-- Return: 	- the frame processed |Frame|
-- 				- nil on error
------------------------------------------------------------
local function ProcessConfigData(cfg, p)
	-- loop through all elements and recursively create all frames
	local fx = {}
	for k, v in pairs(cfg) do
		assert(v, "Invalid config item.")

		-- start filling up data structure for this frame
		fx[k] = genFrame(v, p) -- create the frame
		local fxi = fx[k]
		assert(fxi, "Error generating lfx frame.")

		fxi:SetPoint(v.pos.a, v.pos.r, v.pos.rp, v.pos.x, v.pos.y) -- align, relative, rel parent, x, y
			
		-- check if the frame has a text component
		if v.text and v.text.show == true then
			local text = {}
			text = fxi:CreateFontString(nil, "ARTWORK", v.fs or "NumberFont_Shadow_Small")
			assert(text, "Error creating font string.")
			text:SetAllPoints(true)
			text:SetJustifyH(v.halign or "CENTER")
			text:SetJustifyV(v.valign or "CENTER")
			text:SetTextColor(v.text.color.r/256 or 1, v.text.color.g/256 or 1, v.text.color.b/256 or 1, v.text.color.a or 1)
			text:SetText(v.text.caption or "")
		end
		
		--TODO: set texture
		--FrameX.tframes[i]:SetNormalTexture("\\media\\button.tga")

		-- if frame is movable
		if v.movable and v.movable.enabled then
			assert(type(v.movable.drag) == "table", "Inavlid type for drag, table excpected.")
			fxi:SetMovable(true)
			fxi:EnableMouse(true)
			fxi:RegisterForDrag(unpack(v.movable.drag))
		else
			fxi:SetMovable(false)
			fxi:EnableMouse(false)
		end

		-- register click events
		if v.clicks then
			fxi:EnableMouse(true)
			fxi:SetPoint("CENTER")
			assert(type(v.clicks) == "table", "Inavlid type for clicks, table excpected.")
			fxi:RegisterForClicks(unpack(v.clicks))
		end
		
		-- create scripts
		if v.scripts then -- be careful, if you have scripts, you should have a register clicks
			for _, s in pairs(v.scripts) do
				fxi:SetScript(s.event, s.func)
			end
		end

		-- check if this element has children (recursive call)
		if v.children then
			p = fxi -- set parent for next createframe
			fxi.children = ProcessConfigData(v.children, p)
		end
	end
	
	return fx
end

------------------------------------------------------------
-- entry point function to create the frames
-- Arguments:
-- 	- addon: Addon table |table|
--		- config:  main tframe table |table|
------------------------------------------------------------
function lfx.makeFrames(addon, cfg)
	-- check parameter types
	assert(type(addon) == "table", "Invalid argument #1, table expected (addon table).")
	assert(type(cfg) == "table", "Invalid argument #2, table expected. (LibFrameX config table).")
	
	lfx.data[addon] = {} -- initialize calling addon's store for tframe table
	lfx.data[addon].tframes = ProcessConfigData(cfg, UIParent) -- create the frame structure (recursive)
end

------------------------------------------------------------
-- Returns a frame by providing the frame's name
-- Arguments:
--		- t: table of tframes |table|
-- 	- name: string (name of element to be found) |string|
-- Return: 	- the frame if found |Frame|
-- 				- false if frame not found or because invalid arguments were passed
------------------------------------------------------------
local function searchFrame(t, name)
    if type(t) ~= "table" or type(name) ~= "string" then return false end -- invalid arguments
    for _, f in pairs(t) do
        if f.name == name then -- frame found
            return f
        end
        if f.children then 
            local cf = searchFrame(f.children, name)
            if cf then -- frame found in children
                return cf
            end
        end
    end
    return false -- frame not found
end

function lfx.findFrame(addon, name)
	assert(lfx.data[addon].tframes, "Invalid data or nil, " .. addon:GetName() .. " for frame " .. name)
	local data = lfx.data[addon].tframes
	return searchFrame(data, name)
end
------------------------------------------------------------
-- Gets the frame's backdrop using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- Return: 	- RGBA table if successful
-- 			- nil if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.getBD(addon, name)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f and f.bd then
			return f.bd
		end
	end
	
	return nil
end

------------------------------------------------------------
-- Sets the frame's backdrop using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- 	- dim: Visibility |boolean|
-- Return: 	- true if successful
-- 			- false if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.setBD(addon, name, bd)
	if name and name ~= "" and bd then
		local f = lfx.findFrame(addon, name)
		if f then
			f.bd = bd
			return true
		end
	end
	
	return false
end

------------------------------------------------------------
-- Gets the frame's border rgba values using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- Return: 	- RGBA table if successful
-- 			- nil if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.getBRGBA(addon, name)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f and f.brgba then
			return f.brgba
		end
	end
	
	return nil
end

------------------------------------------------------------
-- Sets the frame's rgba values using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- 	- dim: Visibility |boolean|
-- Return: 	- true if successful
-- 			- false if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.setBRGBA(addon, name, brgba)
	if name and name ~= "" and brgba then
		local f = lfx.findFrame(addon, name)
		if f then
			f.brgba = brgba
			return true
		end
	end
	
	return false
end

------------------------------------------------------------
-- Gets the frame's rgba values using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- Return: 	- RGBA table if successful
-- 			- nil if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.getRGBA(addon, name)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f and f.rgba then
			return f.rgba
		end
	end
	
	return nil
end

------------------------------------------------------------
-- Sets the frame's rgba values using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- 	- dim: Visibility |boolean|
-- Return: 	- true if successful
-- 			- false if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.setRGBA(addon, name, rgba)
	if name and name ~= "" and rgba then
		local f = lfx.findFrame(addon, name)
		if f then
			f.rgba = rgba
			f:SetBackdropColor(rgba.r/256, rgba.g/256, rgba.b/256, rgba.a)
			return true
		end
	end
	
	return false
end

------------------------------------------------------------
-- Gets the frame's dimensions using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- Return: 	- Dimension table if successful
-- 			- nil if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.getDimesions(addon, name)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f and f.dim then
			return f.dim
		end
	end
	
	return nil
end

------------------------------------------------------------
-- Sets the frame's dimensions using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- 	- dim: Visibility |boolean|
-- Return: 	- true if successful
-- 				- false if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.setDimensions(addon, name, dim)
	if name and name ~= "" and dim then
		local f = lfx.findFrame(addon, name)
		if f then
			f.dim = dim
			f:SetWidth(dim.w)
			f:SetHeight(dim.h)
			f:SetScale(dim.s)
			return true
		end
	end
	
	return false
end

------------------------------------------------------------
-- Gets the frame's visibility using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- Return: 	- Position table if successful
-- 				- nil if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.getVisibility(addon, name)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f then
			return f.show
		end
	end
	
	return nil
end

------------------------------------------------------------
-- Sets the frame's visibility using it's name
-- Recursive function
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- 	- vis: Visibility |boolean|
--		- all: Affect all children as well |boolean|
-- Return: 	- true if successful
-- 				- false if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.setVisibility(addon, name, vis)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f then
			if vis == true then
				f.show = true
				f:Show()
			else
				f.show = false
				f:Hide()
			end

			return true
		end
	end
	
	return false
end

------------------------------------------------------------
-- Sets the frame's visibility using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- 	- v: Visibility |boolean|
-- Return: 	- Position table if successful
-- 				- nil if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.getPosition(addon, name)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f then
			return f.pos
		end
	end
	
	return nil
end

------------------------------------------------------------
-- Sets the position of a specific frame by name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- 	- a: anchor point of element |string| (eg: "TOPLEFT")
-- 	- r: relative to element |Frame|
-- 	- rp: relative parent anchor point |string| (eg: "TOPLEFT")
-- 	- x: x Cartesian value
-- 	- y: y Cartesian value
-- Return: 	- true if successful
-- 				- false if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.setPosition(addon, name, pos) -- a, r, rp, x, y
	if name and name ~= "" then
	assert(pos, "Must provide a valid position point table")
		local f = lfx.findFrame(addon, name)
		if f then
			f:SetPoint(pos.a, pos.r, pos.rp, pos.x, pos.y)
			return true
		end
	end
	
	return false
end

------------------------------------------------------------
-- Sets the caption of a frame using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- Return: 	- Caption if successful |string|
-- 				- nil if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.getFrameCaption(addon, name)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f then
			return f.caption
		end
	end
	
	return nil
end

------------------------------------------------------------
-- Sets the caption of a frame using it's name
-- Arguments:
-- 	- name: string (name of element to be found) |string|
-- 	- cap: caption to be set |string|
-- Return: 	- true if successful
-- 				- false if name not found or because invalid arguments were passed
------------------------------------------------------------
function lfx.setFrameCaption(addon, name, cap)
	if name and name ~= "" then
		local f = lfx.findFrame(addon, name)
		if f then
--[[			local fxi = f.text
			f.caption = cap
			local text = f:CreateFontString(nil, "ARTWORK", fxi.fs or "NumberFont_Shadow_Small")
			text:SetAllPoints(true)
			text:SetJustifyH(fxi.halign or "CENTER")
			text:SetJustifyV(fxi.valign or "CENTER")
			text:SetTextColor(fxi.color.r/256 or 1, fxi.color.g/256 or 1, fxi.color.b/256 or 1, fxi.color.a or 1)
			text:SetText(cap)
			return true
]]
		end
	end
	
	return false
end