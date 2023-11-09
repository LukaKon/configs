local status, fidget = pcall(require, "fidget")
if(not status)
then
  print('fidget not found')
  return
end

fidget.setup()
