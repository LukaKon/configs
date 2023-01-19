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
