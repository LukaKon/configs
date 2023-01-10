-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if(not cmp_status)
then
  print('cmp not found')
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if(not luasnip_status)
then
  print('luasnip not found')
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if(not lspkind_status)
then
  print('lspkind not found')
  return
end


-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- previous suggestion
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    -- next suggestion
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- show completion suggestions
    ["<C-Space>"] = cmp.mapping.complete(),
    -- close completion window
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- sources for autocompletion
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' }, -- lsp
      { name = 'buffer' }, -- text within current buffer
      { name = 'path' }, -- file system paths
      { name = 'luasnip' }, -- snippets
      -- { name = 'cmdline' },
      {
        name = 'spell',
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              return true
            end,
        },
        { name = 'nerdfont' },
        { name = 'fish' },
      },
    },
    {
        { name = 'buffer' },
    }
  ),
  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format({
      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',

      maxwidth = 50,
      ellipsis_char = "...",

      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'default',

      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text = "",
        -- Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },
    }),
  },
})

vim.opt.spell = true
vim.opt.spelllang = { 'en_us',}
