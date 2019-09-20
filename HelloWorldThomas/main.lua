-- Title: HelloWorld
-- Name: Thomas Enright
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.
--and to the command terminal

--print to the command terminal 
print ("Hello Noah!")
print ("This class is AWESOME")

--hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

--Sets the background colour
display.setDefault("background",51/255,255/255,51/255)

--create text object
local textObject

-- Make the text object display my name
textObject=display.newText ("Hello Thomas!", 500, 500, nil, 50)

-- change the text colour
textObject:setTextColor(0/255, 0/255, 0/255)