
function initBall()
    ballstate = 'Left'
    ball_width = 20
    ball_height = 20
    ball_x = (800 / 2) - (ball_width / 2)
    ball_y = (600 / 2) - (ball_height / 2)
    ball_color = {255, 255,255}
    
    ball_speed_x = -200
    ball_speed_y = 200
    ballSpeedTXT = math.abs(ball_speed_x)

end

function drawBall()
    love.graphics.setColor(ball_color)
    
    love.graphics.rectangle('fill', ball_x, ball_y, ball_width, ball_height)
end

function updateBall(dt)
    if ball_y < 0 then
        ball_speed_y = math.abs(ball_speed_y)
    elseif (ball_y + ball_height) > 600  then
        ball_speed_y = -math.abs(ball_speed_y)
    end


    if ball_x <= paddle_1_width and
        (ball_y + ball_height) >= paddle_1_y and
        ball_y < (paddle_1_y + paddle_1_height) and 
        ballstate == 'Left'
    then
        ball_speed_x = math.abs(ball_speed_x-100)
        ballstate = 'Right'        
    end
    
    if (ball_x + ball_width) >= (800 - paddle_2_width) and
        (ball_y + ball_height) >= paddle_2_y and
        ball_y < (paddle_2_y + paddle_2_height) and 
        ballstate == 'Right'
    then
        ball_speed_x = -math.abs(ball_speed_x+100)
        ballstate = 'Left'
    end 
   ballSpeedTXT = math.abs(ball_speed_x)
    
    
    if ball_x + ball_width < 0 or ball_x > 800 then
    if(ball_x+ball_width <0) then
    player2Score = player2Score + 1
        ballstate = 'Left'
    end
    if(ball_x > 800) then
    player1Score = player1Score + 1
        ballstate = 'Left'
    end
        ball_x = (800 / 2) - (ball_width / 2)
        ball_y = (600 / 2) - (ball_height / 2)
        ball_speed_x = -200
        ball_speed_y = 200
    end
    
    ball_x = ball_x + (ball_speed_x * dt)
    ball_y = ball_y + (ball_speed_y * dt)
end