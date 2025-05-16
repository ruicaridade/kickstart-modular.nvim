return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function(_, opts)
      local harpoon = require 'harpoon'
      harpoon.setup(opts)

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Harpoon Add' })
      vim.keymap.set('n', '<leader>hl', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon Toggle' })
      vim.keymap.set('n', '<C-t>1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon Select 1' })
      vim.keymap.set('n', '<C-t>2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon Select 2' })
      vim.keymap.set('n', '<C-t>3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon Select 3' })
      vim.keymap.set('n', '<C-t>4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon Select 4' })
      vim.keymap.set('n', '<C-t>5', function()
        harpoon:list():select(5)
      end, { desc = 'Harpoon Select 5' })
    end,
  },
}
