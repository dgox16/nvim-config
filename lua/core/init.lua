local disable_distribution_plugins = function()
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
        vim.g["loaded_" .. plugin] = 1
    end
end

local disable_providers = function()
    local default_providers = {
        "node",
        "perl",
        "python3",
        "ruby",
    }

    for _, provider in ipairs(default_providers) do
        vim.g["loaded_" .. provider .. "_provider"] = 0
    end
end

local leader_map = function()
    vim.api.nvim_set_keymap("n", "<Space>", "", { noremap = true })
    vim.api.nvim_set_keymap("x", "<Space>", "", { noremap = true })
    vim.g.maplocalleader = " "
    vim.g.mapleader = " "
end

local load_core = function()
    disable_distribution_plugins()
    disable_providers()
    leader_map()

    require("core.events")
    require("core.options")
    require("core.keymappings")

    vim.api.nvim_command([[colorscheme catppuccin]])
end

load_core()
