local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
    {exe = "black", filetypes = {"python"} },
    {exe = "isort", filetypes = {"python"} },

  })

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8" ,filetypes = {"python"}},
}
