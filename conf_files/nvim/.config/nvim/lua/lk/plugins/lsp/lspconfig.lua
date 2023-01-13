local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if(not lspconfig_status)
then
  print('lspconfig not found')
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if(not cmp_nvim_lsp_status)
then
  print('cmp_nvim_lsp not found')
  return
end

local typescript_setup, typescript = pcall(require, 'typescript')
if(not typescript_setup)
then
  print('typescript not found')
  return
end

local keymap = vim.keymap

-- enable keybind for available lsp server
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  -- show definition, references
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts, {desc = 'Show definition/refernces'})
  -- got to declaration
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts, {desc = '[G]o to [Declaration]'})
  -- see definition and make edits in window
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts, '[G]oto [D]efinition')
  -- go to implementation
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts, '[G]oto [I]mplementation')
  -- see available code actions
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts, '[C]ode [A]ction')
  -- smart rename
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts, '[R]e[N]ame')
  -- show  diagnostics for line
  keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  -- show diagnostics for cursor
  keymap.set("n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  -- jump to previous diagnostic in buffer
  keymap.set("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts, {desc = 'Jump to previous diagnostic'})
  -- jump to next diagnostic in buffer
  keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts, {desc = '[J]ump to next diagnostic'})
  -- show documentation for what is under cursor
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts, {desc = 'Show documentation for element under cursor'})
  -- see outline on right hand side
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
  -- formatting file
  keymap.set('n', '<leader>rt', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    -- rename file and update imports
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
    -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")
    -- remove unused variables (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")
  end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint =" ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


-- configure tsserver
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rt", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,
  -- do I need 'cmd'?
  cmd = { "typescript-language-server", "--stdio" },
})

-- configure python server
lspconfig.pylsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  -- filetypes = { 'py' },
})

-- configure toml server
lspconfig.taplo.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure html server
lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- configure css server
lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure latex server
lspconfig.texlab.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure markdown server
lspconfig.marksman.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure nix server
lspconfig.rnix.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure rust server
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {},
  }
})


-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        -- library = {
        --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        --   [vim.fn.stdpath("config") .. "/lua"] = true,
        -- },
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
