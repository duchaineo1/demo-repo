require "nvchad.mappings"
local harpoon = require("harpoon")
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "<leader>w", "<Esc>:w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>")
map("i", "<C-q>", "<Esc>:q<CR>")


-- Normal mode
map("n", "<leader>pv", ":e %:h<CR>")
map("n", "<Esc>", "<Esc>:noh<CR>")
-- Utility

map("n", "<leader>gg", ":LazyGit<CR>")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
vim.keymap.set("n", "<C-c>", function() harpoon:list():clear() end)
