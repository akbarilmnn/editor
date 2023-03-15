return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        -- set leader key
        vim.g.mapleader = ' '
        local wk = require("which-key")

        local opts =  { noremap = true, silent = true };
        local opts_insert = { noremap = true, silent = true, mode = "i" };
        local opts_visual = { noremap = true, silent = true, mode = "v" };
        -- initialize which-key
        wk.setup({})

        -- TODO: group keymaps and basically migrate the remap.lua file 
        -- into here
        -- wk.register(mappings, opts);

        -- global leeader key configuration 
        -- with default mode is normal mode
        wk.register({
            -- for moving fast 
            ["<leader>"] = {
                s = { "<cmd>w<cr>", "short-cut to save file" },
                q = { "<cmd>wq<cr>", "short-cut to save file and quit" },
                v = { "<C-v>", "short-cut to go to visual mode" },
                e = { "<cmd>q!<cr>", "short-cut to save file" },
            },
            -- shortcuts for using telescope 
            ["<leader>f"] = {
                f = { "<cmd>Telescope find_files<cr>", "find files using telescope" },
                s = { "<cmd>Telescope live_grep<cr>", "grep a string using telescope" },
                c = { "<cmd>Telescope grep_string<cr>", "grep the name of the file" },
                b = { "<cmd>Telescope buffers<cr>", "find all the history of all the buffers" },
                h = { "<cmd>Telescope help_tags<cr>", "find the help page of nvim commands" },
            },
            -- shortcuts for using fugitive.vim 
            ["<leader>g"] = {
                i = { "<cmd>G<cr>", "shortcut to open fugitive" },
            }
        }, opts)
        -- keymap with default configuration mode is insert mode
        wk.register({
            ["j"] = {
                j = { "<Esc>", "short-cut to go normal mode" },
                k = { "<Esc><cmd>", "short-cut to go command mode"},
            },
        }, opts_insert)

        -- keymap with default configuration mode is visual mode
        wk.register({
            ["J"] = { "<cmd>m '>+1<cr>gv=gv", "move a block of code down using visual mode "},
            ["K"] = { "<cmd>m '<-2<cr>gv=gv", "move a block of code up using visual mode " },
            ["<"] = { "<gv", "move a block of code a tab to the left" },
            [">"] = { ">gv", "move a block of code a tab to the right" } 
        }, opts_visual)
    end
}


