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

-- START COPYPASTA https://github.com/neovim/neovim/commit/5b04e46d23b65413d934d812d61d8720b815eb1c
local util = require 'vim.lsp.util'
vim.lsp.buf.format = function(options)
  options = options or {}
  local bufnr = options.bufnr or vim.api.nvim_get_current_buf()
  local clients = vim.lsp.buf_get_clients(bufnr)

  if options.filter then
    clients = options.filter(clients)
  elseif options.id then
    clients = vim.tbl_filter(
      function(client) return client.id == options.id end,
      clients
    )
  elseif options.name then
    clients = vim.tbl_filter(
      function(client) return client.name == options.name end,
      clients
    )
  end

  clients = vim.tbl_filter(
    function(client) return client.supports_method 'textDocument/formatting' end,
    clients
  )

  if #clients == 0 then
    vim.notify '[LSP] Format request failed, no matching language servers.'
  end

  local timeout_ms = options.timeout_ms or 1000
  for _, client in pairs(clients) do
    local params = util.make_formatting_params(options.formatting_options)
    local result, err = client.request_sync('textDocument/formatting', params, timeout_ms, bufnr)
    if result and result.result then
      util.apply_text_edits(result.result, bufnr, client.offset_encoding)
    elseif err then
      vim.notify(string.format('[LSP][%s] %s', client.name, err), vim.log.levels.WARN)
    end
  end
end
-- END COPYPASTA

vim.api.nvim_create_augroup('LspFormatting', { clear = true })

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      group = 'LspFormatting',
      callback = function()
        vim.lsp.buf.format {
          timeout_ms = 2000,
          filter = function(clients)
            return vim.tbl_filter(function(client)
              return pcall(function(_client)
                return _client.config.settings.autoFixOnSave or false
              end, client) or false
            end, clients)
          end
        }
      end
    })
  end
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
