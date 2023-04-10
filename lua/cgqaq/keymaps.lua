vim.g.mapleader = ' '

-- nvim tree
local nvim_tree = require("nvim-tree.api")
vim.keymap.set({'n', 'i', 'v'}, '<C-n>', nvim_tree.tree.toggle, {})
vim.keymap.set('n', '<C-m>', nvim_tree.fs.create, {})

-- mason
vim.keymap.set('n', '<C-t>', ":Mason<CR>")

-- telescope
vim.keymap.set('n', '<C-p>', ":Telescope<CR>")

