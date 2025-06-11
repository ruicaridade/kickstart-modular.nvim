return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        styles = {
          italic = false,
          transparency = true,
        },
      }

      vim.cmd.colorscheme 'rose-pine'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  -- {
  --   'zenbones-theme/zenbones.nvim',
  --   dependencies = 'rktjmp/lush.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.zenbones_darken_comments = 45
  --     vim.cmd.colorscheme 'rosebones'
  --   end,
  -- },
}
