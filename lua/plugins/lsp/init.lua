local present, lspconfig = pcall(require, "lspconfig")
if not present then
    return
end

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        active = signs,
    },
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

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp_ok then
    capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true
end

-- LSP SERVER
lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = require("plugins.lsp.servers.luals").settings,
})

lspconfig.jsonls.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = require("plugins.lsp.servers.json").settings,
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    root_dir = require("plugins.lsp.servers.typescript").root_dir,
})

require("grammar-guard").init()
lspconfig.grammar_guard.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    cmd = require("plugins.lsp.servers.grammar").cmd,
    settings = require("plugins.lsp.servers.grammar").settings,
    root_dir = require("plugins.lsp.servers.grammar").root_dir,
})

lspconfig.texlab.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = require("plugins.lsp.servers.texlab").settings,
    root_dir = require("plugins.lsp.servers.texlab").root_dir,
})

for _, server in ipairs({ "bashls", "cssls", "clangd", "html", "emmet_ls", "pyright", "rust_analyzer", "tailwindcss" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
    })
end

vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
