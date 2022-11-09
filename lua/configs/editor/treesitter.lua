local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup({
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "lua",
        "json",
        "http",
        "yaml",
        "latex",
        "python",
        "rust",
        "html",
        "javascript",
        "typescript",
        "css",
    },
    context_commentstring = {
        enable = true,
    },
    autotag = { enable = true },
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
})
