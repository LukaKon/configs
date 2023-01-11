local status, bufferline = pcall(require, 'bufferline')
if(not status)
  then
    print('bufferline not found')
    return
end

bufferline.setup({
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. count
    end
  },
  highlights = {
    separator = {
      -- fg = '#lightblue',
      -- bg = '#darkgreen',
    },
    separartor_selected = {
      -- fg = ,
    },
    background = {
      -- fg = ,
      -- bg = ,
    },
    buffer_selected = {
      bold = true,
    },
    fill = {
      -- bg = ,
    },
  },
})

vim.opt.termguicolors = true
