local status, _ = pcall(vim.cmd, 'colorscheme gruvbox')
if not status then
  print('Coloscheme not found!')
  return
end