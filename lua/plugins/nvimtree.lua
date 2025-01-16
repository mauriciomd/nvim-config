require("nvim-tree").setup({
    hijack_cursor = true,
    sort = {
        sorter = "case_sensitive",
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    view = {
      width = 40,
      side = "left",
    },
})

local api = require("nvim-tree.api")

local function open_tab_silent(node)
  api.node.open.tab(node)
  vim.cmd.tabprev()
end

function toggle_nvimtree()
	if vim.fn.bufname():match 'NvimTree_' then
		vim.cmd.wincmd 'p'
	else
		vim.cmd('NvimTreeFindFile')
	end
end

local git_add = function()
  local node = api.tree.get_node_under_cursor()
  local gs = node.git_status.file

  -- If the current node is a directory get children status
  if gs == nil then
    gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1]) 
         or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
  end

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
    vim.cmd("silent !git add " .. node.absolute_path)

  -- If the file is staged, we unstage
  elseif gs == "M " or gs == "A " then
    vim.cmd("silent !git restore --staged " .. node.absolute_path)
  end

  api.tree.reload()
end

api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. vim.fn.fnameescape(file.fname))
end)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
vim.keymap.set('n', '<C-T>', open_tab_silent, {desc ='Open Tab Silent'})
vim.keymap.set('n', 'ga', git_add, {desc = 'Git Add'})
vim.keymap.set('n', '<C-H>', '<cmd>:lua toggle_nvimtree()<CR>')
