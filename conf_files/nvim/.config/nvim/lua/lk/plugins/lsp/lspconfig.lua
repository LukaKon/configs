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
  -- support tagstack C-t jump back
  keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", opts, 'Peek [D]efinition')
  -- go to definition
  keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts, 'Goto [D]efinition')
  -- go to implementation
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts, '[G]oto [I]mplementation')
  -- see available code actions
  keymap.set({"n", "v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts, '[C]ode [A]ction')
  -- smart rename
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts, '[R]e[N]ame')
  -- Show line diagnostics you can pass arugment ++unfocus to make
  -- show_line_diagnsotic float window unfocus
  keymap.set("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<CR>", opts, {desc = '[L]ine diagnostic'})
  -- Show cursor diagnostic
  -- also like show_line_diagnostics  support pass ++unfocus
  keymap.set("n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts, {desc = '[C]ursor diagnostic'})
  -- show buffer diagnostic
  keymap.set('n', '<leader>lb', '<cmd>Lspsaga show_buf_diagnostic<CR>', opts, {desc = 'Show [B]uffor diagnostic'})
  -- jump to previous diagnostic in buffer
  keymap.set("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts, {desc = 'Jump to previous diagnostic'})
  -- jump to next diagnostic in buffer
  keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts, {desc = '[J]ump to next diagnostic'})
  -- jump to previous error
  keymap.set("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
    -- jump to next error
  keymap.set("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)
  -- show documentation for what is under cursor
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts, {desc = 'Show documentation for element under cursor'})
  -- Toggle Outline
  keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", opts, {desc = 'Toggle [O]utline'})

  -- formatting file
  keymap.set(
    'n',
    '<leader>rt',
    '<cmd>lua vim.lsp.buf.format {async=true}<CR>',
    opts,
    {desc = 'Forma[T] file'}
  )

  -- Call hierarchy
  keymap.set(
    "n",
    "<leader>ci",
    "<cmd>Lspsaga incoming_calls<CR>",
    opts,
    {desc = 'Lspsaga: [I]ncoming calls'}
  )
  keymap.set(
    "n",
    "<leader>co",
    "<cmd>Lspsaga outgoing_calls<CR>",
    opts, {desc = 'Lspsaga: [O]utgoing calls'}
  )

  -- Float terminal
  keymap.set({"n", "t"}, "<leader>lt", "<cmd>Lspsaga term_toggle<CR>", opts, {desc = 'Lspsaga [T]erminal'})

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    -- rename file and update imports
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", {desc = 'tsserver: [R]ename [F]ile and update imports'})
    -- organize imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", {desc = 'tsserver: [O]rganize [I]mports'})
    -- remove unused variables
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", {desc = '[R]emove [U]nused variables'})
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
lspconfig.sumneko_lua.setup({
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
