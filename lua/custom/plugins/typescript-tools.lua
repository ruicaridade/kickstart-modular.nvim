return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      tsserver_plugins = {
        '@styled/typescript-styled-plugin',
      },
      tsserver_file_preferences = {
        importModuleSpecifierPreference = 'non-relative',
      },
    },
  },
}
