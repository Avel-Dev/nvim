return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "c", "cpp", "cmake" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
