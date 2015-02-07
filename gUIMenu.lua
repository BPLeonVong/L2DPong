menuColor = {0, 0, 0}

menuState = 0
menuOption= 0
menuOption2= 0
menuCap = 2
menuSelectorPositionY = 300


function initMenu()
menuImage01 = love.graphics.newImage('gL2DPONGGUITitle.png')
menuSelector = love.graphics.newImage('gL2DPONGGUISelector.png')
menuHelpScreen = love.graphics.newImage('gL2DPONGTXTHelpDescription.png') 
menuButton01 = love.graphics.newImage('gL2DPONGTXTStart.png')
menuButton02 = love.graphics.newImage('gL2DPONGTXTHelp.png') 
menuButton03 = love.graphics.newImage('gL2DPONGTXTQuit.png') 
menuOption01 = love.graphics.newImage('gL2DPONGTXTvsP.png')
menuOption02 = love.graphics.newImage('gL2DPONGTXTvsCPU.png')
menuOption03 = love.graphics.newImage('gL2DPONGTXTNetwork.png') 
menuOption21 = love.graphics.newImage('gL2DPONGTXTHost.png')
menuOption22 = love.graphics.newImage('gL2DPONGTXTFHost.png') 
pauseDescription = love.graphics.newImage('gL2DPONGTXTPauseDescription.png') 
                 
end

function drawMenu()
    love.graphics.setBackgroundColor(menuColor)
   
    love.graphics.draw(menuSelector,300,menuSelectorPositionY)
    
if menuState==0 then
    love.graphics.draw(menuImage01,70,0)
    love.graphics.draw(menuButton01,300,300)
    love.graphics.draw(menuButton02,300, 400)
    love.graphics.draw(menuButton03,300, 500)
elseif menuState==1 and player2Stat~='NetPlayer' then
    love.graphics.draw(menuImage01,70,0)
    love.graphics.draw(menuOption01,300,300)
    love.graphics.draw(menuOption02,300, 400)
    --love.graphics.draw(menuOption03,300, 500)
elseif menuState==2 then
    love.graphics.draw(menuHelpScreen,100, 0)
elseif player2Stat == 'NetPlayer' then
    love.graphics.draw(menuImage01,70,0)
    love.graphics.draw(menuOption21,300,300)
    love.graphics.draw(menuOption22,300, 400)
    love.graphics.draw(menuButton03,300, 500)
    end
end

function drawPauseGUI()
    love.graphics.draw(pauseDescription,100, 0)
end

function updateMenu(dt)
end