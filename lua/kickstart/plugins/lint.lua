local function setup_javascript_lint(lint)
  local js_linter = nil

  -- Check if biome or eslint is available in the project
  local cwd = vim.fn.getcwd()
  local biome_config = vim.fn.glob(cwd .. '/biome.json*', false, true)
  local eslint_config = vim.fn.glob(cwd .. '/.eslintrc*', false, true)

  -- Also check for package.json configs
  local package_json = cwd .. '/package.json'
  if vim.fn.filereadable(package_json) == 1 then
    local content = vim.fn.readfile(package_json)
    local package_str = table.concat(content, '\n')

    if not vim.tbl_isempty(biome_config) or string.match(package_str, '"@biomejs/biome"') then
      js_linter = 'biomejs'
    elseif not vim.tbl_isempty(eslint_config) or string.match(package_str, '"eslint"') then
      js_linter = 'eslint'
    end
  end

  -- If a JavaScript linter is available, set it for the relevant filetypes
  if js_linter then
    local js_fts = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'json',
    }

    for _, ft in ipairs(js_fts) do
      lint.linters_by_ft[ft] = { js_linter }
    end
  end
end

return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {}
      setup_javascript_lint(lint)

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
