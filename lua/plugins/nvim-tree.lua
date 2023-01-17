local status_ok, nvimTree = pcall(require, 'nvim-tree')

if not status_ok then
  return
end

nvimTree.setup()

