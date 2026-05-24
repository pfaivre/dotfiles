-- Bliss-XP inspired style for Hyprland

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 18,

    border_size = 4,
    resize_on_border = true,

    col = {
      active_border = "0xff166aee",
      inactive_border = "0xff8EB6D9",
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
      enabled = false,
      range = 3,
      render_power = 5,
      color = "rgba(2e3538ff)",
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
