vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local do_packer_sync = nil

if fn.empty(fn.glob(install_path)) > 0 then
    do_packer_sync = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

return require("packer").startup({
    function(use)
        use({ "wbthomason/packer.nvim" })

        use({
            "neovim/nvim-lspconfig",
            event = "BufRead",
            config = function()
                require("plugins.lsp")
            end,
        })

        use({
            "williamboman/mason.nvim",
            config = function()
                require("plugins.others").mason()
            end,
        })

        use({
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            config = function()
                require("plugins.cmp-settings")
            end,
            wants = "LuaSnip",
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    config = function()
                        require("plugins.others").luasnip()
                    end,
                },
                {
                    "rafamadriz/friendly-snippets",
                    module = { "cmp", "cmp_nvim_lsp" },
                    event = "InsertCharPre",
                },
            },
        })

        use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
        use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
        use({ "uga-rosa/cmp-dictionary", after = "nvim-cmp" })

        use({
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("plugins.catppuccin-settings")
            end,
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            config = function()
                require("plugins.treesitter-settings")
            end,
            run = ":TSUpdate",
        })

        use({
            "hoob3rt/lualine.nvim",
            after = "nvim-web-devicons",
            config = function()
                require("plugins.lualine-settings")
            end,
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        })

        use({
            "numToStr/Comment.nvim",
            keys = { "gc", "gcc", "gbc", "gb" },
            config = function()
                require("plugins.others").comment()
            end,
        })
        use({
            "kylechui/nvim-surround",
            event = "BufRead",
            tag = "*",
            config = function()
                require("plugins.others").surround()
            end,
        })

        use({ "windwp/nvim-ts-autotag", event = "BufRead" })

        use({
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("plugins.autopairs-settings")
            end,
        })

        use({
            "mhartington/formatter.nvim",
            event = "BufRead",
            config = function()
                require("plugins.formatter-settings")
            end,
        })

        use({
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = function()
                require("plugins.others").gitsigns()
            end,
        })

        use({
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            setup = function()
                require("plugins.others").blankline()
            end,
        })

        use({
            "ibhagwan/fzf-lua",
            cmd = "FzfLua",
            config = function()
                require("plugins.fzf-settings")
            end,
        })

        use({
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("plugins.ntree-settings")
            end,
        })

        use({
            "onsails/lspkind-nvim",
            after = { "LuaSnip" },
            config = function()
                require("plugins.lspkind-settings")
            end,
        })

        use({
            "norcalli/nvim-colorizer.lua",
            after = { "nvim-treesitter" },
            config = function()
                require("plugins.others").colorizer()
            end,
        })

        use({
            "akinsho/bufferline.nvim",
            tag = "*",
            config = function()
                require("plugins.bufferline-settings")
            end,
            requires = "kyazdani42/nvim-web-devicons",
        })

        use({
            "akinsho/toggleterm.nvim",
            keys = { "<M-q>" },
            tag = "v2.*",
            config = function()
                require("plugins.toggleterm-settings")
            end,
        })

        use({ "lambdalisue/suda.vim", cmd = { "SudaRead, SudaWrite" } })

        use({
            "dsznajder/vscode-es7-javascript-react-snippets",
            after = { "LuaSnip" },
            run = "yarn install --frozen-lockfile && yarn compile",
        })

        use("lewis6991/impatient.nvim")

        if do_packer_sync then
            require("packer").sync()
        end
    end,
})
