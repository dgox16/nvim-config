local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    open_mapping = [[<M-q>]],
    direction = "float",
    float_opts = {
        border = "curved",
        width = 130,
        height = 30,
    },
    highlights = {
        FloatBorder = {
            guifg = "#cba6f7",
        },
    },
})
