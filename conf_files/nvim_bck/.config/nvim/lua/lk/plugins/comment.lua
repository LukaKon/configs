local setup, comment = pcall(require, 'Comment')
if(not setup)
then
  print('comment not found')
  return
end

comment.setup()
