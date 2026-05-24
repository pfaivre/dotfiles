-- Holo Night style for Hyprland

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 16,

    border_size = 1,
    resize_on_border = true,

    col = {
      active_border = 0xddffffff,
      inactive_border = 0x44ffffff,
    },

    layout = "dwindle",
  },

  decoration = {
    dim_inactive = false,
    dim_strength = 0.1,
    dim_around = 0.0,

    rounding = 8,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1,
    inactive_opacity = 1,

    shadow = {
      enabled = true,
      range = 16,
      render_power = 5,
      color = "rgba(aaaaaa03)",
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
    blur = {
      enabled = true,
      size = 6,
      passes = 3,
      vibrancy = 2,
      xray = true,
      noise = 0.08,
      vibrancy_darkness = 0.2,
    },
  },
})

hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0.4, xray = true })
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true, ignore_alpha = 0.4, xray = true; })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, blur_popups = true, ignore_alpha = 0.4, xray = true })
