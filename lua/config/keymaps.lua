local options = {noremap = true, silent = true}

vim.g.mapleader = ","
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", {desc = "Save"})
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", {desc = "Exit"})
vim.keymap.set("n", "<leader>b", "<cmd>e#<cr>")

vim.keymap.set("i", "hj", "<ESC>")
vim.keymap.set("i", "jh", "<ESC>")

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", options)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", options)
vim.keymap.set("v", "hj", "<ESC>")
vim.keymap.set("v", "jh", "<ESC>")