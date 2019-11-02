-- physics and collisions 
-- Thomas
-- ICS20R

------------------------------------------------------------------------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

-------------------------------------------------------------------------------------------------------------------------------------------------------
-- OBJECTS
---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)
	ground.x = display.contentCenterX
	ground.y = display.contentCenterY/0.5

	-- change the width to be the same as the screen
	ground.width = display.contentWidth

	-- add to physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

----------------------------------------------------------------------------------------

local beam = display.newImage("Images/beam.png", 0, 0)
	
	--set the x and y pos
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	-- set the beam width to be half the ipad width
	beam.width = display.contentWidth/2

	-- set the beam height to be 1/10 of the ipad height
	beam.height = display.contentHeight/10

	-- rotate the beam so that the beam -60 degrees so its on an angle
	beam:rotate(45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

---------------------------------------------------------------------------------------------------

-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0 )
	-- set the x and the y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- set the height and width of the background
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight 

	-- send to back 
	bkg:toBack()

---------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local Ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	--physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

----------------------------------------------------------------------------------------------------------------------------------------

-- create the second ball
local function secondBall()
	-- creating second ball
	physics.addBodyBall2 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})
end


---------------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
---------------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall())
timer.performWithDelay( 500, secondBall)