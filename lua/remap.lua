local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- save
map('n', '<leader>s', ':w<CR>', opts)
-- save and quit
map('n', '<leader>q', ':wq<CR>', opts)
-- go to visual mode easily
map('n', '<leader>v', '<C-v>', opts)
-- just quit
map('n', '<leader>e', ':q!<CR>', opts)

-- toggle nerd tree
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

-- shitty autopair lol
map('i', 'jj', '<Esc>', opts)
map('i', 'jk', '<Esc>:', opts)
--map('i', '(', '()<left>', opts)
--map('i', '{', '{}<left>', opts)
--map('i', '[', '[]<left>', opts)
--map('i', "'", "''<left>", opts)
--map('i', '"', '""<left>', opts)
--map('i', '`', '``<left>',opts)
--map('i', '<', '<><left>',opts)
--map('i', '|', '||<left>', opts)
--map('n', 'sh', '<Esc>:!', opts )

-- toggle buffers
map('n', '<C-n>', ':bNext<CR>', opts)
map('n', '<C-b>', ':bprevious<CR>', opts)

-- can move blocks of code by using visua mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)


-- visual mode
map('v', "<", "<gv", opts)
map('v', ">", ">gv", opts)
