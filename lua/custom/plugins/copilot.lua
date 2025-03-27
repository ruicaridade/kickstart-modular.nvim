return {
  {
    lazy = false,
    'github/copilot.vim',
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    keys = {
      {
        '<leader>cct',
        function()
          require('CopilotChat').toggle()
        end,
        mode = '',
        desc = '[C]opilot [C]hat [T]oggle',
      },
      {
        '<leader>ccr',
        function()
          require('CopilotChat').reset()
        end,
        mode = '',
        desc = '[C]opilot [C]hat [R]eset',
      },
    },
    opts = {
      model = 'claude-3.7-sonnet',
      chat_autocomplete = true,
    },
  },
}
