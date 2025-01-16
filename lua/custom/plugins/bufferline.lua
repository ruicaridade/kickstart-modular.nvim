return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Nvim Tree',
            separator = false,
            text_align = 'left',
          },
        },
        diagnostics = 'nvim_lsp',
      },
    }

    vim.keymap.set('n', '<tab>', ':BufferLineCycleNext<CR>', { desc = 'Tab: Cycle Next' })
    vim.keymap.set('n', '<leader>X', ':BufferLinePickClose<CR>', { desc = 'Tab: Pick Close' })
  end,
}
