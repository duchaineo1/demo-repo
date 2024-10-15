-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

options = vim.opt
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
options = vim.opt
options.number = true
options.relativenumber = true
options.splitbelow = true
options.splitright = true
options.wrap = false
options.expandtab = true
options.tabstop = 4
options.shiftwidth = 4
options.clipboard = "unnamedplus"
options.scrolloff = 999
options.virtualedit = "block"
options.inccommand = "split"
options.ignorecase = true
options.termguicolors = true
vim.opt.pumblend = 0
vim.g.bigfile_size=1024*1024*1
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "rosepine" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
