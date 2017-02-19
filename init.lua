-- My hammerspoon configuration
--
-- Author: Yuhuang Hu
-- Email : duguyue100@gmail.com
-- 
-- This script is inspired by other similar projects.


-- Manage module list

modules_list = {
    "modules/lighting",  -- manage lighting colors
    "modules/utils", -- utility functions
    "modules/launcher", -- launcher for some applications
    "modules/windows", -- manage windows
}

-- Load modules

for i = 1, #modules_list do
    require(modules_list[i])
end

-- Implement a spotlight like chooser that assoicate with commands

local  choices = {
    -- lighting mode
    {
        ["text"] = "Stop Lighting Mode",
        ["subText"] = "Stop the lighting mode if it's on",
        ["cmd_id"] = "stop-lighting",
    },
    {
        ["text"] = "Toggle Lighting Mode",
        ["subText"] = "Toggle the lighting mode if it's on",
        ["cmd_id"] = "toggle-lighting",
    },
    -- Utility functions
    {
        ["text"] = "Reload Configuration",
        ["subText"] = "Reload configuration",
        ["cmd_id"] = "reload-config",
    },
    {
        ["text"] = "Pomodoro Cycle",
        ["subText"] = "Carry out Pomodoro Cycle",
        ["cmd_id"] = "pomodoro-cycle",
    },

}

function make_choice(choice)
    if choice["cmd_id"] == "stop-lighting" then
        stop_lighting()
    elseif choice["cmd_id"] == "toggle-lighting" then
        toggle_lighting()
    elseif choice["cmd_id"] == "reload-config" then
        reload_config()
        hs.notify.new({title="DGYHS", informativeText="Configuration Loaded."}):send()
    elseif choice["cmd_id"] == "pomodoro-cycle" then
        pomodoro_cycle()
    end
end


local cmd_chooser = hs.chooser.new(make_choice)

cmd_chooser:searchSubText(true)
cmd_chooser:choices(choices)
cmd_chooser:rows(10)
cmd_chooser:bgDark(true)

hs.hotkey.bind({"cmd"}, "E", function() cmd_chooser:show() end)
