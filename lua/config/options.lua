local opt = vim.opt
    
opt.tabstop = 2 
opt.shiftwidth = 4
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false


opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = '197'
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.completeopt = "menuone,noinsert,noselect"

opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"


opt.foldmethod = "syntax"
opt.foldlevel = 99
vim.o.winbar = "%{%v:lua.require('util.winbar').get_winbar()%}"
vim.api.nvim_set_hl(0, "Winbar", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "NONE" })
