
-- ~/.config/nvim/lua/lsp/init.lua

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"clangd",
	},
	auto_update = true,
	automatic_installation = true,
	automatic_enable = true
})

require("mason-nvim-dap").setup({
	ensure_installed = { "cpptools" },
	automatic_installation = true,
})

-- load actual LSP definitions
require("lsp.servers")
