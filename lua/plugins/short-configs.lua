return {
    -- preffered colorscheme 
    {
        "folke/tokyonight.nvim", 
       -- config = function() 
       --     vim.cmd [[colorscheme tokyonight-night]]
       -- end 
    },
    {
        "ellisonleao/gruvbox.nvim",
        config = function ()
            require("gruvbox").setup({
                italic = false,
                transparent_mode = true,
                bold = false,
            })
            vim.cmd [[colorscheme gruvbox]]
        end
    },
    -- autopairs 
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    }, 
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter.configs")

            ts.setup {
                ensure_installed = {
                    "c",
                    "cpp",
                    "zig",
                    "rust",
                    "lua",
                    "vim",
                    "html",
                    "css",
                    "typescript",
                },
                highlight = {
                    enable = true,
                    disable = {},
                },
                indent = {
                    enable = true,
                    disable = {},
                },
                autotag = {
                    enable = true,
                },
            }
        end
    },
    -- telescope fuzzy finder (install ripgrep first before install this plugin)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        cmd = "Telescope",
        keys = {
            {"<leader>ff", "<cmd>Telescope find_files<cr>", "find_files"},
            {"<leader>lg", "<cmd>Telescope live_grep<cr>", "live_grep"},
            {"<leader>bf", "<cmd>Telescope buffers<cr>", "buffers"}
        }
    },
    -- neo-tree file explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        keys = {
            {"<leader>t", "<cmd>NeoTreeFocusToggle<cr>", "neotree_toggle"},
        }
    },
    -- Mason to install language servers easily
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        cmd = "Mason",
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "zls",
                    "emmet_ls",
                    "cssls",
                    "denols",
                    "html",
                },
            })
        end
    },
    -- lsp zero 
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',             -- Required
            'williamboman/mason.nvim',           -- Optional
            'williamboman/mason-lspconfig.nvim', -- Optional

            -- Autocompletion
            'hrsh7th/nvim-cmp',         -- Required
            'hrsh7th/cmp-nvim-lsp',     -- Required
            'hrsh7th/cmp-buffer',       -- Optional
            'hrsh7th/cmp-path',         -- Optional
            'saadparwaiz1/cmp_luasnip', -- Optional
            'hrsh7th/cmp-nvim-lua',     -- Optional

            -- Snippets
            'L3MON4D3/LuaSnip',             -- Required
            'rafamadriz/friendly-snippets', -- Optional
        },
        config = function()
            local lsp = require('lsp-zero').preset({
                name = 'minimal',
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })

            -- (Optional) Configure lua language server for neovim
            lsp.nvim_workspace()

            lsp.setup()
        end
    },
    -- line wrapping for school 
    {
        "andrewferrier/wrapping.nvim",
        config = function ()
            require("wrapping").setup()
        end
    },
    -- leap.nvim to jump into text quickly 
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat"
        },
        config = function() 
            require('leap').add_default_mappings()
        end
    },
    -- gitsigns 
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    }, 
    -- fugitive a plugin to show git diff and merge conflicts
    {
        "tpope/vim-fugitive"
    }, 
}
