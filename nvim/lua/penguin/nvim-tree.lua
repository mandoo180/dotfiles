local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  disable_netrw = true,
})

vim.api.nvim_set_keymap('n', '<Leader>e', '<CMD>NvimTreeToggle<CR>', { noremap = true })
