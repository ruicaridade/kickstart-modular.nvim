return {
  -- {
  --   lazy = false,
  --   'github/copilot.vim',
  -- },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   dependencies = {
  --     { 'github/copilot.vim' },
  --     { 'nvim-lua/plenary.nvim', branch = 'master' },
  --   },
  --   build = 'make tiktoken',
  --   keys = {
  --     {
  --       '<leader>cct',
  --       function()
  --         require('CopilotChat').toggle()
  --       end,
  --       mode = '',
  --       desc = '[C]opilot [C]hat [T]oggle',
  --     },
  --     {
  --       '<leader>ccr',
  --       function()
  --         require('CopilotChat').reset()
  --       end,
  --       mode = '',
  --       desc = '[C]opilot [C]hat [R]eset',
  --     },
  --   },
  --   opts = {
  --     model = 'claude-3.7-sonnet',
  --     chat_autocomplete = true,
  --   },
  -- },
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  opts = {
    provider = 'copilot',
  },
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      opts = {
        suggestion = {
          auto_trigger = true,
        },
        copilot_model = 'gpt-4o-copilot',
      },
    },
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
