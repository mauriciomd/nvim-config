require("lualine").setup({
    options = {
      theme = "onedark",
      icons_enabled = true,
      component_separators = "|",
      section_separators = "",
      disabled_filetypes = {
        statusline = {"NvimTree"}
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diagnostics"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
      }
    },
})