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
    flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
    background = { light = "latte", dark = "mocha" },
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    transparent_background = false,
    term_colors = true,
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
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

                -- For native lsp configs.
                DiagnosticVirtualTextError = { bg = cp.none },
                DiagnosticVirtualTextWarn = { bg = cp.none },
                DiagnosticVirtualTextInfo = { bg = cp.none },
                DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

                DiagnosticHint = { fg = cp.rosewater },
                LspDiagnosticsDefaultHint = { fg = cp.rosewater },
                LspDiagnosticsHint = { fg = cp.rosewater },
                LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
                LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

                -- ["@field"] = { fg = cp.rosewater },
                -- ["@property"] = { fg = cp.yellow },
                --
                -- ["@include"] = { fg = cp.mauve },
                -- ["@operator"] = { fg = cp.sky },
                -- ["@keyword.operator"] = { fg = cp.mauve },
                -- ["@punctuation.special"] = { fg = cp.maroon },
                --
                -- -- ["@float"] = { fg = cp.peach },
                -- ["@number"] = { fg = cp.peach },
                -- -- ["@boolean"] = { fg = cp.peach },
                --
                -- ["@constructor"] = { fg = cp.lavender },
                -- ["@constant"] = { fg = cp.peach },
                -- -- ["@conditional"] = { fg = cp.mauve },
                -- -- ["@repeat"] = { fg = cp.mauve },
                -- ["@exception"] = { fg = cp.peach },
                --
                -- ["@constant.builtin"] = { fg = cp.lavender },
                -- -- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
                -- ["@type.type"] = { fg = cp.peach, style = { "italic" } },
                -- ["@variable.builtin"] = { fg = cp.red, style = { "italic" } },
                --
                -- -- ["@function"] = { fg = cp.blue },
                -- ["@function.macro"] = { fg = cp.red, style = {} },
                -- ["@parameter"] = { fg = cp.red },
                -- ["@keyword.function"] = { fg = cp.mauve },
                -- ["@keyword"] = { fg = cp.red },
                -- ["@keyword.return"] = { fg = cp.pink, style = {} },
                --
                -- -- ["@text.note"] = { fg = cp.base, bg = cp.blue },
                -- -- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
                -- -- ["@text.danger"] = { fg = cp.base, bg = cp.red },
                -- -- ["@constant.macro"] = { fg = cp.mauve },
                --
                -- -- ["@label"] = { fg = cp.blue },
                -- ["@method"] = { style = { "italic" } },
                -- ["@namespace"] = { fg = cp.yellow, style = {} },
                --
                -- ["@punctuation.delimiter"] = { fg = cp.teal },
                -- ["@punctuation.bracket"] = { fg = cp.overlay2 },
                -- -- ["@string"] = { fg = cp.green },
                -- -- ["@string.regex"] = { fg = cp.peach },
                -- -- ["@type"] = { fg = cp.yellow },
                -- ["@variable"] = { fg = cp.text },
                -- ["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
                -- ["@tag"] = { fg = cp.green },
                -- ["@tag.delimiter"] = { fg = cp.maroon },
                -- ["@text"] = { fg = cp.text },
                --
                -- -- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
                -- -- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
                -- -- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
                -- -- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
                -- -- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
                -- -- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
                -- -- ["@string.escape"] = { fg = cp.pink },
                --
                -- -- ["@property.toml"] = { fg = cp.blue },
                -- -- ["@field.yaml"] = { fg = cp.blue },
                --
                -- -- ["@label.json"] = { fg = cp.blue },
                --
                -- ["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
                -- ["@parameter.bash"] = { fg = cp.yellow, style = { "italic" } },
                --
                -- ["@field.lua"] = { fg = cp.lavender },
                -- ["@constructor.lua"] = { fg = cp.flamingo },
                --
                -- ["@constant.java"] = { fg = cp.teal },
                --
                -- ["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },
                -- -- ["@constructor.typescript"] = { fg = cp.lavender },
                --
                -- -- ["@constructor.tsx"] = { fg = cp.lavender },
                --
                -- ["@tag.attribute.tsx"] = { fg = cp.mauve },
                --
                -- ["@type.css"] = { fg = cp.lavender },
                -- ["@property.css"] = { fg = cp.yellow, style = { "italic" } },
                --
                -- ["@property.cpp"] = { fg = cp.text },
                --
                -- -- ["@symbol"] = { fg = cp.flamingo },
            }
        end,
    },
})

vim.api.nvim_command("colorscheme catppuccin")
