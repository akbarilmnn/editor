return {
    -- source repository 
    "nvim-telescope/telescope.nvim",
    lazy = true,
    
    -- dependencies 
    -- plenary.nvim 
    -- burntsushi/ripgrep -> not a neovim plugin 
    -- sharkdp/fd -> not a neovim plugin
    -- nvim-tree/nvim-web-devicons
    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    -- command to run 
    cmd = "Telescope" 
}
