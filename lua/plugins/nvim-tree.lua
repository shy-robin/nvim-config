require('nvim-tree').setup {
  view = {
    adaptive_size = true,
    signcolumn = 'yes'
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  git = {
    ignore = false,
  },
  modified = {
    enanble = true
  },
  log = {
    enable = true,
    truncate = true,
    types = {
      diagnostics = true,
    }
  }
}
