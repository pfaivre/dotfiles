--  _                      _                 _
-- | |__  _   _ _ __  _ __| | __ _ _ __   __| |
-- | '_ \| | | | '_ \| '__| |/ _` | '_ \ / _` |
-- | | | | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
--


TERMINAL     = "alacritty"
FILE_MANAGER = "thunar"
MENU         = "pkill rofi; rofi -show drun -show-icons"


-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ―――― Autostart ―――――――――――――――――――――――――――――――――――――――――――――――――
-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

hl.on("hyprland.start", function ()
  -- Start with visible stuff:
  hl.exec_cmd("systemctl --user start hyprpaper")                                    -- Wallpaper
  hl.exec_cmd("waybar -s ~/.config/mydesktop/current-theme/waybar/style.css")        -- Task bar
  hl.exec_cmd("python3 ~/.local/bin/configure-hyprsunset.py --lat 48.85 --lon 2.35") -- Create the blue light filter config (Paris, France)
  hl.exec_cmd("systemctl --user start hyprsunset")                                   -- Blue light filter

  -- Then finish with background things:
  hl.exec_cmd("nm-applet") -- NetworkManager
  hl.exec_cmd("swaync --style ~/.config/mydesktop/current-theme/swaync/style.css --config ~/.config/mydesktop/current-theme/swaync/config.json") -- Notification daemon
  hl.exec_cmd("~/.local/bin/first-run.sh") -- First run config set-up and greetings
  hl.exec_cmd("systemctl --user start hyprpolkitagent") -- Authentication agent, allows user to gain priviledge when needed
  hl.exec_cmd("systemctl --user start hypridle") -- Idle manager
  hl.exec_cmd("ddccontrol -r 0x10 -W 0 dev:/dev/i2c-4") -- First call to ddccontrol takes a few seconds, so let's make it on startup
end)


-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ―――― Environment variables ―――――――――――――――――――――――――――――――――――――
-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ―――― Look and feel ―――――――――――――――――――――――――――――――――――――――――――――
-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

hl.config({
  -- See https://wiki.hypr.land/Configuring/Basics/Variables/#general
  general = {
    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing = false,

    layout = "dwindle",
  },

  -- See https://wiki.hypr.land/Configuring/Basics/Variables/#misc
  misc = {
    force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(

    -- controls the VRR (Adaptive Sync) of your monitors. 0 - off, 1 - on, 2 - fullscreen only, 3 - fullscreen with video or game content type [0/1/2/3]
    vrr = false,

    -- If true, the config will not reload automatically on save, and instead needs to be reloaded with hyprctl reload. Might save on battery.
    disable_autoreload = false,
  },

  -- See https://wiki.hypr.land/Configuring/Basics/Variables/#cursor
  cursor = {
    -- if true, will not warp the cursor in many cases (focusing, keybinds, etc)
    no_warps = 1,

    -- the factor to zoom by around the cursor. Like a magnifying glass. Minimum 1.0 (meaning no zoom)
    zoom_factor = 1,
    zoom_disable_aa = true,
  },

  -- See https://wiki.hypr.land/Configuring/Basics/Variables/#gestures
  gestures = {
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true, -- if enabled, the split (side/top) will not change regardless of what happens to the container.
  },
})


-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ―――― Animations ――――――――――――――――――――――――――――――――――――――――――――――――
-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1   }, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0,    0   }, {1,    1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5,  0.5 }, {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0   }, {0.1,  1} } })
hl.curve("easeOutExpo",    { type = "bezier", points = { {0.16, 1   }, {0.3,  1} } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 50, dampening = 15 })

hl.animation({ leaf = "global",              enabled = 0, speed =  1,   bezier =  "default" })
hl.animation({ leaf = "windows",             enabled = 0, speed =  3,   bezier =  "easeOutQuint" })
hl.animation({ leaf = "windowsIn",           enabled = 0, speed =  4,   bezier =  "easeOutQuint",   style = "popin 87%" })
hl.animation({ leaf = "windowsOut",          enabled = 0, speed =  1,   bezier =  "linear",         style = "popin 87%" })
hl.animation({ leaf = "windowsMove",         enabled = 0, speed =  3,   bezier =  "easeOutQuint" })
hl.animation({ leaf = "fade",                enabled = 0, speed =  3,   bezier =  "quick" })
hl.animation({ leaf = "fadeIn",              enabled = 0, speed =  1,   bezier =  "almostLinear" })
hl.animation({ leaf = "fadeOut",             enabled = 0, speed =  1,   bezier =  "almostLinear" })
hl.animation({ leaf = "fadeSwitch",          enabled = 0, speed =  1,   bezier =  "almostLinear" })
hl.animation({ leaf = "fadeShadow",          enabled = 0, speed =  1,   bezier =  "almostLinear" })
hl.animation({ leaf = "fadeDim",             enabled = 1, speed =  1,   bezier =  "almostLinear" })
hl.animation({ leaf = "fadeLayers",          enabled = 0, speed =  1,   bezier =  "almostLinear" })
hl.animation({ leaf = "fadeLayersIn",        enabled = 0, speed =  1,   bezier =  "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",       enabled = 0, speed = 20,   bezier =  "almostLinear" })
hl.animation({ leaf = "fadePopups",          enabled = 0, speed =  1,   bezier =  "easeOutExpo" })
hl.animation({ leaf = "fadePopupsIn",        enabled = 0, speed =  1,   bezier =  "easeOutExpo" })
hl.animation({ leaf = "fadePopupsOut",       enabled = 0, speed =  1,   bezier =  "easeOutExpo" })
hl.animation({ leaf = "fadeDpms",            enabled = 1, speed = 32,   bezier =  "easeOutExpo" })
hl.animation({ leaf = "border",              enabled = 0, speed =  8,   bezier =  "easeOutQuint" })
hl.animation({ leaf = "borderangle",         enabled = 0, speed = 10,   bezier =  "almostLinear" })
hl.animation({ leaf = "workspaces",          enabled = 0, speed =  1,   spring =  "easy",           style = "slide" })
hl.animation({ leaf = "workspacesIn",        enabled = 0, speed =  1,   spring =  "easy",           style = "slide" })
hl.animation({ leaf = "workspacesOut",       enabled = 0, speed =  1,   spring =  "easy",           style = "slide" })
hl.animation({ leaf = "specialWorkspace",    enabled = 0, speed =  2,   bezier =  "easeOutExpo",    style = "slide" })
hl.animation({ leaf = "specialWorkspaceIn",  enabled = 0, speed =  2,   bezier =  "easeOutExpo",    style = "slide" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = 0, speed =  2,   bezier =  "easeOutExpo",    style = "slide" })
hl.animation({ leaf = "zoomFactor",          enabled = 1, speed =  5,   bezier =  "easeOutQuint" })
hl.animation({ leaf = "monitorAdded",        enabled = 1, speed =  5,   bezier =  "easeOutQuint" })
hl.animation({ leaf = "layers",              enabled = 1, speed =  3.8, bezier =  "easeOutQuint",   style = "slide" })
hl.animation({ leaf = "layersIn",            enabled = 1, speed =  6,   bezier =  "easeOutExpo",    style = "slide left" })
hl.animation({ leaf = "layersOut",           enabled = 0, speed =  6,   bezier =  "easeOutExpo",    style = "slide right" })


-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ―――― Windows and layers ――――――――――――――――――――――――――――――――――――――――
-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Volume control window is floating
hl.window_rule({
  name = "pavucontrol",
  match = {
    class = "org.pulseaudio.pavucontrol"
  },
  float = true,
  size = {960, 600}
})

-- Custom "Popup" class is floating
hl.window_rule({ match = { class = "Popup" }, float = true, size = {960, 600} })

-- Gimp windows are floating
hl.window_rule({ match = { class = "file-png" }, float = true })
hl.window_rule({ match = { class = "file-jpeg" }, float = true })
hl.window_rule({ match = { class = "file-gif-export" }, float = true })
hl.window_rule({ match = { class = "script-fu" }, float = true })
hl.window_rule({ match = { class = "print" }, float = true })

-- Some Gnome utilities are floating
hl.window_rule({ match = { class = "org.gnome.FileRoller" }, float = true })
hl.window_rule({ match = { class = "org.gnome.Loupe" }, float = true, content = "photo" })
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })
hl.window_rule({ match = { class = "nvidia-settings" }, float = true })

hl.window_rule({ match = { title = "Opération sur des fichiers en cours" }, float = true })

-- Firefox picture in picture in the bottom right on all workspaces
hl.window_rule({
  name = "firefox-pip",
  match = {
    title = "Incrustation vidéo"
  },
  float = true,
  move = {"(monitor_w-window_w-12)", "(monitor_h-window_h-60)"},
  size = {408, 230},
  content = "video",
  pin = true
})

-- No border on Audacious' windows
hl.window_rule({ match = { class = "Audacious" }, border_size = 0, rounding = 8 })

-- Disable animations for some layers
hl.layer_rule({ match = { namespace = "rofi" }, no_anim = true })
hl.layer_rule({ match = { namespace = "logout_dialog" }, no_anim = true })
hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, no_anim = true })
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true }) -- Hyprshot selection layer

-- Animate notifications with a slide from the right
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, animation = "slidevert right" })


package.path = os.getenv("HOME") .. '/.config/mydesktop/current-theme/hypr/?.lua;' .. package.path
require("style")
require("keybindings")
require("monitors")
require("input")
