local present, catppuccin_setting = pcall(require, "catppuccin")
if not present then
    return
end

local colors = require("catppuccin.palettes").get_palette()
local ucolors = require("catppuccin.utils.colors")
local telescope_prompt = ucolors.darken(colors.crust, 0.95, "#000000")
local telescope_results = ucolors.darken(colors.mantle, 0.95, "#000000")
local telescope_text = colors.text
local telescope_prompt_title = colors.yellow
local telescope_preview_title = colors.green

catppuccin_setting.setup({
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    transparent_background = false,
    term_colors = false,
    compile = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        coc_nvim = false,
        lsp_trouble = true,
        cmp = true,
        lsp_saga = true,
        gitgutter = false,
        gitsigns = true,
        leap = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        neotree = {
            enabled = false,
            show_root = true,
            transparent_panel = false,
        },
        dap = {
            enabled = false,
            enable_ui = false,
        },
        which_key = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = true,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = true,
        hop = false,
        notify = true,
        telekasten = true,
        symbols_outline = true,
        mini = false,
        aerial = false,
        vimwiki = true,
        beacon = true,
        navic = false,
        overseer = false,
    },
    color_overrides = {},
    highlight_overrides = {
        all = {
            LeapBackdrop = { fg = colors.overlay0 },
            Comment = { fg = colors.overlay0 },
            TelescopeBorder = { bg = telescope_results, fg = telescope_results },
            TelescopePromptBorder = { bg = telescope_prompt, fg = telescope_prompt },
            TelescopePromptCounter = { fg = telescope_text },
            TelescopePromptNormal = { fg = telescope_text, bg = telescope_prompt },
            TelescopePromptPrefix = { fg = telescope_prompt_title, bg = telescope_prompt },
            TelescopePromptTitle = { fg = telescope_prompt, bg = telescope_prompt_title },
            TelescopePreviewTitle = { fg = telescope_results, bg = telescope_preview_title },
            TelescopePreviewBorder = {
                bg = ucolors.darken(telescope_results, 0.95, "#000000"),
                fg = ucolors.darken(telescope_results, 0.95, "#000000"),
            },
            TelescopePreviewNormal = {
                bg = ucolors.darken(telescope_results, 0.95, "#000000"),
                fg = telescope_results,
            },
            TelescopeResultsTitle = { fg = telescope_results, bg = telescope_preview_title },
            TelescopeMatching = { fg = telescope_prompt_title },
            TelescopeNormal = { bg = telescope_results },
            TelescopeSelection = { bg = telescope_prompt },
            TelescopeSelectionCaret = { fg = telescope_text },
            TelescopeResultsNormal = { bg = telescope_results },
            TelescopeResultsBorder = { bg = telescope_results, fg = telescope_results },
        },
    },
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd([[colorscheme catppuccin]])
