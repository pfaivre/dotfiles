-- Cards Day style for Hyprland

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 18,

    border_size = 2,
    resize_on_border = true,

    col = {
      active_border = "0xff5c5952",
      inactive_border = "0xff5c5952",
    },

    layout = "dwindle",
  },

  decoration = {
    dim_inactive = false,
    dim_strength = 0.05,
    dim_around = 0.0,

    rounding = 4,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1,
    inactive_opacity = 1,

    shadow = {
      enabled = true,
      range = 0,
      render_power = 4,
      offset = { 5, 5 },
      -- scale = 0.95,
      sharp = true,
      color = "rgba(2e353855)",
      -- color_inactive = rgba(2e3538ff),
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
