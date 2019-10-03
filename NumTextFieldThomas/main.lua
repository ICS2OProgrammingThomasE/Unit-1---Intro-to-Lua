-- Title: Numeric Text Field
-- Name: Thomas
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric textfield.
-- terminal.
-------------------------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

------------------------------------------------------------------------------------
-- Local variables
--------------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer

-----------------------------------------------------------------------------------------------------------
-- local Functions
-------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function numericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		( eventTarget.text = "" )

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer 
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)

		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- object creation
----------------------------------------------------------------------------------------------------------------------------

-- displays a question and sets the colour 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the text and make it invisible
correctObject = display.newText( "Correct", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

-- create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event listener for the numeric field 
numericField:addEventListener( "userInput", numericFieldListener )

---------------------------------------------------------------------------------------------------------------------------------------
-- function calls
--------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()