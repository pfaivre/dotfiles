return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    -- you can do it like this with a config function
    config = function()
      require("catppuccin").setup {
        -- configurations
        flavour = "latte",
        transparent_background = false
      }
    end,
    -- -- or just use opts table
    -- opts = {
    --   -- configurations
    -- },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}