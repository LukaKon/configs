local setup, colorizer = pcall(require, 'colorizer')
if(not setup)
then
  print('colorizer not found')
end

colorizer.setup()
