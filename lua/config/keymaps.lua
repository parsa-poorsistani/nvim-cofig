local keymap = vim.keymap

local opts = { noremap = true, silent = true}
-- Folds

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

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")


local api = vim.api
-- Comments
api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false })
api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })
api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  command = "nohlsearch",
})
api.nvim_set_keymap('n', '<F7>', '<cmd>ToggleTerm direction=float<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<F8>', '<cmd>ToggleTerm size=10 direction=horizontal<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<F9>', '<cmd>ToggleTerm size=80 direction=vertical<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
