local status, bufferline = pcall(require, 'bufferline')
if(not status)
  then
    print('bufferline not found')
    return
end

bufferline.setup({
  options = {
    mode = 'tabs',
    numbers = 'ordinal',
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon', -- | 'underline' | 'none',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 15,
    max_prefix_length = 5,
    truncate_name = true,
    tab_size = 15,
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    enforece_regular_tabs = false,
  },
  highlights = {
    -- separator = {
      -- fg = '#lightblue',
      -- bg = '#darkgreen',
    -- },
    -- separartor_selected = {
      -- fg = ,
    -- },
    -- background = {
      -- fg = ,
      -- bg = ,
    -- },
    buffer_selected = {
      bold = true,
    },
    -- fill = {
      -- bg = ,
    -- },
  },
})

-- vim.opt.termguicolors = true
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {desc = 'Next tab'})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', {desc = 'Previous tab'})
vim.api.nvim_set_keymap('n', 'tp', '<cmd>BufferLinePick<CR>', {desc = '[P]ick tab'})
vim.api.nvim_set_keymap('n', 'tc', '<cmd>BufferLinePickClose<CR>', {desc = 'Pick tab to [C]lose'})
vim.keymap.set('n', 'tx', ':tabclose<CR>', {desc = 'Close current tab'})  -- close current tab

