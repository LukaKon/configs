-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
-- local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
-- if not mason_null_ls_status then
--   return
-- end

local servers = {
    -- 'arduino_language_server',
    'omnisharp',
    'clangd',
    'cssls',
    'cssmodules_ls',
    'dockerls',
    'emmet_ls',
    'html',
    'pylsp', -- python
    'rnix',
    'rust_analyzer',
    'sumneko_lua',
    'tailwindcss',
    'texlab',
    'tsserver',
}

local settings = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    -- border = 'rounded',
  },
}

mason.setup(settings)
-- mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = servers,
})
--
-- mason_null_ls.setup({
--  -- list of formatters & linters for mason to install
--   ensure_installed = {
--     "prettier", -- ts/js formatter
--     -- "stylua", -- lua formatter
--     "eslint_d", -- ts/js linter
--   },
-- })
--
