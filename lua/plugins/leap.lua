return {
    -- source repository
    "ggandor/leap.nvim",

    dependencies = {
        "tpope/vim-repeat",
        lazy = true,
    },

    -- initialize 
    config = function()
        require("leap").add_default_mappings()
    end
}
