local present1, gl = pcall(require, "galaxyline")
local present2, condition = pcall(require, "galaxyline.condition")
if not (present1 or present2) then
    return
end

local get_lsp_client = function(msg)
    msg = msg or "Inactive"
    local bufnr = vim.api.nvim_get_current_buf()
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients(bufnr)
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
end

local colors = {
    bg = "#181825",
    bg_dim = "#1e1e2e",
    bg_light = "#313244",
    black = "#11111b",
    white = "#bac2de",
    gray = "#7f849c",
    red = "#f38ba8",
    green = "#a6e3a1",
    yellow = "#f9e2af",
    blue = "#89b4fa",
    purple = "#cba6f7", -- tweaked to match custom color
    teal = "#94e2d5",
    lavender = "#b4befe",
}

local function mode_alias(m)
    local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        R = "REPLACE",
        t = "TERMINAL",
        ["␖"] = "V-BLOCK",
        V = "V-LINE",
        v = "VISUAL",
    }

    return alias[m] or ""
end

local function mode_color(m)
    local mode_colors = {
        normal = colors.green,
        insert = colors.blue,
        visual = colors.purple,
        replace = colors.red,
    }

    local color = {
        n = mode_colors.normal,
        i = mode_colors.insert,
        c = mode_colors.replace,
        R = mode_colors.replace,
        t = mode_colors.insert,
        ["␖"] = mode_colors.visual,
        V = mode_colors.visual,
        v = mode_colors.visual,
    }

    return color[m] or colors.bg_light
end

-- disable for these file types
gl.short_line_list = { "startify", "nerdtree", "term", "fugitive", "NvimTree" }

gl.section.left[1] = {
    ViModeIcon = {
        separator = "  ",
        separator_highlight = { colors.lavender, colors.bg_light },
        highlight = { colors.black, colors.lavender },
        provider = function()
            return "   "
        end,
    },
}

gl.section.left[2] = {
    CWD = {
        separator = "  ",
        separator_highlight = function()
            return { colors.bg_light, condition.buffer_not_empty() and colors.bg_dim or colors.bg }
        end,
        highlight = { colors.white, colors.bg_light },
        provider = function()
            local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dirname .. " "
        end,
    },
}

gl.section.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = { colors.gray, colors.bg_dim },
    },
}

gl.section.left[4] = {
    FileName = {
        provider = "FileName",
        condition = condition.buffer_not_empty,
        highlight = { colors.gray, colors.bg_dim },
        separator_highlight = { colors.bg_dim, colors.bg },
        separator = "  ",
    },
}

gl.section.left[5] = {
    DiffAdd = {
        icon = "  ",
        provider = "DiffAdd",
        condition = condition.hide_in_width,
        highlight = { colors.green, colors.bg },
    },
}

gl.section.left[6] = {
    DiffModified = {
        icon = "  ",
        provider = "DiffModified",
        condition = condition.hide_in_width,
        highlight = { colors.yellow, colors.bg },
    },
}

gl.section.left[7] = {
    DiffRemove = {
        icon = "  ",
        provider = "DiffRemove",
        condition = condition.hide_in_width,
        highlight = { colors.red, colors.bg },
    },
}

gl.section.right[1] = {
    ShowLspClient = {
        provider = get_lsp_client,
        condition = function()
            local tbl = { ["dashboard"] = true, [" "] = true }
            if tbl[vim.bo.filetype] then
                return false
            end
            return true
        end,
        separator = " ",
        highlight = { colors.lavender, colors.bg },
        icon = "漣 LSP: ",
    },
}

gl.section.right[2] = {
    GitBranch = {
        icon = " ",
        separator = "  ",
        condition = condition.check_git_workspace,
        highlight = { colors.teal, colors.bg },
        provider = "GitBranch",
    },
}

gl.section.right[3] = {
    FileLocation = {
        icon = " ",
        separator = " ",
        separator_highlight = { colors.bg_dim, colors.bg },
        highlight = { colors.gray, colors.bg_dim },
        provider = function()
            local current_line = vim.fn.line(".")
            local total_lines = vim.fn.line("$")

            if current_line == 1 then
                return "Top"
            elseif current_line == total_lines then
                return "Bot"
            end

            local percent, _ = math.modf((current_line / total_lines) * 100)
            return "" .. percent .. "%"
        end,
    },
}

vim.api.nvim_command("hi GalaxyViModeReverse guibg=" .. colors.bg_dim)

gl.section.right[4] = {
    ViMode = {
        icon = " ",
        separator = " ",
        separator_highlight = "GalaxyViModeReverse",
        highlight = { colors.bg, mode_color() },
        provider = function()
            local m = vim.fn.mode() or vim.fn.visualmode()
            local mode = mode_alias(m)
            local color = mode_color(m)
            vim.api.nvim_command("hi GalaxyViMode guibg=" .. color)
            vim.api.nvim_command("hi GalaxyViModeReverse guifg=" .. color)
            return " " .. mode .. " "
        end,
    },
}
