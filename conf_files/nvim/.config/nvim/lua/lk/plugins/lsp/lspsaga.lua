-- import lspsaga safely
local saga_status, saga = pcall(require, 'lspsaga')
if(not saga_status)
then
  print('saga not found')
  return
end


saga.init_lsp_saga({
  -- border style
  border_style = 'rounded',
  -- background transparecy
  saga_winblend = 20,
  -- keybinds for navigation in lspsaga window
  move_in_saga = { prev = '<C-k>', next = 'C-j>'},
  -- Error, Warn, Info, Hint
  -- diagnostic_header = { " ", " ", " ", "ﴞ " }, -- <- default
  diagnostic_header = { "🔴 ", "🟡 ", "🔵 ", "🟢 " }, 
  -- diagnostic_header = { "😡", "😥", "😤", "😐" },
  -- preview lines above of lsp_finder
  preview_lines_above = 3,
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
  -- use emoji lightbulb in default
  code_action_icon = "💡",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
      enable = true,
      enable_in_insert = true,
      cache_code_action = true,
      sign = true,
      update_time = 150,
      sign_priority = 20,
      virtual_text = true,
  },
  -- finder icons
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '🔗  ', --  ',
  },
  -- finder do lsp request timeout
  -- if your project big enough or your server very slow
  -- you may need to increase this value
  finder_request_timeout = 1500,
  finder_action_keys = {
      open = {'o', '<CR>'},
      vsplit = 's',
      split = 'i',
      tabe = 't',
      quit = {'q', '<ESC>'},
  },
  code_action_keys = {
      quit = 'q',
      exec = '<CR>',
  },
  definition_action_keys = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
  },
  rename_action_quit = '<C-c>',
  rename_in_select = true,
  -- show symbols in winbar must nightly
  -- in_custom mean use lspsaga api to get symbols
  -- and set it to your custom winbar or some winbar plugins.
  -- if in_cusomt = true you must set in_enable to false
  symbol_in_winbar = {
      in_custom = false,
      enable = true,
      separator = ' ',
      show_file = true,
      -- define how to customize filename, eg: %:., %
      -- if not set, use default value `%:t`
      -- more information see `vim.fn.expand` or `expand`
      -- ## only valid after set `show_file = true`
      file_formatter = "",
      click_support = false,
  },
  -- show outline
  show_outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 40,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- custom lsp kind
  -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
  custom_kind = {},
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
  server_filetype_map = {},
})
