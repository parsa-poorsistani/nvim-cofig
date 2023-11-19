local keymap = vim.keymap


keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", {noremap = true,silent=true})
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true,silent=true})

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) --left
keymap.set("n", "<C-j>", "<C-w>j", opts) --down
keymap.set("n", "<C-k>", "<C-w>k", opts) --up
keymap.set("n", "<C-l>", "<C-w>l", opts) --right

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":hsplit<CR>", opts)
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)


