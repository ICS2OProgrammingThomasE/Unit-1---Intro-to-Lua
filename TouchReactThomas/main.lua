-- Title: Touch React
-- Name: Your Name
-- Course: ICS2O/3C

-- set the background colour
display.setDefault ("background", 160/255, 160/255, 160/255)

-- removes the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, sets its position and make it visible
local blueButton = display.newImageRect("Images/blueButton.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- Correct sound
local correctSound = audio.loadSound( "Sounds/Sound.mp3" )
local correctSoundChannel

-- create red button, sets its position and make it invisible
local redButton = display.newImageRect("Images/redButton.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- create a checkmark, set its position
local checkmark = display.newImage("Images/checkmark.png", 200, 200)
	checkmark.x = 750
	checkmark.y = display.contentHeight/2

	checkmark.height = display.contentWidth/10
	checkmark.width = display.contentWidth/10
checkmark.isVisible = false


local function BLueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		correctSoundChannel = audio.play(correctSound)
	end

end

local function RedButtonListener(touch)
		if (touch.phase == "ended") then 
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end
end
blueButton:addEventListener("touch", BLueButtonListener)
redButton:addEventListener("touch", RedButtonListener)