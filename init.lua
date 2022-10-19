vim.defer_fn(function()
    pcall(require, "impatient")
end, 0)

-- Packer bootstrap
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd("packadd packer.nvim")

require("core")
require("plugins")
