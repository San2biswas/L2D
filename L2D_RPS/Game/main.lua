------------------------- load ---------------------

function love.load()
    sRock       = love.graphics.newImage("Assets/Sprites/UI/Rock.png")
    sPaper      = love.graphics.newImage("Assets/Sprites/UI/Paper.png")
    sScissors   = love.graphics.newImage("Assets/Sprites/UI/Scissors.png")
    csCircle    = love.graphics.circle("fill", 0, 0, 10)
    
end

----------------------- update ---------------------

function love.update(dt)

end

------------------------ draw ----------------------

function love.draw()
    local _leftMargin = 25
    love.graphics.draw(sRock, 0 + _leftMargin, 10, 0, 1, 1)
    love.graphics.draw(sPaper, 200 + _leftMargin, 10, 0, 1, 1)
    love.graphics.draw(sScissors, 400 + _leftMargin, 10, 0, 1, 1)

end
