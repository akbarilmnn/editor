return {
    -- source repostory
    "nvim-treesitter/nvim-treesitter",
    -- do this thing before loading this plugin
    build = ":TSUpdate",
    -- initialize
    config = function()
        local ts = require("nvim-treesitter.configs")

        ts.setup {
            -- install these syntax highlighting for each language
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
}
