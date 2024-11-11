local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

telescope.setup({})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>bi', builtin.buffers)
vim.keymap.set('n', '<Leader>ff', builtin.find_files)
vim.keymap.set('n', '<Leader>fr', builtin.oldfiles)
vim.keymap.set('n', '<Leader>gg', builtin.live_grep)
vim.keymap.set('n', '<Leader>hk', builtin.keymaps)
vim.keymap.set('n', '<Leader>ht', builtin.help_tags)
