return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-python' {
          dap = {
            env = {
              PYTHONASYNCIODEBUG = '1',
            },
            pytest_discover_instances = true,
            args = { '--log-level', 'DEBUG' },
          },
        },
      },
    }
  end,
  keys = {
    {
      '<leader>dnt',
      function()
        require('neotest').run.run { strategy = 'dap' }
      end,
      desc = 'Debug: Nearest Test',
    },
  },
}
