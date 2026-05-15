--  _                      _                 _
-- | |__  _   _ _ __  _ __| | __ _ _ __   __| |
-- | '_ \| | | | '_ \| '__| |/ _` | '_ \ / _` |
-- | | | | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
-- 


-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ―――― MONITORS ――――――――――――――――――――――――――――――――――――――――――――――――――
-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- # More info at https://wiki.hypr.land/Configuring/Basics/Monitors/
-- # Use the command `hyprctl monitors` to list the monitors

hl.monitor({output = "", mode = "preferred", position = "auto", scale = "auto"})

-- # Examples:

-- hl.monitor({output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = 1})
-- hl.monitor({output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1})

-- hl.monitor({output = "DP-1", mode = "1920x1080@60", position = "0x0", scale = 1})
-- hl.monitor({output = "DP-2", mode = "1920x1080@60", position = "1920x0", scale = 1})
