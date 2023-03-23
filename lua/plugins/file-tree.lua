return {
    -- source repository 
    "nvim-tree/nvim-tree.lua",

    -- initialize 
    
    config = function()
        require("nvim-tree").setup()
    end
}
