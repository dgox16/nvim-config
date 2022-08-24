local M = {}

M.mason = function()
    local present, mason = pcall(require, "mason")
    if not present then
        return
    end
    mason.setup()
end

M.luasnip = function()
    local present, luasnip = pcall(require, "luasnip")
    if not present then
        return
    end

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

    luasnip.filetype_extend("handlebars", { "html" })
    luasnip.filetype_extend("javascript", { "html" })
    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })
end

M.comment = function()
    local present, comment = pcall(require, "Comment")
    if not present then
        return
    end
    comment.setup()
end

M.surround = function()
    local present, nvim_surround = pcall(require, "nvim-surround")
    if not present then
        return
    end

    nvim_surround.setup({})
end

M.gitsigns = function()
    local present, gitsigns = pcall(require, "gitsigns")
    if not present then
        return
    end

    gitsigns.setup()
end

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if not present then
        return
    end

    colorizer.setup({
        "*",
    }, {
        names = false,
    })
    vim.cmd("ColorizerReloadAllBuffers")
end

M.lspsaga = function()
    local present, lspsaga = pcall(require, "lspsaga")
    if not present then
        return
    end

    lspsaga.init_lsp_saga({})
end

M.dictionary = function()
    local present, dictionary = pcall(require, "cmp_dictionary")
    if not present then
        return
    end

    dictionary.setup({
        dic = {
            ["javascript, javascriptreact, html"] = { "~/.config/nvim/dict/bootstrap.dic" },
        },
        async = false,
        capacity = 5,
    })
end

M.blankline = function()
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = "▏"

    vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "packer" }
    vim.g.indent_blankline_buftype_exclude = { "terminal" }

    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_first_indent_level = false
end

return M
