-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

require("nvim-tree").setup({
    hijack_cursor = true,
    sort = {
        sorter = "case_sensitive",
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    renderer = {
      root_folder_modifier = ":t",
    --   icons = {
    --     glyphs = {
    --       default = "",
    --       symlink = "",
    --       folder = {
    --         arrow_open = "",
    --         arrow_closed = "",
    --         default = "",  
    --         open = "",
    --         empty = "",
    --         empty_open = "",
    --         symlink = "",
    --         symlink_open = "",
    --       },
    --       git = {
    --         unstaged = "",
    --         staged = "S",
    --         unmerged = "",
    --         renamed = "➜",
    --         untracked = "U",
    --         deleted = "",
    --         ignored = "◌",
    --       },
    --     },
    --   },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    --   icons = {
    --     hint = "",
    --     info = "",
    --     warning = "",
    --     error = "",
    --   },
    },
    view = {
      width = 30,
      side = "left",
    },
})

