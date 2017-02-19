-- Windows Management as Spectacle
--
-- Author: Yuhuang Hu
-- Email : duguyue100@gmail.com


-- taken from ashfinal/awesome-hammerspoon
function resize_win(direction)
    local win = hs.window.focusedWindow()
    if win then
        local f = win:frame()
        local screen = win:screen()
        local max = screen:fullFrame()
        local stepw = max.w/30
        local steph = max.h/30
        if direction == "right" then f.w = f.w+stepw end
        if direction == "left" then f.w = f.w-stepw end
        if direction == "up" then f.h = f.h-steph end
        if direction == "down" then f.h = f.h+steph end
        if direction == "halfright" then f.x = max.w/2 f.y = 0 f.w = max.w/2 f.h = max.h end
        if direction == "halfleft" then f.x = 0 f.y = 0 f.w = max.w/2 f.h = max.h end
        if direction == "halfup" then f.x = 0 f.y = 0 f.w = max.w f.h = max.h/2 end
        if direction == "halfdown" then f.x = 0 f.y = max.h/2 f.w = max.w f.h = max.h/2 end
        if direction == "cornerNE" then f.x = max.w/2 f.y = 0 f.w = max.w/2 f.h = max.h/2 end
        if direction == "cornerSE" then f.x = max.w/2 f.y = max.h/2 f.w = max.w/2 f.h = max.h/2 end
        if direction == "cornerNW" then f.x = 0 f.y = 0 f.w = max.w/2 f.h = max.h/2 end
        if direction == "cornerSW" then f.x = 0 f.y = max.h/2 f.w = max.w/2 f.h = max.h/2 end
        if direction == "center" then f.x = (max.w-f.w)/2 f.y = (max.h-f.h)/2 end
        if direction == "fcenter" then f.x = stepw*5 f.y = steph*5 f.w = stepw*20 f.h = steph*20 end
        if direction == "fullscreen" then f = max end
        if direction == "shrink" then f.x = f.x+stepw f.y = f.y+steph f.w = f.w-(stepw*2) f.h = f.h-(steph*2) end
        if direction == "expand" then f.x = f.x-stepw f.y = f.y-steph f.w = f.w+(stepw*2) f.h = f.h+(steph*2) end
        if direction == "mright" then f.x = f.x+stepw end
        if direction == "mleft" then f.x = f.x-stepw end
        if direction == "mup" then f.y = f.y-steph end
        if direction == "mdown" then f.y = f.y+steph end
        if direction == "throwLeft" then win:moveOneScreenWest() end
        if direction == "throwRight" then win:moveOneScreenEast() end
        win:setFrame(f)
    else
        hs.alert.show("No focused window!")
    end
end

-- resize half left
hs.hotkey.bind({"alt", "cmd"}, "Left", function() resize_win("halfleft") end)
-- resize half right 
hs.hotkey.bind({"alt", "cmd"}, "Right", function() resize_win("halfright") end)
-- resize half up 
hs.hotkey.bind({"alt", "cmd"}, "Up", function() resize_win("halfup") end)
-- resize half down 
hs.hotkey.bind({"alt", "cmd"}, "Down", function() resize_win("halfdown") end)
-- recenter
hs.hotkey.bind({"alt", "cmd"}, "M", function() resize_win("center") end)
-- move left 
hs.hotkey.bind({"alt", "cmd"}, "H", function() resize_win("mleft") end)
-- move right 
hs.hotkey.bind({"alt", "cmd"}, "L", function() resize_win("mright") end)
-- move up 
hs.hotkey.bind({"alt", "cmd"}, "J", function() resize_win("mdown") end)
-- move up 
hs.hotkey.bind({"alt", "cmd"}, "K", function() resize_win("mup") end)
-- fullscreen 
hs.hotkey.bind({"cmd"}, "1", function() resize_win("fullscreen") end)
-- maker larger 
hs.hotkey.bind({"alt", "cmd"}, "2", function() resize_win("expand") end)
-- maker smaller 
hs.hotkey.bind({"alt", "cmd"}, "3", function() resize_win("shrink") end)
-- throw left 
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Left", function() resize_win("throwLeft") end)
-- throw right 
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Right", function() resize_win("throwRight") end)
