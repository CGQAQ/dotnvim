require("mason").setup {
  ui = {
    package_installed = "✓",
    package_pending = "➜",
    package_uninstalled = "✗"
  }
}

require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "rust_analyzer" },
}



vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- local border = {
  --       {"🭽", "FloatBorder"},
  --       {"▔", "FloatBorder"},
  --       {"🭾", "FloatBorder"},
  --       {"▕", "FloatBorder"},
  --       {"🭿", "FloatBorder"},
  --       {"▁", "FloatBorder"},
  --       {"🭼", "FloatBorder"},
  --       {"▏", "FloatBorder"},
  -- }

  -- LSP settings (for overriding per client)
  local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded" }),
  }

  -- To instead override globally
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end


  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        capabilities = capabilities,
        handlers = handlers,
      }
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function ()
      require("rust-tools").setup {
        capabilities = capabilities,
      }
    end
  }
