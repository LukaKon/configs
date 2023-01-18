-- import lspsaga safely
local status, saga = pcall(require, 'lspsaga')
if(not status)
then
  print('lspsaga not found')
  return
end

saga.setup({
 preview = {
    lines_above = 3,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = '<C-j>',
    scroll_up = '<C-k>',
  },
  request_timeout = 2000,
  finder = {
    edit = {'o', '<CR>'},
    vsplit = 's',
    split = 'i',
    tabe = 't',
    quit = {'q', '<ESC>'},
  },
  definition = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
    close = '<ESC>',
  },
  code_action = {
    num_shortcut = true,
    keys = {
      quit = 'q',
      exec = '<CR>',
    },
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  diagnostic = {
    twice_into = false,
    show_code_action = true,
    show_source = true,
    keys = {
      exec_action = 'o',
      quit = 'q',
      go_action = 'g'
    },
  },
  rename = {
    quit = '<C-c>',
    exec = '<CR>',
    in_select = true,
  },
   outline = {
    win_position = 'right',
    win_with = '',
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = 'o',
      expand_collapse = 'u',
      quit = 'q',
    },
  },
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = 'e',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      jump = 'o',
      quit = 'q',
      expand_collapse = 'u',
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = ' ',
    -- separator = '> ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
  },
  ui = {
    -- currently only round theme
    theme = 'round',
    -- border type can be single,double,rounded,solid,shadow.
    border = 'solid',
    winblend = 95,
    expand = '',
    collapse = '',
    preview = ' ',
    -- code_action = '💡',
    code_action = '',
    diagnostic = '🐞',
    incoming = ' ',
    outgoing = ' ',
    colors = {
      --float window normal bakcground color
      normal_bg = '#1d1536',
      --title background color
      title_bg = '#afd700',
      red = '#e95678',
      magenta = '#b33076',
      orange = '#FF8700',
      yellow = '#f7bb3b',
      green = '#afd700',
      cyan = '#36d0e0',
      blue = '#61afef',
      purple = '#CBA6F7',
      white = '#d1d4cf',
      black = '#1c1c19',
    },
    kind = {},
  },
})
-- saga.init_lsp_saga({
--   -- border style
--   border_style = 'rounded',
--   -- background transparecy
--   saga_winblend = 20,
--   -- keybinds for navigation in lspsaga window
--   move_in_saga = { prev = '<C-k>', next = 'C-j>'},
--   -- Error, Warn, Info, Hint
--   -- diagnostic_header = { " ", " ", " ", " " }, -- <- default
--   diagnostic_header = { "✘ ", "▲ ", " ", "⚑ " }, 
--   -- diagnostic_header = { "🔴 ", "🟡 ", "🔵 ", "🟢 " }, 
--   -- diagnostic_header = { "😡", "😥", "😤", "😐" },
--   -- preview lines above of lsp_finder
--   preview_lines_above = 3,
--   -- preview lines of lsp_finder and definition preview
--   max_preview_lines = 10,
--   -- use emoji lightbulb in default
--   code_action_icon = "",
--   -- if true can press number to execute the codeaction in codeaction window
--   code_action_num_shortcut = true,
--   -- same as nvim-lightbulb but async
--   code_action_lightbulb = {
--       enable = true,
--       enable_in_insert = true,
--       cache_code_action = true,
--       sign = true,
--       update_time = 150,
--       sign_priority = 20,
--       virtual_text = true,
--   },
--   -- finder icons
--   finder_icons = {
--     def = '  ',
--     ref = '諭 ',
--     link = '🔗  ', --  ',
--   },
--   -- finder do lsp request timeout
--   -- if your project big enough or your server very slow
--   -- you may need to increase this value
--   finder_request_timeout = 2000,
--   finder_action_keys = {
--       open = {'o', '<CR>'},
--       vsplit = 's',
--       split = 'i',
--       tabe = 't',
--       quit = {'q', '<ESC>'},
--   },
--   code_action_keys = {
--       quit = 'q',
--       exec = '<CR>',
--   },
--   definition_action_keys = {
--     edit = '<C-c>o',
--     vsplit = '<C-c>v',
--     split = '<C-c>i',
--     tabe = '<C-c>t',
--     quit = 'q',
--   },
--   rename_action_quit = '<C-c>',
--   rename_in_select = true,
--   -- show symbols in winbar must nightly
--   -- in_custom mean use lspsaga api to get symbols
--   -- and set it to your custom winbar or some winbar plugins.
--   -- if in_cusomt = true you must set in_enable to false
--   symbol_in_winbar = {
--       in_custom = false,
--       enable = true,
--       separator = ' ',
--       show_file = true,
--       -- define how to customize filename, eg: %:., %
--       -- if not set, use default value `%:t`
--       -- more information see `vim.fn.expand` or `expand`
--       -- ## only valid after set `show_file = true`
--       file_formatter = "",
--       click_support = false,
--   },
--   -- show outline
--   show_outline = {
--     win_position = 'right',
--     --set special filetype win that outline window split.like NvimTree neotree
--     -- defx, db_ui
--     win_with = '',
--     win_width = 40,
--     auto_enter = true,
--     auto_preview = true,
--     virt_text = '┃',
--     jump_key = 'o',
--     -- auto refresh when change buffer
--     auto_refresh = true,
--   },
--   -- custom lsp kind
--   -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
--   custom_kind = {},
--   -- if you don't use nvim-lspconfig you must pass your server name and
--   -- the related filetypes into this table
--   -- like server_filetype_map = { metals = { "sbt", "scala" } }
--   server_filetype_map = {},
-- })
