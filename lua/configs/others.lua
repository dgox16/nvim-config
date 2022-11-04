local M = {}

M.luasnip = function()
    local present, luasnip = pcall(require, "luasnip")
    if not present then
        return
    end

    local options = {
        history = true,
        update_events = "InsertLeave",
        enable_autosnippets = true,
        region_check_events = "CursorHold,InsertLeave",
        delete_check_events = "TextChanged,InsertEnter",
        store_selection_keys = "<Tab>",
    }

    luasnip.config.set_config(options)
    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
            if
                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
            then
                require("luasnip").unlink_current()
            end
        end,
    })
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

    luasnip.filetype_extend("handlebars", { "html" })
    luasnip.filetype_extend("javascript", { "html" })
    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })
    luasnip.filetype_extend("javascript", { "javascriptreact" })
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

M.leap = function()
    local present, leap = pcall(require, "leap")
    if not present then
        return
    end

    leap.set_default_keymaps()
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
    -- vim.cmd("ColorizerReloadAllBuffers")
end

M.trouble = function()
    local present, trouble = pcall(require, "trouble")
    if not present then
        return
    end

    trouble.setup({})
end

M.escape = function()
    local present, escape = pcall(require, "better_escape")
    if not present then
        return
    end

    escape.setup({ mapping = { "jk" } })
end

M.dictionary = function()
    local present, dictionary = pcall(require, "cmp_dictionary")
    if not present then
        return
    end

    dictionary.setup({
        dic = {
            ["html"] = { "~/.config/nvim/dict/bootstrap.dic" },
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
