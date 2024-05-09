-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ 
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{ 
		"echasnovski/mini.nvim",
		version = "*"
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
		  vim.o.timeout = true
		  vim.o.timeoutlen = 300
		end,
		opts = {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	}
})

