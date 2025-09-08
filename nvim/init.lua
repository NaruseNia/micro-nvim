local TAB_WIDTH = 2

-- Global variables --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.guitablabel = "%t"
vim.g.linebreak = "nowrap"

-- Vim options --
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.pumblend = 10
vim.opt.cmdheight = 0
vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Folding --
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Plugins --
require("pack_init")
require("plugins")
require("keymaps")

-- Color scheme --
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme base16-irblack]])
