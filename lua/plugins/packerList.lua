local M = {}

M.plugins = {
    { "lewis6991/impatient.nvim" },

    { "wbthomason/packer.nvim" },

    -- UI
    {
        "catppuccin/nvim",
        as = "catppuccin",
        run = ":CatppuccinCompile",
        config = function()
            require("configs.catppuccin-settings")
        end,
    },

    { "kyazdani42/nvim-web-devicons" },

    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("configs.ntree-settings")
        end,
    },

    {
        "hoob3rt/lualine.nvim",
        config = function()
            require("configs.lualine-settings")
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    },

    {
        "akinsho/bufferline.nvim",
        tag = "*",
        config = function()
            require("configs.bufferline-settings")
        end,
    },

    -- Faster visualization
    {
        "lukas-reineke/indent-blankline.nvim",
        setup = function()
            require("configs.others").blankline()
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("configs.others").colorizer()
        end,
    },

    {
        "p00f/nvim-ts-rainbow",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("configs.treesitter-settings")
        end,
        run = ":TSUpdate",
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs.others").gitsigns()
        end,
    },

    -- LSP
    {
        "williamboman/mason.nvim",
        config = function()
            require("configs.others").mason()
        end,
    },

    { "barreiroleo/ltex-extra.nvim" },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lsp")
        end,
    },

    {
        "onsails/lspkind-nvim",
        config = function()
            require("configs.lspkind-settings")
        end,
    },

    -- cmp and snippets
    {
        "dsznajder/vscode-es7-javascript-react-snippets",
        run = "yarn install --frozen-lockfile && yarn compile",
    },

    {
        "rafamadriz/friendly-snippets",
        module = { "cmp", "cmp_nvim_lsp" },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("configs.cmp-settings")
        end,
    },
    {
        "uga-rosa/cmp-dictionary",
        config = function()
            require("configs.others").dictionary()
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        after = "nvim-cmp",
        config = function()
            require("configs.others").luasnip()
        end,
    },

    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "kdheepak/cmp-latex-symbols" },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("configs.autopairs-settings")
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("configs.others").comment()
        end,
    },
    {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("configs.others").surround()
        end,
    },

    { "windwp/nvim-ts-autotag" },

    {
        "mhartington/formatter.nvim",
        config = function()
            require("configs.formatter-settings")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("configs.telescope-settings")
        end,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },

    { "stevearc/dressing.nvim" },

    {
        "akinsho/toggleterm.nvim",
        tag = "v2.*",
        config = function()
            require("configs.toggleterm-settings")
        end,
    },

    { "lambdalisue/suda.vim" },
    { "dstein64/vim-startuptime" },
}

return vim.tbl_extend("error", M, {})
