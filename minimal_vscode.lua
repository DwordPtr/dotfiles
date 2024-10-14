vim.wo.number = true
vim.cmd("set fileformat=unix")
vim.o.clipboard = "unnamedplus"
-- Change leader to a comma
vim.g.mapleader = ","
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', ':!!sh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-y>', ':let @+ = expand("%:p")<CR>')
vim.keymap.set('n', "<left>", "gT")
vim.keymap.set('n', "<right>", "gt")
vim.keymap.set('n', "<C-c>", ":q<CR>")
vim.keymap.set('n', "<leader>re", ":tabnew ~/.config/nvim/init.lua<CR>")
vim.keymap.set('n', "<leader>rr", ":source $MYVIMRC<CR>")
vim.keymap.set('n', "<C-s>", ':w<CR>')
