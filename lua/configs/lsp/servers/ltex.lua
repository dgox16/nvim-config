local M = {}

M.filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" } --gitcommit

M.settings = {
    settings = {
        language = "es",
        diagnosticSeverity = "information",
        sentenceCacheSize = 2000,
        additionalRules = {
            enablePickyRules = true,
            motherTongue = "es",
        },
    },
}

M.extra_settings = {
    load_langs = { "es" },
    init_check = true,
    path = ".ltex",
    log_level = "none",
}

return M
