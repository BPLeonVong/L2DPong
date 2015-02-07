require 'gObjPaddle1'
require 'gObjPaddle2'
require 'gObjBall'
require 'gUIMenu'
require 'gUIBackground'
require 'lStatePause'

--require 'LUBE' 

--to do 
--networking 

function love.load()
    initMenu()
    initPaddle1()
    initPaddle2()
    initBall()
    state = 'menu'
end

function love.draw()

    if state == 'menu' then
    drawMenu()
    else
    setBackground()
    drawPaddle1()
    drawPaddle2()
    drawBall()
    end
    if state == 'pause' then
        drawPause()
        drawPauseGUI()
    end   
end

function love.update(dt)
    if state == 'menu' then
    updateMenu(dt)
    return
    elseif state == 'play' then
    updatePaddle1(dt)
    updatePaddle2(dt)
    updateBall(dt)
    else
    return
    end
end


function love.keypressed(key)
    if key == 'q' and state == 'pause' or key == 'escape' and state == 'pause' then
        love.event.quit()
    end
    if key == 'p' then
        if state == 'play' then
            state = 'pause'
        else
            state = 'play'
        end
    end
    
    --If return key
    if key == 'return' then
    menuSelectorPositionY = 300
     --if on 3rd screen for network
        if player2Stat == 'NetPlayer' then
           if menuOption2 == 0 then
                --create host
           end
           if menuOption2 == 1 then
                --find host
           end
           if menuOption2 == 2 then
              love.event.push('q')
           end
        end
            
        -- if in main menu or paused
        if state == 'menu' or state == 'pause' then
            --if on front page
            if  menuState == 0 then
                --start
                if menuOption == 0 then
                    menuState = 1
                    menuCap=1
                --help
                elseif menuOption == 1 then
                    menuState = 2
                    menuCap = 0
                    menuSelectorPositionY = 800
                --quit
                elseif menuOption == 2 then
                     love.event.quit()
                end
            --if on second page
            elseif  menuState == 1 then
                --if vs player
                if menuOption == 0 then
                state = 'play'
                    player2Stat = 'Player'
                --if vs cpu
                elseif menuOption == 1 then
                state = 'play'
                    player2Stat = 'AI'
                    paddle_2_speed = 350
                --if networked
                elseif menuOption == 2 then
                    player2Stat = 'NetPlayer'
                end
            --if on help screen
            elseif  menuState == 2 then
                if menuOption == 0  then
                    menuState=0
                    menuCap=2
                end
            end
        end
    menuOption = 0
    menuOption2 = 0
    end
    
    if love.keyboard.isDown('up') and state == "menu" and menuOption>0 then
        menuOption=menuOption-1
        menuOption2=menuOption2-1
        menuSelectorPositionY=menuSelectorPositionY-100
    end
    if love.keyboard.isDown('down') and state == "menu"  and menuOption<menuCap then
        menuOption=menuOption+1
        menuOption2=menuOption2+1
        menuSelectorPositionY=menuSelectorPositionY+100
    end
end