local ensure_lazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end
ensure_lazy()

return require("lazy").setup({
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  {"nvim-telescope/telescope.nvim", version="0.1.1", dependencies = {"nvim-lua/plenary.nvim"}},

  {"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons", optional = true}},

  { "williamboman/mason.nvim",
    dependencies = {"williamboman/mason-lspconfig.nvim",
                    "neovim/nvim-lspconfig",
                    "simrat39/rust-tools.nvim",},
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  -- " For vsnip users.
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "lvimuser/lsp-inlayhints.nvim",
  "folke/neodev.nvim",
  { "akinsho/bufferline.nvim", version = "v3.*", dependencies = {"nvim-tree/nvim-web-devicons"} },
  "moll/vim-bbye",
  { "akinsho/toggleterm.nvim",
    version = "*", 
    config = function()
      require("toggleterm").setup()
    end
  },

  { "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Comment
  "numToStr/Comment.nvim",
  "folke/todo-comments.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "Mofiqul/dracula.nvim",

  -- copilot
  "github/copilot.vim"
})
