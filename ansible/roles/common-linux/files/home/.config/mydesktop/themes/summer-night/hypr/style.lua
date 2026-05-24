-- Summer night style for Hyprland

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 18,

    border_size = 3,
    resize_on_border = true,

    col = {
      active_border = 0XFFD3C6AA,
      inactive_border = 0XFF56635F,
    },

    layout = "dwindle",
  },

  decoration = {
    dim_inactive = false,
    dim_strength = 0.1,
    dim_around = 0.0,

    rounding = 12,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1,
    inactive_opacity = 1,

    shadow = {
      enabled = true,
      range = 0,
      render_power = 4,
      offset = { 0, 5 },
      -- scale = 0.95,
      sharp = true,
      color = 0xFF7D6A40,
      color_inactive = 0xFF2D353B,
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
    blur = {
      enabled = false,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
})
