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


-- create red button, sets its position and make it invisible
local redButton = display.newImageRect("Images/redButton.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
