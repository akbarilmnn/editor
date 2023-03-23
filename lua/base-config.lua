local set = vim.opt

-- set map leader here before lazy loads...
 vim.g.mapleader = ' '

-- hijack netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("autocmd!")



set.guicursor = ""
set.cursorline = true

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4
set.mouse = 'a'
set.smartindent = true
set.autoindent = true

set.swapfile = false 
set.backup = false


set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.updatetime = 50

set.splitbelow = true
set.splitright = true
set.wrap = false
set.fileencoding = 'utf-8'
set.termguicolors = true 
set.cursorline = true
set.hidden = true
set.number = true
set.guifont = "iosevka:h17"

-- to make clipboard support possible
set.clipboard = "unnamedplus"

vim.o.background = "dark"
