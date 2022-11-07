vim.api.nvim_command([[packadd telescope-fzf-native.nvim]])
local icons = { ui = require("configs.ui.icons").get("ui", true) }

require("telescope").setup({
    defaults = {
        prompt_prefix = " " .. icons.ui.Telescope .. " ",
        selection_caret = icons.ui.ChevronRight,
        entry_prefix = " ",
        scroll_strategy = "limit",
        path_display = { "absolute" },
        layout_config = {
            prompt_position = "bottom",
            horizontal = {
                preview_width = 0.5,
            },
        },
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
        },
        dynamic_preview_title = true,
        vimgrep_arguments = {
            "rg",
            "--ignore",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
    },
})
require("telescope").load_extension("fzf")