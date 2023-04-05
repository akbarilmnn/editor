return {
    -- source repositories onedark theme for neovim
    "navarasu/onedark.nvim",
    
    dependencies = {
        -- for some reason i have to put on a dependencies block or else the colorscheme will not load
        -- vscode theme for neovim
        "Mofiqul/vscode.nvim",
        -- tokyonight theme 
        "folke/tokyonight.nvim",
        -- zenburn theme 
        "phha/zenburn.nvim",
    },

    priority = 1000,

    -- initialize 
    config = function()
        require("onedark").setup {
            style = "deep",
            -- by default everything is none except comments is italic,  meaning none  will be rendered by current font.
            code_style = {
                comments = 'none',
            },
        }
    
        require("zenburn").setup()

        -- use onedark when nvim is launched
        vim.cmd[[colorscheme vscode]]
    end
}
