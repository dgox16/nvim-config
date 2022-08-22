local root_pattern = require("lspconfig").util.root_pattern
local M = {}

M.cmd = { "/home/dgox16/.local/share/nvim/mason/packages/ltex-ls/ltex-ls/bin/ltex-ls" }

M.settings = {
    ltex = {
        enabled = { "latex", "tex", "bib", "markdown" },
        language = "es",
        diagnosticSeverity = "information",
        sentenceCacheSize = 2000,
        additionalRules = {
            enablePickyRules = true,
            motherTongue = "es",
        },
        trace = { server = "verbose" },
        dictionary = {},
        disabledRules = {},
        hiddenFalsePositives = {},
    },
}

M.root_dir = root_pattern("*.tex")

return M
