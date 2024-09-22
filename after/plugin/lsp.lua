
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'pyright',          -- Language server for Python
  'html',             -- HTML language features
  'cssls',            -- CSS language server
  'jdtls',            -- Java language server
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
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

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
