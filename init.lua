-- ~/.config/nvim/init.lua

-- Core editor configuration (options, keymaps, autocmds)
require("core")
require("config.lazy")
require("plugins")
require("lsp")

vim.g.neovide_transparency = 0.75
vim.g.neovide_background_color = "#0f1117"
vim.g.neovide_floating_blur_amount_x = 8.0
vim.g.neovide_floating_blur_amount_y = 8.0
vim.g.neovide_transparency = 0.7

require("bufferline").setup {
	highlights = {
		fill = { bg = "none" },

		background = { bg = "none" },
		buffer_visible = { bg = "none" },
		buffer_selected = { bg = "none" },

		indicator_selected = { bg = "none" },
		indicator_visible = { bg = "none" },

		separator = { bg = "none" },
		separator_selected = { bg = "none" },
		separator_visible = { bg = "none" },

		tab = { bg = "none" },
		tab_selected = { bg = "none" },
	},
}
local function set_transparent()
	local groups = {
		"Normal",
		"NormalNC",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"FoldColumn",
		"LineNr",
		"CursorLineNr",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"VertSplit",
		-- nvim-tree
		"NvimTreeNormal",
		"NvimTreeNormalNC",
		"NvimTreeEndOfBuffer",
		"NvimTreeVertSplit",
		"NvimTreeWinSeparator",
		"NvimTreeCursorLine",
		"NvimTreeStatusLine",
		"NvimTreeStatusLineNC",
		-- bufferline
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineBuffer",
		"BufferLineBufferVisible",
		"BufferLineBufferSelected",
		"BufferLineSeparator",
		"BufferLineSeparatorVisible",
		"BufferLineSeparatorSelected",
		"BufferLineTab",
		"BufferLineTabSelected",
		"BufferLineTabClose",
		"BufferLineCloseButton",
		"BufferLinePath",
		"BufferLinePathVisible",
		"BufferLinePathSelected",
	}

	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end
local function bufferline_icons_transparent()
	local groups = {
		"BufferLineCloseButton",
		"BufferLineCloseButtonVisible",
		"BufferLineCloseButtonSelected",
	}

	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end

local function clear_icon_backgrounds()
	for name, _ in pairs(vim.api.nvim_get_hl(0, {})) do
		if name:match("^DevIcon")
		    or name:match("^BufferLineDevIcon")
		then
			vim.api.nvim_set_hl(0, name, { bg = "none" })
		end
	end
end

set_transparent()
bufferline_icons_transparent()
clear_icon_backgrounds()
