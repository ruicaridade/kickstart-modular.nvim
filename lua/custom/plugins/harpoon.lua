return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon.setup {}

      vim.keymap.set('n', '<leader>ta', function()
        harpoon:list():add()
      end, { desc = 'Harpoon Add' })
      vim.keymap.set('n', '<leader>tt', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon Toggle' })
      vim.keymap.set('n', '<leader>t1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon Select 1' })
      vim.keymap.set('n', '<leader>t2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon Select 2' })
      vim.keymap.set('n', '<leader>t3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon Select 3' })
      vim.keymap.set('n', '<leader>t4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon Select 4' })
      vim.keymap.set('n', '<leader>t5', function()
        harpoon:list():select(5)
      end, { desc = 'Harpoon Select 5' })
    end,
  },
}
