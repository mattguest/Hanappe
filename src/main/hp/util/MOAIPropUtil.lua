--------------------------------------------------------------------------------
-- This is a utility class for MOAIProp.<br>
-- @class table
-- @name MOAIPropUtil
--------------------------------------------------------------------------------
local M = {}

--------------------------------------------------------------------------------
-- Sets the position of the left.
-- @param prop MOAIProp instance.
-- @param left Position of the left.
--------------------------------------------------------------------------------
function M.setLeft(prop, left)
    local xMin, yMin, zMin, xMax, yMax, zMax = 0, 0, 0, 0, 0, 0
    if prop.getBounds then
        xMin, yMin, zMin, xMax, yMax, zMax = prop:getBounds()
        xMin = math.min(xMin, xMax)
    end
    
    local pivX, pivY, pivZ = prop:getPiv()
    local locX, locY, locZ = prop:getLoc()
    prop:setLoc(left + pivX - xMin, locY, locZ)
end

--------------------------------------------------------------------------------
-- Returns the position of the left.
-- @param prop MOAIProp instance.
-- @return Position of the left.
--------------------------------------------------------------------------------
function M.getLeft(prop)
    local xMin, yMin, zMin, xMax, yMax, zMax = 0, 0, 0, 0, 0, 0
    if prop.getBounds then
        xMin, yMin, zMin, xMax, yMax, zMax = prop:getBounds()
        xMin = math.min(xMin, xMax)
    end
    
    local pivX, pivY, pivZ = prop:getPiv()
    local locX, locY, locZ = prop:getLoc()
    return locX - pivX + xMin
end

--------------------------------------------------------------------------------
-- Sets the position of the right.
-- @param prop MOAIProp instance.
-- @param right Position of the right.
--------------------------------------------------------------------------------
function M.setRight(prop, right)
    local width = M.getWidth(prop)
    M.setLeft(prop, right - width)
end

--------------------------------------------------------------------------------
-- Returns the position of the right.
-- @param prop MOAIProp instance.
-- @return Position of the right.
--------------------------------------------------------------------------------
function M.getRight(prop)
    local left = M.getLeft(prop)
    local width = M.getWidth(prop)
    return left + width
end

--------------------------------------------------------------------------------
-- Sets the position of the top.
-- @param prop MOAIProp instance.
-- @param top Position of the top.
--------------------------------------------------------------------------------
function M.setTop(prop, top)
    local xMin, yMin, zMin, xMax, yMax, zMax = 0, 0, 0, 0, 0, 0
    if prop.getBounds then
        xMin, yMin, zMin, xMax, yMax, zMax = prop:getBounds()
        yMin = math.min(yMin, yMax)
    end
    
    local pivX, pivY, pivZ = prop:getPiv()
    local locX, locY, locZ = prop:getLoc()
    prop:setLoc(locX, top + pivY - yMin, locZ)
end

--------------------------------------------------------------------------------
-- Returns the position of the top.
-- @param prop MOAIProp instance.
-- @return Position of the top.
--------------------------------------------------------------------------------
function M.getTop(prop)
    local xMin, yMin, zMin, xMax, yMax, zMax = 0, 0, 0, 0, 0, 0
    if prop.getBounds then
        xMin, yMin, zMin, xMax, yMax, zMax = prop:getBounds()
        yMin = math.min(yMin, yMax)
    end
    
    local pivX, pivY, pivZ = prop:getPiv()
    local locX, locY, locZ = prop:getLoc()
    return locY - pivY + yMin
end

--------------------------------------------------------------------------------
-- Sets the position of the bottom.
-- @param prop MOAIProp instance.
-- @param bottom Position of the bottom.
--------------------------------------------------------------------------------
function M.setBottom(prop, bottom)
    local height = M.getHeight(prop)
    M.setTop(prop, bottom - height)
end

--------------------------------------------------------------------------------
-- Returns the position of the bottom.
-- @param prop MOAIProp instance.
-- @return Position of the bottom.
--------------------------------------------------------------------------------
function M.getBottom(prop)
    local top = M.getTop(prop)
    local height = M.getHeight(prop)
    return top + height
end

--------------------------------------------------------------------------------
-- Sets the position of the left and top.
-- @param prop MOAIProp
-- @param left Position of the left.
-- @param top Position of the top.
--------------------------------------------------------------------------------
function M.setPos(prop, left, top)
    M.setLeft(prop, left)
    M.setTop(prop, top)
