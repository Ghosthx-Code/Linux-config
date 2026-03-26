-- 1. BOOTSTRAP (Self-installs plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 2. COLORS & VISUALS
vim.opt.termguicolors = true       -- Enable 24-bit RGB color
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Relative line numbers
vim.cmd.colorscheme "catppuccin"   -- Set your theme name here

-- 3. FONT & FONT SIZE (For GUI only)
-- NOTE: If using terminal, change font in Terminal Preferences (Ctrl+Shift+P)
vim.opt.guifont = "JetBrainsMono_Nerd_Font:h12" 

-- 4. COMMANDS & KEYMAPS (Your custom shortcuts)
vim.g.mapleader = " "              -- Set Space as your leader key
local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")    -- Space + w to Save
map("n", "<leader>q", ":q<CR>")    -- Space + q to Quit
map("n", "<leader>e", ":Lex 30<CR>") -- Space + e to toggle File Explorer

-- 5. PLUGINS LIST
require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
  "nvim-lualine/lualine.nvim",      -- Status bar at bottom
})
