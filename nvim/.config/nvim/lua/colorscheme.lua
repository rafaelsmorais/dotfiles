require("catppuccin").setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	transparent_background = true, -- disables setting the background color.
	integrations = {
		mini = {
			enabled = true,
		}
	}

})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
