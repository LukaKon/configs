local setup, null_ls = pcall(require, 'null-ls')
if(not setup)
then
  print('null-ls not found...')
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
    formatting.prettier,
    formatting.stylua,
    diagnostics.eslint_d,
    formatting.autopep8,
    diagnostics.flake8,
    formatting.isort,
    formatting.taplo,
    diagnostics.hadolint,
    diagnostics.yamllint,
    diagnostics.gitlint,
    formatting.rustfmt,
}

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = sources,
  -- configure format on save
  -- on_attach = function(client, bufnr)
  --       if client.supports_method("textDocument/formatting") then
  --           vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --           vim.api.nvim_create_autocmd("BufWritePre", {
  --               group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --                 vim.lsp.buf.formatting_sync()
    --             end,
    --         })
    --     end
    -- end,
})
