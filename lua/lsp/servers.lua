
-- ~/.config/nvim/lua/lsp/servers.lua

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Global diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
	},
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = false,
})

-- Lua LSP
vim.lsp.config.lua_ls = {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git", ".luarc.json" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
	capabilities = capabilities,
}

-- clangd
vim.lsp.config.clangd = {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--pch-storage=memory",
		"--limit-results=100",
		"--limit-references=100",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = {
		"compile_commands.json",
		".clangd",
		".git",
		"Makefile",
	},
	capabilities = capabilities,
}

-- Enable servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
