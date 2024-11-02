require("plugins.lazyvim").setup({
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"}
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  }, 
    "neovim/nvim-lspconfig",
    "folke/tokyonight.nvim",
    'hrsh7th/nvim-cmp', -- Autocompletion plugin,
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp,
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
})

require "config.keymaps"
require "config.editor"

require "plugins.lualine"
require "plugins.nvimtree"
require "plugins.telescope"
require "plugins.lspconfig"
