-- Title: MovingImages
-- Name: Thomas
-- Course: ICS2O/3C
-- This program displays an image that moves across the screen.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables 
scrollSpeed = 3

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- Charecter image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- rocketship image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- set rocketship to be transparent
rocketship.alpha = 0

--set the x and y position of rocketship
rocketship.x = display.contentHeight/3
rocketship.y = 0

-- Function: MoveRocketShip
-- Input: this function accepts an event listener
-- Output: none
-- Desciption: This function adds the scroll speed to the y-value of the rocketship
local function MoveRocketShip(event)
	-- add the scroll speed to the x-value of the ship
	rocketship.y = rocketship.y + scrollSpeed
	-- change the transparency of the ship every time it moves so fast that it fades out 
	rocketship.alpha = rocketship.alpha + 0.01
end

-- MoveRocketShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocketShip)

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Desciption: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so fast that it fades out 
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

