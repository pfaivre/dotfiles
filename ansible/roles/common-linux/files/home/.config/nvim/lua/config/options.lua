-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = true

opt.relativenumber = false -- Relative line numbers
opt.ruler = true -- The default ruler
opt.smoothscroll = false
opt.spelllang = { "en", "fr" }
opt.tabstop = 4 -- Number of spaces tabs count for
opt.winminwidth = 16 -- Minimum window width