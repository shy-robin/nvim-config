local status_ok, wk = pcall(require, 'which-key')

if not status_ok then
  return
end

wk.register(
  {
    H = { ':bprevious<CR>', 'Previous Buffer' },
    L = { ':bnext<CR>', 'Next Buffer' },
    tt = { ':enew<CR>', 'New Buffer' },
    tw = { ':Bdelete this<CR>', 'Delete Buffer' },
    to = { ':Bdelete other<CR>', 'Delete All Buffers Except Current' },
    f = { ':HopChar1<CR>', 'Hop Char1' },
    F = { ':HopChar1CurrentLine<CR>', 'Hop Char1 in current line' },
  }
)

wk.register(
  {
    -- use y/c/d operators in Hop
    f = { ':HopChar1<CR>', 'Hop Char1' },
    F = { ':HopChar1CurrentLine<CR>', 'Hop Char1 in current line' },
  },
  {
    mode = 'o' -- means Operator Pending Mode
  }
)

wk.register(
  {
    q = { ':q<CR>', 'Quit' },
    Q = { ':q!<CR>', 'Quit Force' },
    w = { ':w<CR>', 'Save' },
    l = {
      name = "LSP",
      i = { ":LspInfo<cr>", "Connected Language Servers" },
      k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
      K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
      w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
      W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
      l = {
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
        "List Workspace Folders"
      },
      t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
      d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
      D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
      r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
      R = { '<cmd>Lspsaga rename<cr>', "Rename" },
      a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
      e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
      n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
      N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" }
    },
    f = {
      name = "Telescope",
      f = { ':Telescope find_files<cr>', 'Find files' },
      s = { ':Telescope live_grep<cr>', 'Search text' },
      b = { ':Telescope buffers<cr>', 'Search buffers' },
      o = { ':Telescope oldfiles<cr>', 'Old files' },
      h = { ':Telescope help_tags<cr>', 'Help tags' },
      c = { ':e ~/.config/nvim/init.lua<cr>', 'Open nvim config' },
    },
    z = {
      name = 'Focus mode',
      z = { ':ZenMode<cr>', 'Zen mode' },
      t = { ':Twilight<cr>', 'Twilight' }
    },
    b = {
      name = 'Bufferline',
      b = { ':BufferLinePick<cr>', 'Go to buffer' },
      w = { ':BufferLinePickClose<cr>', 'Close buffer' },
      p = { ':BufferLineTogglePin<cr>', 'Toggle buffer pin' },
    },
    m = { "'", 'Move to mark' }
  },
  {
    prefix = '<leader>',
  }
)
