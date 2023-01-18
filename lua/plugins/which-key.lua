local status_ok, wk = pcall(require, 'which-key')

if not status_ok then
  return
end

wk.register(
  {
    H = { ':bprevious<CR>', 'Previous Buffer' },
    L = { ':bnext<CR>', 'Next Buffer'},
    tt = { ':enew<CR>', 'New Buffer'},
    tw = { ':Bdelete this<CR>', 'Delete Buffer'},
    to = { ':Bdelete other<CR>', 'Delete All Buffers Except Current'},
  },
  {
    prefix = ''
  }
)

wk.register(
  {
    q = { ':q<CR>', 'Quit' },
    w = { ':w<CR>', 'Save' },
  },
  {
    prefix = '<leader>',
  }
)

