-- My hammerspoon configuration
--
-- Author: Yuhuang Hu
-- Email : duguyue100@gmail.com
-- 
-- This script is inspired by other similar projects.


-- Manage module list

modules_list = {
    "modules/lighting.lua",  -- manage lighting colors
}

-- Load modules

for i = 1, #modules_list do
    require(modules_list[i])
end
