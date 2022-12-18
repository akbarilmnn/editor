vim.cmd [[ packadd packer.nvim ]] 
    


return require('packer').startup(function(use) 
    
  --  -- a plugin manager to install other plugins
    use 'wbthomason/packer.nvim'
  --  
  --  -- a fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- status line
    use 'nvim-lualine/lualine.nvim'
    -- themes for neovim i'm using gruvbox 
    use {
        "ellisonleao/gruvbox.nvim",
    }

    use {'nvim-treesitter/nvim-treesitter',  run = ':TSUpdate' } -- language parser
    
    -- LSP, LSP UI and LSP installer
    use {
        'neovim/nvim-lspconfig',
        'glepnir/lspsaga.nvim',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    }

    -- Autocompletion
    use {
        'onsails/lspkind.nvim',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        -- snippet engine
        'L3MON4D3/LuaSnip',
        -- autopairs
        'windwp/nvim-autopairs'
    }
    

    

end)
