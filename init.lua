local present, impatient = pcall(require, "impatient")

if present then
    impatient.enable_profile()
end

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    print("Cloning packer ..")
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })

    vim.cmd("packadd packer.nvim")
    require("load-plugins")
    vim.cmd("PackerSync")
end

require("core")
require("plugins")
