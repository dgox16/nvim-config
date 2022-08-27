local opt = vim.opt
local g = vim.g
g.vim_version = vim.version().minor

if g.vim_version < 8 then
    g.did_load_filetypes = 0
    g.do_filetype_lua = 1
end

opt.clipboard = "unnamedplus"
opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.smartcase = true
opt.smartcase = true
opt.mouse = "a"

opt.number = true
opt.numberwidth = 2
opt.ruler = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.completeopt = "menu,menuone,noselect"
opt.swapfile = false
opt.fileencoding = "utf-8"
opt.termguicolors = true
opt.hidden = true
opt.wrap = true
opt.number = true
opt.linebreak = true
opt.numberwidth = 5
opt.undofile = true

opt.timeoutlen = 400
opt.updatetime = 300

require("impatient").enable_profile()

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
