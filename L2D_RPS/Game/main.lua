------------------------ import --------------------
require('collision')
require('elements')

------------------------- load ---------------------

function love.load()

    -- #region cursor
    -- cursor properties
    love.mouse.setVisible(false)
    csCircle = {}
    csCircle.x = 0;
    csCircle.y = 0;
    csCircle.rad = 10;
    csCircle.w = csCircle.rad;
    csCircle.h = csCircle.rad;
    -- #endregion cursor

    
    -- #region variable assign

    aiT = 0;
    cNo = math.random(os.time()) / 10;
    comChoice = math.ceil(((cNo - math.floor(cNo)) * 10) % 2);
    cText = "let's play..."

    -- #endregion variable assign

end

----------------------- update ---------------------

function love.update(dt)

    -- #region controls
    -- mouse controls
    lClick = love.mouse.isDown(1)
    rClick = love.mouse.isDown(2)
    mClick = love.mouse.isDown(3)

    -- keyboard controls
    key_escape = love.keyboard.isDown("escape")
    key_r = love.keyboard.isDown("r")

    csCircle.x, csCircle.y = love.mouse.getPosition() -- cursor position

    -- keyboard controls
    if key_escape then
        love.window.close()
    end

    if key_r then
        love.event.quit("restart")
    end

    -- #endregion controls

    -- #region ai choice  

    -- ai choice lock   
    if aiT == 0 then
        aIChoice = "Rock"
    end

    if aiT == 1 then
        aIChoice = "Paper"
    end

    if aiT == 2 then
        aIChoice = "Scissors"
    end

    if lClick then

        aiT = aiT + 1;
        if aiT > 2 then
            aiT = 0;
        end

    end

    -- #endregion ai choice

end

------------------------ draw ----------------------

function love.draw()

    -- #region color

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

    -- hover change
    local eColor = {}
    eColor.r, eColor.g, eColor.b = 0.6, 0.8, 0.8

    local clickCol = {}
    clickCol.r, clickCol.g, clickCol.b = 0.5, 0.5, 0.5

    -- #endregion color

    -- #region draw sprites

    -- draw elements
    love.graphics.draw(oRock.sprite, oRock.x, oRock.y, oRock.rot, oRock.sX, oRock.sY);
    love.graphics.draw(oPaper.sprite, oPaper.x, oPaper.y, oPaper.rot, oPaper.sX, oPaper.sY);
    love.graphics.draw(oScissors.sprite, oScissors.x, oScissors.y, oScissors.rot, oScissors.sX, oScissors.sY);

    -- #endregion draw sprites

    -- #region collision

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

    end

    -- #endregion collision

    -- #region text print

    love.graphics.print(cText, 200, 200);
    love.graphics.print(aIChoice, 200, 300);
    love.graphics.print(aiT, 300, 300);

    -- #endregion text print

    love.graphics.circle("fill", csCircle.x, csCircle.y, csCircle.rad); --  only cursor replace

end

