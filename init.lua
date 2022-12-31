local present, impatient = pcall(require, "impatient")

if present then
    impatient.enable_profile()
end

vim.cmd([[
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
       \ execute 'cd '.argv()[0] | execute 'NvimTree' | 
   ]])

require("core")
require("plugins")
