local present, impatient = pcall(require, "impatient")

if present then
    impatient.enable_profile()
end

vim.cmd([[
augroup cdpwd
    autocmd!
    autocmd VimEnter * cd $PWD
augroup END
    ]])

require("core")
require("plugins")
