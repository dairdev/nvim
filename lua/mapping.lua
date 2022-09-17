vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- Lspsaga Mapping
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- Telescope Mapping
vim.keymap.set('n', '<leader> ff', '<Cmd>Telescope find_files<CR>', opts)

-- Neotree Mapping
vim.keymap.set('n', '<leader> e', '<Cmd>Neotree toggle <CR>', opts)

