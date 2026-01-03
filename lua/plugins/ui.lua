return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        hijack_netrw = false,
        disable_netrw = true,
        filesystem_watchers = { enable = false },
      })
    end,
  },
  { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
}
