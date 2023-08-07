 -- Elements 
 -- rock properties
 oRock = {}
 oRock.sprite = love.graphics.newImage("Assets/Sprites/UI/Rock.png");
 oRock.x = 25;
 oRock.y = 10;
 oRock.sX = 1;
 oRock.sY = 1;
 oRock.rot = 0;
 oRock.w = oRock.sprite:getWidth();
 oRock.h = oRock.sprite:getHeight();
 
 
 -- paper properties
 oPaper = {}
 oPaper.sprite = love.graphics.newImage("Assets/Sprites/UI/Paper.png");
 oPaper.x = 225;
 oPaper.y = 10;
 oPaper.sX = 1;
 oPaper.sY = 1;
 oPaper.rot = 0;
 oPaper.w = oPaper.sprite:getWidth();
 oPaper.h = oPaper.sprite:getHeight();
 
 
 -- scissors properties
 oScissors = {}
 oScissors.sprite = love.graphics.newImage("Assets/Sprites/UI/Scissors.png");
 oScissors.x = 425;
 oScissors.y = 10;
 oScissors.sX = 1;
 oScissors.sY = 1;
 oScissors.rot = 0;
 oScissors.w = oScissors.sprite:getWidth();
 oScissors.h = oScissors.sprite:getHeight();

 
-- --  -- object element properties
--  function objElements(name, x, y, sx, sy, rot, sprite)
    
--     name = {}

--     name.sprite = love.graphics.newImage(sprite);
--     name.x = 25;
--     name.y = 10;
--     name.sX = 1;
--     name.sY = 1;
--     name.rot = 0;
--     name.w = name.sprite:getWidth();
--     name.h = name.sprite:getHeight();
        
--     return name

--  end
 
