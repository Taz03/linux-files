local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map buffer actions
map("n", "<leader>d", ":bd<cr>", opts)
map("n", "<leader>p", ":bp<cr>", opts)
map("n", "<leader>n", ":bn<cr>", opts)

-- Map netrw
map("n", "<Leader>x", ":Ex<cr>", opts)

-- Disable scary q: history
map("n", "q:", "<nop>", opts);

-- Move blocks when selected
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- Cursor stay in one place when using J in normal mode
map("n", "J", "mzJ`z", opts)

