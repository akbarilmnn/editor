return {
    -- using either onedark or tokyonight colorscheme...
    -- source repository
    "navarasu/onedark.nvim",
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

        -- use onedark when nvim is launched
        vim.cmd [[ colorscheme onedark]]
    end
}
