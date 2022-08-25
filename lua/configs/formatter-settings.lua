local present, formatter = pcall(require, "formatter")
if not present then
    return
end

local util = require("formatter.util")
local prettier = function()
    return {
        exe = "prettier",
        args = { "--tab-width 4", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
        stdin = true,
    }
end

formatter.setup({
    logging = false,
    log_level = vim.log.levels.WARN,
    filetype = {
        typescriptreact = { prettier },
        javascriptreact = { prettier },
        javascript = { prettier },
        typescript = { prettier },
        json = { prettier },
        jsonc = { prettier },
        html = { prettier },
        css = { prettier },
        scss = { prettier },
        graphql = { prettier },
        markdown = { prettier },
        vue = { prettier },
        lua = {
            require("formatter.filetypes.lua").stylua,
            function()
                if util.get_current_buffer_file_name() == "special.lua" then
                    return nil
                end
                return {
                    exe = "stylua",
                    args = {
                        "--indent-type Spaces",
                    },
                    stdin = false,
                }
            end,
        },
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    stdin = true,
                }
            end,
        },
        python = {
            function()
                return {
                    exe = "black",
                    args = {},
                    stdin = false,
                }
            end,
        },
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = { ' -style="{IndentWidth: 4}" -i ' },
                    stdin = false,
                }
            end,
        },
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = { ' -style="{IndentWidth: 4}" -i ' },
                    stdin = false,
                }
            end,
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {
        "*.js",
        "*.jsx",
        "*.ts",
        "*.tsx",
        "*.css",
        "*.scss",
        "*.md",
        "*.html",
        "*.lua",
        "*.json",
        "*.jsonc",
        "*.vue",
        "*.py",
        "*.rs",
        "*.c",
        "*.cpp",
    },
    command = "FormatWrite",
})
