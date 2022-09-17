local M = {}

M.plugins = {
    { "lewis6991/impatient.nvim" },

    { "nvim-lua/plenary.nvim" },
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
        "glepnir/galaxyline.nvim",
        branch = "main",
        config = function()
            require("configs.statusline")
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
            require("configs.lsp.mason")
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

    {
        "windwp/nvim-autopairs",
        config = function()
            require("configs.autopairs-settings")
        end,
    },

    {
        "folke/trouble.nvim",
        config = function()
            require("configs.others").trouble()
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

    {
        "ggandor/leap.nvim",
        config = function()
            require("configs.others").leap()
        end,
    },

    { "windwp/nvim-ts-autotag" },

    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("configs.lsp.null-ls")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
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
