local present, catppuccin = pcall(require, "catppuccin")
if not present then
    return
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd([[colorscheme catppuccin]])

catppuccin.setup({})
