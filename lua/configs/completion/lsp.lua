local present, lspconfig = pcall(require, "lspconfig")
if not present then
    return
end

local root_pattern = require("lspconfig").util.root_pattern

vim.api.nvim_command([[packadd lsp_signature.nvim]])
vim.api.nvim_command([[packadd lspsaga.nvim]])
vim.api.nvim_command([[packadd cmp-nvim-lsp]])

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

require("lspconfig.ui.windows").default_options.border = "single"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local function on_attach(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        use_lspsaga = false,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hi_parameter = "Search",
        handler_opts = { "double" },
    })
end

-- LSP SERVER
lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim", "packer_plugins" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.jsonls.setup({
    flags = { debounce_text_changes = 500 },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        json = {
            schemas = {
                {
                    fileMatch = { "package.json" },
                    url = "https://json.schemastore.org/package.json",
                },
                {
                    fileMatch = { "tsconfig*.json" },
                    url = "https://json.schemastore.org/tsconfig.json",
                },
                {
                    fileMatch = {

                        ".prettierrc",
                        ".prettierrc.json",
                        "prettier.config.json",
                    },
                    url = "https://json.schemastore.org/prettierrc.json",
                },
                {
                    fileMatch = { ".eslintrc", ".eslintrc.json" },
                    url = "https://json.schemastore.org/eslintrc.json",
                },
                {
                    fileMatch = {
                        ".babelrc",
                        ".babelrc.json",
                        "babel.config.json",
                    },

                    url = "https://json.schemastore.org/babelrc.json",
                },
                {

                    fileMatch = { "lerna.json" },
                    url = "https://json.schemastore.org/lerna.json",
                },
                {
                    fileMatch = {
                        ".stylelintrc",
                        ".stylelintrc.json",
                        "stylelint.config.json",
                    },

                    url = "http://json.schemastore.org/stylelintrc.json",
                },
                {
                    fileMatch = { "/.github/workflows/*" },
                    url = "https://json.schemastore.org/github-workflow.json",
                },
            },
        },
    },
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.ltex.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require("ltex_extra").setup({
            load_langs = { "es" },
            init_check = true,
            path = ".ltex",
            log_level = "none",
        })
    end,
    filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
    settings = {
        ltex = {
            language = "es",
            diagnosticSeverity = "information",
            sentenceCacheSize = 2000,
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "es",
            },
        },
    },
})

lspconfig.texlab.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        texlab = {
            rootDirectory = ".",
            build = {
                onSave = true,
            },
        },
    },

    root_dir = root_pattern("*.tex"),
})

for _, server in ipairs({ "bashls", "cssls", "clangd", "html", "pyright", "rust_analyzer" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
