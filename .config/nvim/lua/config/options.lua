vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt

vim.schedule(function() opt.clipboard = "unnamedplus" end)

opt.list = true
opt.updatetime = 250

opt.scrolloff = 10

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
  diff = "╱",
}

opt.ignorecase = true
opt.smartcase = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.expandtab = true
opt.shiftwidth = 4

opt.splitbelow = true
opt.splitright = true
