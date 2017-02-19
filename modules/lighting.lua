-- Lighting mode as f.lux
--
-- Author: Yuhuang Hu
-- Email : duguyue100@gmail.com

-- Lighting support

local color_temp = 3400
local night_start = "19:00"
local night_end = "8:00"
local transition = hs.timer.hours(3)
local invert_at_night = false
local wf_redshift=hs.window.filter.new({VLC={focused=true},Photos={focused=true},loginwindow={visible=true,allowRoles='*'}},'wf-redshift')
local day_color_temp = 6500

-- Lighting profile

hs.redshift.start(color_temp, night_start, night_end, transition, invert_at_night, wf_redshift, day_color_temp)

-- stop lighting mode

function stop_lighting()
    hs.redshift.stop()
end

-- toggle_lighting

function toggle_lighting()
    hs.redshift.toggle()
end

