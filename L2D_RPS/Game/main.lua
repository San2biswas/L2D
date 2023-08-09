------------------------ import --------------------

require('collision')
require('elements')


------------------------- load ---------------------

function love.load()

    
    -- cursor properties
    love.mouse.setVisible(false)
    csCircle = {}
    csCircle.x = 0;
    csCircle.y = 0;
    csCircle.rad = 10;
    csCircle.w = csCircle.rad
    csCircle.h = csCircle.rad

    cNo = math.random(os.time())/10
    comChoice = math.ceil(((cNo - math.floor(cNo))*10) % 2)

    if comChoice == 0 then
        aIChoice = "Rock"
    end
    
    if comChoice == 1 then
        aIChoice = "Paper"
    end
    
    if comChoice == 2 then
        aIChoice = "Scissors"
    end
    
    
    

end

----------------------- update ---------------------

function love.update(dt)
    
    -- controls
    -- mouse controls
    lClick = love.mouse.isDown(1)
    rClick = love.mouse.isDown(2)
    mClick = love.mouse.isDown(3)
    
    -- keyboard controls
    key_escape = love.keyboard.isDown("escape")    

    csCircle.x, csCircle.y = love.mouse.getPosition() -- cursor position
    

    -- keyboard controls
    if key_escape then
        love.window.close()
    end


end

------------------------ draw ----------------------

function love.draw()
    
    
    -- base color state
    function baseCol()
        
        love.graphics.setColor(1, 1, 1)
        
    end
    
    
    -- element hover color state
    function eCol(r1, g1, b1, cObj)
        
        love.graphics.setColor(r1, g1, b1)
        love.graphics.draw(cObj.sprite, cObj.x, cObj.y, cObj.rot, cObj.sX, cObj.sY);
        love.graphics.setColor(1, 1, 1)
        
    end
    

    -- draw elements
    love.graphics.draw(oRock.sprite, oRock.x, oRock.y, oRock.rot, oRock.sX, oRock.sY);
    love.graphics.draw(oPaper.sprite, oPaper.x, oPaper.y, oPaper.rot, oPaper.sX, oPaper.sY);
    love.graphics.draw(oScissors.sprite, oScissors.x, oScissors.y, oScissors.rot, oScissors.sX, oScissors.sY);
    

    -- hover change
    local eColor = {}
    eColor.r, eColor.g, eColor.b = 0.6, 0.8, 0.8
    
    local clickCol = {}
    clickCol.r, clickCol.g, clickCol.b = 0.5, 0.5, 0.5
    

    -- collision check
    if AABB(oRock.x, oRock.y, oRock.w, oRock.h, csCircle.x, csCircle.y, csCircle.w, csCircle.h) then
        
        eCol(eColor.r, eColor.g, eColor.b, oRock)
        if lClick then
            
            eCol(clickCol.r, clickCol.g, clickCol.b, oRock)
            cText = "Rock"
            
        end
        
        
    elseif AABB(oPaper.x, oPaper.y, oPaper.w, oPaper.h, csCircle.x, csCircle.y, csCircle.w, csCircle.h) then
        
        eCol(eColor.r, eColor.g, eColor.b, oPaper)
        if lClick then
            
            eCol(clickCol.r, clickCol.g, clickCol.b, oPaper)
            cText = "Paper"
            
        end
        
        
    elseif AABB(oScissors.x, oScissors.y, oScissors.w, oScissors.h, csCircle.x, csCircle.y, csCircle.w, csCircle.h) then
        
        eCol(eColor.r, eColor.g, eColor.b, oScissors)
        if lClick then
            
            eCol(clickCol.r, clickCol.g, clickCol.b, oScissors)
            cText = "Scissors"
            
        end
        
        
    else
        
        baseCol()
        cText = ""
        
    end
    
    love.graphics.print(cText, 200, 200);
    love.graphics.circle("fill", csCircle.x, csCircle.y, csCircle.rad); --  only cursor replace
    if love.mouse.isDown(1) then
    
        love.graphics.print(aIChoice, 200, 300);
    
    end
    

end

