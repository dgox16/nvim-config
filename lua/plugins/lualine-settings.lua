local present, lualine = pcall(require, "lualine")
if not present then
    return
end

lualine.setup({
    options = {
        theme = "catppuccin",
        component_separators = "|",
        globalstatus = 3,
    },
})
