require("nvim-treesitter.configs").setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown_inline", "javascript", "bash", "css", "html", "python", "toml", "yaml", "ini", "cmake", "diff", "gitcommit", "json", "ssh_config" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },  
}
