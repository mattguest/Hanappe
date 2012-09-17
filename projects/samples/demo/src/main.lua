-- import
local config        = require "config"
local global        = require "global"
local Application   = require "hp/core/Application"
local SceneManager  = require "hp/manager/SceneManager"


print("viewSize", MOAIGfxDevice.getViewSize())

for k, v in pairs(getmetatable(MOAIEnvironment)) do
    print(k .. " = " .. tostring(v))
end

-- Application start.
Application:start(config)

-- If you are using the SceneManager.
SceneManager:openScene(config.mainScene)

MOAISim.setStep ( 1 / 60 )
MOAISim.clearLoopFlags ()
MOAISim.setLoopFlags ( MOAISim.SIM_LOOP_ALLOW_BOOST )
MOAISim.setLoopFlags ( MOAISim.SIM_LOOP_LONG_DELAY )
MOAISim.setBoostThreshold ( 0 )