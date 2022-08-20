local root_pattern = require("lspconfig").util.root_pattern
local M = {}

M.root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", "index.js", "app.js")

return M
