local opt = vim.opt
local g = vim.g
g.vim_version = vim.version().minor

if g.vim_version < 8 then
    g.did_load_filetypes = 0
    g.do_filetype_lua = 1
end

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
opt.relativenumber = true
opt.numberwidth = 1
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
opt.undofile = true

opt.timeoutlen = 400
opt.updatetime = 300

opt.cmdheight = 0
opt.laststatus = 3

-- Disable builtins to improve startup times
local default_plugins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "matchparen",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "syntax",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
    "archlinux",

    "fzf",
}

for _, plugin in pairs(default_plugins) do
    g["loaded_" .. plugin] = 1
end

-- Disable neovim default providers
local default_providers = {
    "node",
    "perl",
    "python3",
    "ruby",
}

for _, provider in ipairs(default_providers) do
    g["loaded_" .. provider .. "_provider"] = 0
end
