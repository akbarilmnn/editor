return {
    -- before installing lspsaga make sure to install tree sitter. Lspsaga needed the markdown and markdown inline syntax
    -- highlighting and web dev icons
    -- source github repostory
    "glepnir/lspsaga.nvim",
    -- initialize
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end
}
