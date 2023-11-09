local setup, indent_blankline = pcall(require, "indent_blankline")
if(not setup)
then
  print('indent_blankline not found')
  return
end

indent_blankline.setup({
  char = '┊',
  show_trailing_blankline_indent = false,
})
