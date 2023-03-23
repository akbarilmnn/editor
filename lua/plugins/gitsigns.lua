return {
    -- source repository 
    "lewis6991/gitsigns.nvim",
    -- initialize
    config = function() 
        require("gitsigns").setup()
    end
}
