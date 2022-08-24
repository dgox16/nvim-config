return require("packer").startup({
    function(use)
        use("lewis6991/impatient.nvim")

        use({
            "wbthomason/packer.nvim",
        })

        -- UI
        use({
            "catppuccin/nvim",
            as = "catppuccin",
            run = ":CatppuccinCompile",
            config = function()
                require("plugins.catppuccin-settings")
            end,
        })
        use({
            "kyazdani42/nvim-web-devicons",
            after = "catppuccin",
        })

        use({
            "kyazdani42/nvim-tree.lua",
            after = "nvim-web-devicons",
            config = function()
                require("plugins.ntree-settings")
            end,
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
            "akinsho/bufferline.nvim",
            after = "lualine.nvim",
            tag = "*",
            config = function()
                require("plugins.bufferline-settings")
            end,
        })

        -- Faster visualization
        use({
            "lukas-reineke/indent-blankline.nvim",
            event = { "BufRead", "BufWinEnter", "BufNewFile" },
            setup = function()
                require("plugins.others").blankline()
            end,
        })
        use({
            "norcalli/nvim-colorizer.lua",
            event = { "BufRead", "BufWinEnter", "BufNewFile" },
            config = function()
                require("plugins.others").colorizer()
            end,
        })
        use({
            "p00f/nvim-ts-rainbow",
            event = { "BufRead", "BufWinEnter", "BufNewFile" },
        })
        use({
            "nvim-treesitter/nvim-treesitter",
            after = "nvim-ts-rainbow",
            config = function()
                require("plugins.treesitter-settings")
            end,
            run = ":TSUpdate",
        })

        use({
            "lewis6991/gitsigns.nvim",
            event = { "BufRead", "BufWinEnter", "BufNewFile" },
            config = function()
                require("plugins.others").gitsigns()
            end,
        })

        -- LSP
        use({
            "williamboman/mason.nvim",
            config = function()
                require("plugins.others").mason()
            end,
        })

        use({
            "brymer-meneses/grammar-guard.nvim",
            after = "mason.nvim",
            config = function()
                require("grammar-guard").init()
            end,
        })

        use({
            opt = true,
            "neovim/nvim-lspconfig",
            event = { "BufRead", "BufWinEnter", "BufNewFile" },
            config = function()
                require("plugins.lsp")
            end,
        })

        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.others").lspsaga()
            end,
        })

        use({
            "onsails/lspkind-nvim",
            after = "lspsaga.nvim",
            config = function()
                require("plugins.lspkind-settings")
            end,
        })

        -- cmp and snippets

        use({
            "dsznajder/vscode-es7-javascript-react-snippets",
            event = "InsertEnter",
            run = "yarn install --frozen-lockfile && yarn compile",
        })
        use({
            "rafamadriz/friendly-snippets",
            after = "vscode-es7-javascript-react-snippets",
            module = { "cmp", "cmp_nvim_lsp" },
        })
        use({
            "hrsh7th/nvim-cmp",
            after = { "vscode-es7-javascript-react-snippets" },
            config = function()
                require("plugins.cmp-settings")
            end,
        })
        use({
            "uga-rosa/cmp-dictionary",
            after = "nvim-cmp",
            config = function()
                require("plugins.others").dictionary()
            end,
        })
        use({
            "L3MON4D3/LuaSnip",
            after = "nvim-cmp",
            config = function()
                require("plugins.others").luasnip()
            end,
        })

        use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
        use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })
        use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })
        use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })
        use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
        use({ "hrsh7th/cmp-cmdline", after = "cmp-buffer" })
        use({ "kdheepak/cmp-latex-symbols", after = "cmp-cmdline" })

        use({
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("plugins.autopairs-settings")
            end,
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
            event = { "BufRead", "BufWinEnter", "BufNewFile" },
            tag = "*",
            config = function()
                require("plugins.others").surround()
            end,
        })

        use({ "windwp/nvim-ts-autotag", ft = { "html", "javascript", "javascriptreact" } })

        use({
            "mhartington/formatter.nvim",
            event = "BufWritePre",
            config = function()
                require("plugins.formatter-settings")
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
            "akinsho/toggleterm.nvim",
            keys = { "<M-q>" },
            tag = "v2.*",
            config = function()
                require("plugins.toggleterm-settings")
            end,
        })

        use({ "lambdalisue/suda.vim", cmd = { "SudaRead, SudaWrite" } })
    end,
})
