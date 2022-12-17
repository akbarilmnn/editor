require'nvim-treesitter.configs'.setup {
    -- a list of parser that automatically installed for you 
    ensure_installed = { "c", "lua", "rust", "typescript", "html", "css"},

    -- install it synchronously 
    sync_install = false,
    
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

}
