return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_after_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
        return {
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports', 'gofmt' },
        templ = { 'templ' },
        css = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        html = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        javascript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        astro = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        json = { 'biome', 'prettierd', 'prettier' },
        python = { 'black', 'isort' },
        cs = { 'csharpier' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        zig = { 'zigfmt' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        sql = { 'sql_formatter' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
