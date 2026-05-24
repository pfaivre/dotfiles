--  _                      _                 _
-- | |__  _   _ _ __  _ __| | __ _ _ __   __| |
-- | '_ \| | | | '_ \| '__| |/ _` | '_ \ / _` |
-- | | | | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
-- 


-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ―――― KEYBINDINGS ―――――――――――――――――――――――――――――――――――――――――――――――
-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- # See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind("CTRL + ALT + T",       hl.dsp.exec_raw(TERMINAL))
hl.bind(mainMod .. " + Return",       hl.dsp.exec_raw(TERMINAL))
hl.bind(mainMod .. " + ESCAPE",       hl.dsp.exec_raw("~/.local/bin/command-palette.sh"))
hl.bind(mainMod .. " + space",        hl.dsp.exec_raw(MENU))
hl.bind(mainMod .. " + E",            hl.dsp.exec_raw(FILE_MANAGER))
hl.bind(mainMod .. " + semicolon",    hl.dsp.exec_raw("~/.local/bin/select-emoji-fr.sh"))
hl.bind(mainMod .. " + M",            hl.dsp.exec_raw("pkill wlogout; wlogout --css ~/.config/mydesktop/current-theme/wlogout/style.css -b 4"))
hl.bind(mainMod .. " + L",            hl.dsp.exec_raw("loginctl lock-session"))
hl.bind(mainMod .. " + CTRL + space", hl.dsp.exec_raw("python3 ~/.local/bin/set-wallpaper.py next"))
hl.bind(mainMod .. " + DELETE",       hl.dsp.window.kill())
hl.bind(mainMod .. " + left",         hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",        hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",           hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",         hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + V", function()
  hl.dispatch(hl.dsp.window.float())
  hl.dispatch(hl.dsp.window.resize({ x= 1080, y = 620 }))
  hl.dispatch(hl.dsp.window.center())
end)
hl.bind(mainMod .. " + P",            hl.dsp.window.pseudo())
hl.bind("PRINT",                      hl.dsp.exec_raw("hyprshot -m output"))
hl.bind("SHIFT + PRINT",              hl.dsp.exec_raw("hyprshot -m window"))

-- Move to a workspace (AZERTY keyboard)
hl.bind(mainMod .. " + ampersand",            hl.dsp.focus({ workspace =   "1" }))
hl.bind(mainMod .. " + eacute",               hl.dsp.focus({ workspace =   "2" }))
hl.bind(mainMod .. " + quotedbl",             hl.dsp.focus({ workspace =   "3" }))
hl.bind(mainMod .. " + apostrophe",           hl.dsp.focus({ workspace =   "4" }))
hl.bind(mainMod .. " + parenleft",            hl.dsp.focus({ workspace =   "5" }))
hl.bind(mainMod .. " + minus",                hl.dsp.focus({ workspace =   "6" }))
hl.bind(mainMod .. " + egrave",               hl.dsp.focus({ workspace =   "7" }))
hl.bind(mainMod .. " + underscore",           hl.dsp.focus({ workspace =   "8" }))
hl.bind(mainMod .. " + ccedilla",             hl.dsp.focus({ workspace =   "9" }))
hl.bind(mainMod .. " + agrave",               hl.dsp.focus({ workspace =  "10" }))
hl.bind(mainMod .. " + CTRL + left",          hl.dsp.focus({ workspace =  "-1" }))
hl.bind(mainMod .. " + CTRL + right",         hl.dsp.focus({ workspace =  "+1" }))
-- hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "e-1" }))

-- Send window to a workspace (AZERTY keyboard)
hl.bind(mainMod .. " + SHIFT + ampersand",    hl.dsp.window.move({ workspace =  "1" }))
hl.bind(mainMod .. " + SHIFT + eacute",       hl.dsp.window.move({ workspace =  "2" }))
hl.bind(mainMod .. " + SHIFT + quotedbl",     hl.dsp.window.move({ workspace =  "3" }))
hl.bind(mainMod .. " + SHIFT + apostrophe",   hl.dsp.window.move({ workspace =  "4" }))
hl.bind(mainMod .. " + SHIFT + parenleft",    hl.dsp.window.move({ workspace =  "5" }))
hl.bind(mainMod .. " + SHIFT + minus",        hl.dsp.window.move({ workspace =  "6" }))
hl.bind(mainMod .. " + SHIFT + egrave",       hl.dsp.window.move({ workspace =  "7" }))
hl.bind(mainMod .. " + SHIFT + underscore",   hl.dsp.window.move({ workspace =  "8" }))
hl.bind(mainMod .. " + SHIFT + ccedilla",     hl.dsp.window.move({ workspace =  "9" }))
hl.bind(mainMod .. " + SHIFT + agrave",       hl.dsp.window.move({ workspace = "10" }))
hl.bind(mainMod .. " + CTRL + SHIFT + left",  hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ workspace = "+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272",      hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",      hl.dsp.window.resize(), { mouse = true })

-- Adjut screen brightness through ddccontrol
hl.bind("CONTROL + SHIFT + PAGE_UP",    hl.dsp.exec_raw("ddccontrol -r 0x10 -W 10 dev:/dev/i2c-4"))
hl.bind("CONTROL + SHIFT + PAGE_DOWN",  hl.dsp.exec_raw("ddccontrol -r 0x10 -W -10 dev:/dev/i2c-4"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_raw("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_raw("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_raw("brightnessctl s 10%+"),                           { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_raw("brightnessctl s 10%-"),                           { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_raw("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_raw("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_raw("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_raw("playerctl previous"),   { locked = true })
