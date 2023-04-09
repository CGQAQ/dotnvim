vim.g.mapleader = ' '

local nvim_tree = require("nvim-tree.api")
vim.keymap.set({'n', 'i', 'v'}, '<C-n>', nvim_tree.tree.toggle, {})
