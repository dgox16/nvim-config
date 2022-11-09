local lualine = require("lualine")

local colors = {
    bg = "#181825",
    fg = "#cdd6f4",
    yellow = "#f9e2af",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    teal = "#94e2d5",
    green = "#a6e3a1",
    orange = "#fab387",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    blue = "#89b4fa",
    red = "#f38ba8",
    lavender = "#b4befe",
}

local modecolor = {
    n = colors.red,
    i = colors.teal,
    v = colors.mauve,
    [""] = colors.mauve,
    V = colors.blue,
    c = colors.yellow,
    no = colors.red,
    s = colors.yellow,
    S = colors.yellow,
    [""] = colors.yellow,
    ic = colors.yellow,
    R = colors.green,
    Rv = colors.violet,
    cv = colors.red,
    ce = colors.red,
    r = colors.teal,
    rm = colors.teal,
    ["r?"] = colors.teal,
    ["!"] = colors.red,
    t = colors.teal,
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,

    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        component_separators = "",
        section_separators = "",
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    function()
        return "▊"
    end,
    color = function()
        local mode_color = modecolor
        return { fg = mode_color[vim.fn.mode()] }
    end,

    padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
    -- mode component
    function()
        return " "
    end,
    color = function()
        local mode_color = modecolor
        return { fg = mode_color[vim.fn.mode()] }
    end,

    padding = { right = 1 },
})

ins_left({
    "filesize",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.fg, gui = "bold" },
})

ins_left({
    "location",
    color = { fg = colors.blue, gui = "bold" },
})

ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    diagnostics_color = {
        color_error = { fg = colors.pink },
        color_warn = { fg = colors.orange },
        color_info = { fg = colors.sky },
        hint = { fg = colors.teal },
    },
})

ins_left({
    function()
        return "%="
    end,
})

ins_left({
    function()
        msg = msg or "Inactive"
        local bufnr = vim.api.nvim_get_current_buf()
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        local lsps = ""
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                if lsps == "" then
                    lsps = client.name
                else
                    if not string.find(lsps, client.name) then
                        lsps = lsps .. ", " .. client.name
                    end
                end
            end
        end
        if lsps == "" then
            return msg
        else
            return lsps
        end
    end,
    icon = "  LSP:",
    color = { fg = colors.lavender, gui = "italic" },
})

ins_right({
    "o:encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = "bold" },
})

ins_right({
    "fileformat",
    fmt = string.upper,
    icons_enabled = false,
    color = { fg = colors.green, gui = "bold" },
})

ins_right({
    "branch",
    icon = " ",
    color = { fg = colors.pink, gui = "bold" },
})

ins_right({
    "diff",
    symbols = { added = " ", modified = " ", removed = " " },

    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
})

ins_right({
    function()
        return "▊"
    end,
    color = function()
        local mode_color = modecolor
        return { fg = mode_color[vim.fn.mode()] }
    end,

    padding = { left = 1 },
})

lualine.setup(config)
