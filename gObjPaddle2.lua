player2Stat = 'Player'
AISlideEffect = 0
player2Score = 0

function initPaddle2()
    paddle_2_width = 20
    paddle_2_height = 70
    paddle_2_x = 800 - paddle_2_width
    paddle_2_y = (600 / 2) -  (paddle_1_height / 2)
    paddle_2_speed = 400
    
    paddle_2_color = {255, 255, 255}
end

function drawPaddle2()
    love.graphics.setColor(paddle_2_color)
    
    love.graphics.print(player2Score,600,50)
    love.graphics.rectangle('fill', paddle_2_x, paddle_2_y, paddle_2_width, paddle_2_height)
end
function updatePaddle2(dt)  
    if player2Stat == 'Player' then
    if love.keyboard.isDown('up') then
        paddle_2_y = paddle_2_y - (paddle_2_speed * dt)
    end
    if love.keyboard.isDown('down') then
        paddle_2_y = paddle_2_y + (paddle_2_speed * dt)
    end
    elseif player2Stat == 'AI' then
        temp = ball_y - paddle_2_y
        if ball_speed_x > 0 then
        if temp > 0 then
            paddle_2_y = paddle_2_y + (paddle_2_speed * dt)
        end
        if temp < 0 then
            paddle_2_y = paddle_2_y - (paddle_2_speed * dt)
        end
        end
    end
    
    if paddle_2_y < 0 then
        paddle_2_y = 0
    elseif (paddle_2_y + paddle_2_height) > 600 then
        paddle_2_y = 600 - paddle_2_height
    end
end