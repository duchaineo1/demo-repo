
local plugins = {
	{
		"ThePrimeagen/harpoon",
		lazy = false,
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = 'LazyGit',
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
 }

return plugins
