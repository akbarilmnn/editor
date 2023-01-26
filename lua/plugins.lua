local status, packer = pcall(require, "packer");
if (not status) then
    print("packer is not installed!")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

packer.startup(function(use)
    -- packer to install plugins
    use 'wbthomason/packer.nvim'
    -- base16 themes for neovim
    use 'RRethy/nvim-base16'
    -- status line for neovim
    use 'nvim-lualine/lualine.nvim'
    -- web dev icons
    use 'kyazdani42/nvim-web-devicons'
    -- autobrackets
    use 'windwp/nvim-autopairs'
    -- LSP
    use {
        'neovim/nvim-lspconfig',
        -- autocompletion
        'onsails/lspkind.nvim',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        -- snippet engine
        'L3MON4D3/LuaSnip',
    }

    -- syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- fuzzy finder
    use {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
    }

end)
