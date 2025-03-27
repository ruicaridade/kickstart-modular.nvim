-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>\\', ':Neotree git_status<CR>', desc = 'NeoTree Git Status', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          '.git',
          '.github',
          '.gitignore',
          'package-lock.json',
          'yarn.lock',
          'bun.lock',
          'pnpm-lock.yaml',
        },
      },
    },
    close_if_last_window = true,
    popup_border_style = 'rounded',
    window = {
      position = 'float',
    },
  },
}
