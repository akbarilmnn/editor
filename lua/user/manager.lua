vim.cmd [[ packadd packer.nvim ]] 
    


return require('packer').startup(function(use) 
    
    -- a plugin manager to install other plugins
	use 'wbthomason/packer.nvim'
    
    -- a fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- themes for neovim i'm using gruvbox 
    use {
        "ellisonleao/gruvbox.nvim",
    }

    -- treesitter plugin for syntax highlighting 
     
    use ({
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    })
    
    -- all in one lsp configuration 
    -- if has all kinds of features like 
    -- goto definition a ui element that display want that function is doing etc 

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }

}



end)
