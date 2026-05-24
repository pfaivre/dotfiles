-- #  _                      _                 _
-- # | |__  _   _ _ __  _ __| | __ _ _ __   __| |
-- # | '_ \| | | | '_ \| '__| |/ _` | '_ \ / _` |
-- # | | | | |_| | |_) | |  | | (_| | | | | (_| |
-- # |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
-- #        |___/|_|
-- #


-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ―――― Input ―――――――――――――――――――――――――――――――――――――――――――――――――――――
-- ////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- # More settings at https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input = {
    kb_layout  = "fr",  -- Available layouts and variants can be found in /usr/share/X11/xkb/rules/base.lst
    kb_variant = "",
    kb_model   = "",
    kb_options = "",
    kb_rules   = "",
    numlock_by_default = true,

    follow_mouse = 1,
    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    left_handed = false,

    touchpad = {
      disable_while_typing = true,
      natural_scroll = true,       -- Inverts scrolling direction. When enabled, scrolling moves content directly, rather than manipulating a scrollbar.
      scroll_factor = 0.7,         -- Multiplier applied to the amount of scroll movement.
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- Per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/

-- This touchpad from Logitech does not register itself as a touchpad, let's configure it separately
hl.device({
  name           = "logitech-k400-plus-1",
  natural_scroll = true,
  scroll_factor = 0.7,
})
