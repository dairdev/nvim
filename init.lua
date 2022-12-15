require('base')
require('color')
require('plugins')
require('mapping')


-- Testing
require('lspsaga').init_lsp_saga()
require("nvim-surround").setup()
require("nvim-tree").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("null-ls").setup()
require("lsp-colors").setup()
require("aerial").setup()

local opts = { noremap = true, silent = true }

local navic = require("nvim-navic")

local status, nvim_lsp = pcall(require, "lspconfig")

if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  navic.attach(client, bufnr)
end

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
-- Angular
nvim_lsp.angularls.setup {
  on_attach = on_attach,
  filetypes = { "javascript" },
  cmd = { "angular-language-server", "--stdio" }
}

nvim_lsp.sqlls.setup {
  on_attach = on_attach,
  filetypes = { "sql" },
  cmd = { "sql-language-server", "--stdio" }
}

nvim_lsp.html.setup {
  on_attach = on_attach,
  filetypes = { "sql" },
  cmd = { "vscode-html-language-server", "--stdio" }
}

require('nvim-ts-autotag').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
