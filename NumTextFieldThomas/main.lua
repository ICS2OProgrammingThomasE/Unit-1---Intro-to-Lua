-- Title: Numeric Text Field
-- Name: Thomas
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric textfield.
-- terminal.
-------------------------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the colour of the background
display.setDefault("background", 255/255, 128/255, 0/255 )
------------------------------------------------------------------------------------
-- Local variables
--------------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local tempRandomNumber3
local userAnswer
local correctAnswer
local incorrectAnswer
local points = 0
local lives = 3
local livesObject
local randomOperator


-----------------------------------------------------------------------------------------------------------
-- local Functions
-------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(1, 10)
	randomNumber2 = math.random(1, 10)

	-- chooses a random operator
	randomOperator = math.random(1, 3)

	if (randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
		
		if (randomNumber1 < randomNumber2) then
			tempRandomNumber3 = randomNumber1
			randomNumber1 = randomNumber2
			randomNumber2 = tempRandomNumber3
		end

		correctAnswer = randomNumber1 - randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
		
	
	elseif (randomOperator == 3) then
		correctAnswer = randomNumber1 * randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
	end	
end




local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	IncorrectObject.isVisible = false
	AskQuestion()
end

local function numericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = " "

	elseif (event.phase == "submitted") then
		userAnswer = tonumber(event.target.text)

		-- when the answer is submitted (enter key is pressed) set user input to user's answer 
		if (userAnswer == correctAnswer) then
			IncorrectObject.isVisible = false
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			event.target.text = " "

		else 
			IncorrectObject.isVisible = true
			correctObject.isVisible = false
			timer.performWithDelay(2000, HideIncorrect)
			event.target.text = " "			
			lives = lives - 1
			livesObject.text = "Lives = " .. lives 
			if (lives == 0) then
				-- hide everything

				-- display you lose
			end
		end
	end	
end







----------------------------------------------------------------------------------------------------------------------------
-- object creation
----------------------------------------------------------------------------------------------------------------------------

-- displays a question and sets the colour 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(0/255, 20/255, 250/255)

-- displays the live count
livesObject = display.newText("Lives = " .. lives, display.contentWidth/8, display.contentHeight/4, nil, 50 )
questionObject:setTextColor(0/255, 20/255, 250/255)

-- create the text and make it invisible
correctObject = display.newText( "Correct", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0/255, 204/255, 0/255)
correctObject.isVisible = false

-- create the text and make it invisible
IncorrectObject = display.newText( "Incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
IncorrectObject:setTextColor(255/255, 0/255, 0/255)
IncorrectObject.isVisible = false

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