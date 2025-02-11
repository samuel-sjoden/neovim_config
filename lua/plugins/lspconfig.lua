return {
  "neovim/nvim-lspconfig",

  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup{
      cmd = { "clangd", "--background-index",
        "--compile-commands-dir=."
      }
    }
  end,
}