end

--------------------------------------------------------------------------------
-- Returns the position of the left and top.
-- @param prop MOAIProp instance.
-- @return Position of the left and top.
--------------------------------------------------------------------------------
function M.getPos(prop)
    return M.getLeft(prop), M.getTop(prop)
end

--------------------------------------------------------------------------------
-- Returns the width.
-- @param MOAIProp instance.
-- @return width
--------------------------------------------------------------------------------
function M.getWidth(prop)
    local xMin, yMin, zMin, xMax, yMax, zMax = prop:getBounds()
    return math.abs(xMax - xMin)
end

--------------------------------------------------------------------------------
-- Returns the height.
-- @param MOAIProp instance.
-- @return height
--------------------------------------------------------------------------------
function M.getHeight(prop)
    local xMin, yMin, zMin, xMax, yMax, zMax = prop:getBounds()
    return math.abs(yMax - yMin)
end

--------------------------------------------------------------------------------
-- Returns the width and height.
-- @param MOAIProp instance.
-- @return width, height
--------------------------------------------------------------------------------
function M.getSize(prop)
    local xMin, yMin, zMin, xMax, yMax, zMax = prop:getBounds()
    return math.abs(xMax - xMin), math.abs(yMax - yMin)
end

--------------------------------------------------------------------------------
-- Returns the color.
-- @param MOAIProp instance.
-- @return red, green, blue, alpha
--------------------------------------------------------------------------------
function M.getColor(prop)
    local r = prop:getAttr(MOAIColor.ATTR_R_COL)
    local g = prop:getAttr(MOAIColor.ATTR_G_COL)
    local b = prop:getAttr(MOAIColor.ATTR_B_COL)
    local a = prop:getAttr(MOAIColor.ATTR_A_COL)
    return r, g, b, a
end

--------------------------------------------------------------------------------
-- Returns the red.
-- @param MOAIProp instance.
-- @return red
--------------------------------------------------------------------------------
function M.getRed(prop)
    local r = prop:getAttr(MOAIColor.ATTR_R_COL)
    return r
end

--------------------------------------------------------------------------------
-- Sets the red.
-- @param MOAIProp instance.
-- @param red
--------------------------------------------------------------------------------
function M.setRed(prop, red)
    prop:setAttr(MOAIColor.ATTR_R_COL, red)
end

--------------------------------------------------------------------------------
-- Returns the green.
-- @param MOAIProp instance.
-- @return green
--------------------------------------------------------------------------------
function M.getGreen(prop)
    local g = prop:getAttr(MOAIColor.ATTR_G_COL)
    return g
end

--------------------------------------------------------------------------------
-- Sets the green.
-- @param MOAIProp instance.
-- @param green.
--------------------------------------------------------------------------------
function M.setGreen(prop, green)
    prop:setAttr(MOAIColor.ATTR_G_COL, green)
end

--------------------------------------------------------------------------------
-- Returns the blue.
-- @param MOAIProp instance.
-- @return blue
--------------------------------------------------------------------------------
function M.getBlue(prop)
    local b = prop:getAttr(MOAIColor.ATTR_B_COL)
    return b
end

--------------------------------------------------------------------------------
-- Sets the blue.
-- @param MOAIProp instance.
-- @param blue.
--------------------------------------------------------------------------------
function M.setBlue(prop, blue)
    prop:setAttr(MOAIColor.ATTR_B_COL, blue)
end

--------------------------------------------------------------------------------
-- Returns the alpha.
-- @param MOAIProp instance.
-- @return alpha
--------------------------------------------------------------------------------
function M.getAlpha(prop)
    local a = prop:getAttr(MOAIColor.ATTR_A_COL)
    return a
end

--------------------------------------------------------------------------------
-- Sets the alpha.
-- @param MOAIProp instance.
-- @param alpha.
--------------------------------------------------------------------------------
function M.setAlpha(prop, a)
    prop:setAttr(MOAIColor.ATTR_A_COL, a)
end

--------------------------------------------------------------------------------
-- Sets to true visible.
-- @param prop.
--------------------------------------------------------------------------------
function M.show(prop)
    prop:setVisible(true)
end

--------------------------------------------------------------------------------
-- Sets to false visible.
-- @param prop.
--------------------------------------------------------------------------------
function M.hide(prop)
    prop:setVisible(false)
end

return M