vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd([[
  au BufRead,BufNewFile *Dockerfile set filetype=dockerfile
]])
