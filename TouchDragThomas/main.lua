-- Title: Touch and Drag
-- Name: Thomas Enright
-- Course: ICS2O/3C
-- This program displays two images and lets you drag them.
--------------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background image
local backgroundImage = display.newImageRect("Images/cosmos.jpg", 2048, 1536)
local UFO = display.newImageRect("Images/UFO.png", 150, 150)
local UFOWidth = UFO.Width
local UFOHeight = UFO.height

local Rocket = display.newImageRect("Images/Rocket.png", 150, 150)
local RocketWidth = Rocket.Width
local RocketHeight = Rocket.height

-- my boolean variables variablea of wich object I touched first
local alreadyTouchedUFO = false
local alreadyTouchedRocket = false

-- set the initil x and y position of myImage
UFO.x = 400
UFO.y = 500

Rocket.x = 300
Rocket.y = 200

-- function: RocketListener
-- Input: touch listener
-- output: none
-- Description: when Rocket is touched, move it
local function RocketListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedUFO == false) then
			alreadyTouchedRocket = true
		end
	end	

	if ( (touch.phase == "moved") and (alreadyTouchedRocket == true) ) then
		Rocket.x = touch.x
		Rocket.y = touch.y
	end
	if (touch.phase == "ended") then
		alreadyTouchedRocket = false
		alreadyTouchedUFO = false
	end	
end

-- add the respective listeners to each object 
Rocket:addEventListener("touch", RocketListener)	

-- function: UFOListener
-- Input: touch listener
-- output: none
-- Description: when UFO is touched, move it
local function UFOListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedRocket == false) then
			alreadyTouchedUFO = true
		end
	end	

	if ( (touch.phase == "moved") and (alreadyTouchedUFO == true) ) then
		UFO.x = touch.x
		UFO.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedRocket = false
		alreadyTouchedUFO = false
	end	
end

-- add the respective listeners to each object 
UFO:addEventListener("touch", UFOListener)	