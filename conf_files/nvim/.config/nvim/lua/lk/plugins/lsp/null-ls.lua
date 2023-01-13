local setup, null_ls = pcall(require, 'null-ls')
if(not setup)
then
  print('null-ls not found...')
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local sources = {
    formatting.prettier,
    formatting.stylua,
    diagnostics.eslint_d,
    -- formatting.autopep8,
    diagnostics.fish,
    diagnostics.flake8,
    formatting.isort,
    formatting.taplo,
    diagnostics.hadolint,
    diagnostics.yamllint,
    diagnostics.gitlint,
    formatting.rustfmt,
    formatting.astyle,
    diagnostics.luacheck,

    completion.luasnip,
}

-- to setup format on save
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

null_ls.setup({
  sources = sources,
  -- configure format on save
  on_attach = on_attach
})
