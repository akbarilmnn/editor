return {
    -- source repository 
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    -- initialize 
    
    config = function()
        require("nvim-tree").setup()
    end
}
