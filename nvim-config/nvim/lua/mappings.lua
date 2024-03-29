-- ~/.config/nvim/lua/mappings.lua
-- in your init.lua use: require('mappings')
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Insert

map("i", "<leader>w", "<Esc>:w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>")
map("i", "<C-q>", "<Esc>:q<CR>")


-- Normal mode
map("n", "<leader>pv", ":e %:h<CR>")
map("n", "<Esc>", "<Esc>:noh<CR>")
-- Utility

map("n", "<leader>gg", ":LazyGit<CR>")
