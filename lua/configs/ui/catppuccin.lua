local present, catppuccin_setting = pcall(require, "catppuccin")

if not present then
    return
end

local colors = require("catppuccin.palettes").get_palette()
local ucolors = require("catppuccin.utils.colors")
local telescope_prompt = ucolors.darken(colors.crust, 0.95, "#000000")
local telescope_results = ucolors.darken(colors.mantle, 0.95, "#000000")
local telescope_text = colors.text
local telescope_prompt_title = colors.pink
local telescope_preview_title = colors.teal

catppuccin_setting.setup({
    flavour = "mocha",
    styles = {
        comments = { "italic" },
        properties = { "italic" },
        functions = { "italic", "bold" },
        keywords = { "italic" },
        operators = { "bold" },
        conditionals = { "bold" },
        loops = { "bold" },
        booleans = { "bold", "italic" },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
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
        lsp_trouble = true,
        cmp = true,
        lsp_saga = true,
        gitsigns = true,
        telescope = true,
        hop = true,
        mason = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        bufferline = true,
        markdown = true,
        ts_rainbow = true,
        neotree = true,
    },
    highlight_overrides = {
        mocha = function(cp)
            return {
                HopNextKey = { fg = cp.yellow, style = { "bold" } },
                HopNextKey1 = { fg = cp.blue, style = { "bold" } },
                HopNextKey2 = { fg = cp.teal, style = { "bold", "italic" } },
                HopUnmatched = { fg = cp.overlay0 },
                Comment = { fg = colors.overlay1, style = { "italic" } },
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
                -- For base configs.
                CursorLineNr = { fg = cp.green },
                LineNr = { fg = cp.overlay2 },
                Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
                IncSearch = { bg = cp.pink, fg = cp.surface1 },

                CmpItemAbbr = { fg = cp.text },
                CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
            }
        end,
    },
})

vim.cmd.colorscheme("catppuccin")
