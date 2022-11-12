local setup, gitsigns = pcall(require, 'gitsigns')
if(not setup)
then
  print('gitsigns not found')
  return
end

gitsigns.setup()
