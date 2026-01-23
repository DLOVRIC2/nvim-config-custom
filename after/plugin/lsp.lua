local lsp_zero = require('lsp-zero')

-- Configure keybindings to be set when LSP attaches to a buffer
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- 'gd' in normal mode: Go to the definition of the symbol under the cursor.
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  -- 'K' in normal mode: Show hover information (like documentation or type info) for the symbol under the cursor.
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

  -- '<leader>vws' in normal mode: Search for a symbol across the whole workspace.
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)

  -- '<leader>vd' in normal mode: Open a floating window with diagnostic information (errors, warnings) for the current line.
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

  -- '[d' in normal mode: Go to the next diagnostic (error or warning).
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)

  -- ']d' in normal mode: Go to the previous diagnostic.
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

  -- '<leader>vca' in normal mode: Show code actions for the current cursor position or text selection (like quick fixes or refactorings).
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

  -- '<leader>vrr' in normal mode: Show references (e.g., usage in other files) for the symbol under the cursor.
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)

  -- '<leader>vrn' in normal mode: Rename the symbol under the cursor across the entire workspace.
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

  -- '<C-h>' in insert mode: Show signature help (information about function parameters) while typing.
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Setup Mason (LSP installer)
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'pyright',          -- Language server for Python
    'ts_ls',            -- TypeScript/JavaScript language server
    'html',             -- HTML language features
    'cssls',            -- CSS language server
  },
  handlers = {
    -- Default handler for all servers
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

-- Setup nvim-cmp (autocompletion)
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'buffer'},
    {name = 'path'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Diagnostic configuration (virtual_text hidden by default)
vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.HINT] = 'H',
      [vim.diagnostic.severity.INFO] = 'I',
    },
  },
})

-- Toggle inline diagnostics
local diagnostics_visible = false
vim.keymap.set('n', '<leader>td', function()
  diagnostics_visible = not diagnostics_visible
  vim.diagnostic.config({ virtual_text = diagnostics_visible })
end, { desc = 'Toggle inline diagnostics' })
