return {
    -- source repository 
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTree",
    keys = {
        {"<leader>t", "<cmd>NvimTreeToggle<cr>", "opens file tree"},
    },
    -- initialize 
    
    config = function()
        require("nvim-tree").setup()
    end
}
