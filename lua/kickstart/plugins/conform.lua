local function get_js_formatter()
  local cwd = vim.fn.getcwd()
  local biome_config = vim.fn.glob(cwd .. '/biome.json*', false, true)
  local prettier_config = vim.fn.glob(cwd .. '/.prettier*', false, true)

  local package_json = cwd .. '/package.json'
  if vim.fn.filereadable(package_json) == 1 then
    local content = vim.fn.readfile(package_json)
    local package_str = table.concat(content, '\n')

    if not vim.tbl_isempty(biome_config) or string.match(package_str, '"@biomejs/biome"') then
      return { 'biome', 'biome-organize-imports' }
    elseif not vim.tbl_isempty(prettier_config) or string.match(package_str, '"prettier"') then
      return { 'prettier' }
    end
  end

  return { 'prettier' }
end

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
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        local disable_filetypes = { c = true, cpp = true, sql = true }
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
        go = { 'goimports', 'gofmt', 'golines' },
        templ = { 'templ' },
        css = { 'biome', 'prettier', stop_after_first = true },
        html = { 'biome', 'prettier', stop_after_first = true },
        javascript = get_js_formatter(),
        javascriptreact = get_js_formatter(),
        typescript = get_js_formatter(),
        typescriptreact = get_js_formatter(),
        json = { 'biome', 'prettier', stop_after_first = true },
        jsonc = { 'biome', 'prettier', stop_after_first = true },
        astro = { 'biome', 'prettier', stop_after_first = true },
        python = { 'black', 'isort' },
        cs = { 'csharpier' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        zig = { 'zigfmt' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        ruby = { 'rubocop' },
        eruby = { 'erb_format' },
        php = { 'php_cs_fixer' },
        terraform = { 'terraform_fmt' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
