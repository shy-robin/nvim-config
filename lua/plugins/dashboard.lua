local status_ok, db = pcall(require, 'dashboard')

if not status_ok then
  return
end

db.custom_header = {
  [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
  [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
  [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
  [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
  [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
  [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
}
db.custom_center = {
  {
    icon = '  ',
    desc = 'Find files                 ',
    shortcut = 'SPC f f',
    action ='Telescope find_files'
  },
  {
    icon = '  ',
    desc = 'Search text                ',
    shortcut = 'SPC f s',
    action ='Telescope live_grep'
  },
  {
    icon = '  ',
    desc = 'Recent files               ',
    shortcut = 'SPC f o',
    action ='Telescope oldfiles'
  },
  {
    icon = '  ',
    desc = 'Open config                ',
    shortcut = 'SPC f c',
    action ='edit ~/.config/nvim/init.lua'
  },
  {
    icon = '  ',
    desc = 'Open help                  ',
    shortcut = 'SPC f h',
    action ='Telescope help_tags'
  }
}
db.header_pad = 15
db.center_pad = 2
db.footer_pad = 2
