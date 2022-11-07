local icons = {
    diagnostics = require("configs.ui.icons").get("diagnostics", true),
    kind = require("configs.ui.icons").get("kind", true),
    type = require("configs.ui.icons").get("type", true),
    ui = require("configs.ui.icons").get("ui", true),
}

local function set_sidebar_icons()
    local diagnostic_icons = {
        Error = icons.diagnostics.Error_alt,
        Warn = icons.diagnostics.Warning_alt,
        Info = icons.diagnostics.Information_alt,
        Hint = icons.diagnostics.Hint_alt,
    }
    for type, icon in pairs(diagnostic_icons) do
        local hl = "DiagnosticSign" .. type

        vim.fn.sign_define(hl, { text = icon, texthl = hl })
    end
end

set_sidebar_icons()

local colors = require("catppuccin.palettes").get_palette()

require("lspsaga").init_lsp_saga({
    diagnostic_header = {

        icons.diagnostics.Error_alt,
        icons.diagnostics.Warning_alt,
        icons.diagnostics.Information_alt,
        icons.diagnostics.Hint_alt,
    },
    custom_kind = {
        -- Kind
        Class = { icons.kind.Class, colors.yellow },
        Constant = { icons.kind.Constant, colors.peach },
        Constructor = { icons.kind.Constructor, colors.sapphire },
        Enum = { icons.kind.Enum, colors.yellow },
        EnumMember = { icons.kind.EnumMember, colors.teal },
        Event = { icons.kind.Event, colors.yellow },
        Field = { icons.kind.Field, colors.teal },
        File = { icons.kind.File, colors.rosewater },
        Function = { icons.kind.Function, colors.blue },
        Interface = { icons.kind.Interface, colors.yellow },
        Key = { icons.kind.Keyword, colors.red },
        Method = { icons.kind.Method, colors.blue },
        Module = { icons.kind.Module, colors.blue },
        Namespace = { icons.kind.Namespace, colors.blue },
        Number = { icons.kind.Number, colors.peach },
        Operator = { icons.kind.Operator, colors.sky },
        Package = { icons.kind.Package, colors.blue },
        Property = { icons.kind.Property, colors.teal },
        Struct = { icons.kind.Struct, colors.yellow },
        TypeParameter = { icons.kind.TypeParameter, colors.maroon },
        Variable = { icons.kind.Variable, colors.peach },
        -- Type
        Array = { icons.type.Array, colors.peach },
        Boolean = { icons.type.Boolean, colors.peach },
        Null = { icons.type.Null, colors.yellow },
        Object = { icons.type.Object, colors.yellow },
        String = { icons.type.String, colors.green },
        -- ccls-specific iconss.
        TypeAlias = { icons.kind.TypeAlias, colors.green },
        Parameter = { icons.kind.Parameter, colors.blue },
        StaticMethod = { icons.kind.StaticMethod, colors.peach },
    },
    symbol_in_winbar = {
        enable = false,
        in_custom = false,
        separator = " " .. icons.ui.Separator,
        show_file = false,
        file_formatter = "",
        click_support = function(node, clicks, button, modifiers)
            -- To see all avaiable details: vim.pretty_print(node)
            local st = node.range.start
            local en = node.range["end"]
            if button == "l" then
                if clicks == 2 then
                else -- jump to node's starting line+char
                    vim.fn.cursor(st.line + 1, st.character + 1)
                end
            elseif button == "r" then
                if modifiers == "s" then
                    print("lspsaga") -- shift right click to print "lspsaga"
                end -- jump to node's ending line+char
                vim.fn.cursor(en.line + 1, en.character + 1)
            elseif button == "m" then
                -- middle click to visual select node
                vim.fn.cursor(st.line + 1, st.character + 1)
                vim.api.nvim_command([[normal v]])
                vim.fn.cursor(en.line + 1, en.character + 1)
            end
        end,
    },
})
