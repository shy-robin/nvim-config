require('bufferline').setup {
  options = {
    show_close_icon = false,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count)
      return "<" .. count .. ">"
    end,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'center',
        separator = true,
      }
    },
    numbers = function(opts)
      return string.format('%s', opts.raise(opts.ordinal))
    end,
  }
}
