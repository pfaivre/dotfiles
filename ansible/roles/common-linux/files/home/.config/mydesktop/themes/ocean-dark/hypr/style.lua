-- Base64-ocean inspired style for Hyprland

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 18,

    border_size = 4,
    resize_on_border = true,

    col = {
      active_border = "0xff90a0ab",
      inactive_border = "0xff42535f",
    },

    layout = "dwindle",
  },

  decoration = {
    dim_inactive = false,
    dim_strength = 0.1,
    dim_around = 0.0,

    rounding = 0,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1,
    inactive_opacity = 1,

    shadow = {
      enabled = true,
      range = 3,
      render_power = 5,
      color = "rgba(2e3538ff)",
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
    blur = {
      enabled = false,
      size = 8,
      passes = 2,
      vibrancy = 0.5,
    },
  },
})
