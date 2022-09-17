local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local latex = '-y="defaultIndent: ' '"'
null_ls.setup({
    on_attach = function(client, bufnr)
        local bufcmd = vim.api.nvim_buf_create_user_command

        local format = function()
            local params = vim.lsp.util.make_formatting_params({})
            client.request("textDocument/formatting", params, nil, bufnr)
        end

        if client.server_capabilities.documentFormattingProvider then
            bufcmd(bufnr, "NullFormat", format, { desc = "Format using null-ls" })
        end
    end,

    sources = {
        formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        formatting.prettier.with({ extra_args = { "--tab-width", "4" } }),
        formatting.rustfmt,
        formatting.black,
        formatting.clang_format,
        formatting.latexindent,
        diagnostics.eslint,
    },
})
