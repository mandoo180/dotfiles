local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set('', ' ', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

set('i', 'kj', '<esc>', opts)
set('i', 'jk', '<esc>', opts)
set('i', 'jj', '<esc>', opts)
set('i', 'kk', '<esc>', opts)

set('n', '<Tab>', ':bnext<CR>', opts)
set('n', '<S-Tab>', ':bprev<CR>', opts)
set('n', '<C-s>', ':w<CR>:bnext<CR>', opts)
set('i', '<C-s>', '<ESC>:w<CR>:bnext<CR>', opts)
-- set('n', '<C-w>', ':bd<CR>', opt)
-- set('i', '<C-s>', '<ESC>:bd<CR>', opts)

set('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
set('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
set('v', 'p', '"_dP', opts)

set('v', '>', '>gv', opts)
set('v', '<', '<gv', opts)

set('n', '<C-h>', '<C-w>h', opts)
set('n', '<C-j>', '<C-w>j', opts)
set('n', '<C-k>', '<C-w>k', opts)
set('n', '<C-l>', '<C-w>l', opts)

set('n', '+', '<C-a>', opts)
set('n', '-', '<C-x>', opts)

set('n', '<C-a>', 'gg<S-v>G', opts)

set('n', '<Leader>w', '<CMD>w<CR>', opts)
set('n', '<Leader>q', '<CMD>bp<bar>sp<bar>bn<bar>bd<CR>', opts)
set('n', '<Leader>c', '<CMD>bd<CR>', opts)
set('n', '<Leader>h', '<CMD>nohlsearch<CR>', opts)

set('i', '<C-f>', '<Right>', opts)
set('i', '<C-b>', '<Left>', opts)
set('i', '<C-n>', '<Down>', opts)
set('i', '<C-p>', '<Up>', opts)
set('i', '<C-a>', '<Home>', opts)
set('i', '<C-e>', '<End>', opts)
