
player1Score = 0

function initPaddle1()
    paddle_1_width = 20
    paddle_1_height = 70
    paddle_1_x = 0
    paddle_1_y = (600 / 2) -  (paddle_1_height / 2)
    
    paddle_1_speed = 400;
    
    paddle_1_color = {255, 255, 255}
end

function drawPaddle1()
    love.graphics.setColor(paddle_1_color)
    
    love.graphics.print(player1Score,200,50)
    love.graphics.rectangle('fill', paddle_1_x, paddle_1_y, paddle_1_width, paddle_1_height)
end

function updatePaddle1(dt)
  if love.keyboard.isDown('w') then
        paddle_1_y = paddle_1_y - (paddle_1_speed * dt)
    end
    if love.keyboard.isDown('s') then
        paddle_1_y = paddle_1_y + (paddle_1_speed * dt)
    end 
   if paddle_1_y < 0 then
        paddle_1_y = 0
    elseif (paddle_1_y + paddle_1_height) > 600 then
        paddle_1_y = 600 - paddle_1_height
    end
    
end