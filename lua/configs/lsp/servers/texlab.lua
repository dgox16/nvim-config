local root_pattern = require("lspconfig").util.root_pattern
local M = {}

M.settings = {
    texlab = {
        rootDirectory = ".",
        build = {
            onSave = true,
        },
    },
}

M.root_dir = root_pattern("*.tex")

return M
