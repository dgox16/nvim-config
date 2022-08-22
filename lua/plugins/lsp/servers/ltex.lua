local M = {}

M.filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" } --gitcommit

M.settings = {
    settings = {
        checkFrequency = "save",
        language = "es-AR",
        additionalRules = {
            enablePickyRules = true,
            motherTongue = "es-AR",
        },
    },
}

M.extra_settings = {
    load_langs = { "es-AR" },
    init_check = true,
    path = ".ltex",
    log_level = "none",
}

return M
