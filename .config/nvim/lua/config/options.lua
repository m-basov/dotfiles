vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt

vim.schedule(function() opt.clipboard = "unnamedplus" end)

opt.updatetime = 250
opt.timeoutlen = 300

opt.scrolloff = 10

opt.mouse = "a"
opt.termguicolors = true
opt.showmode = false
opt.confirm = true

opt.winborder = "rounded"
opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.expandtab = true
opt.shiftwidth = 2

opt.splitbelow = true
opt.splitright = true
