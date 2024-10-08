return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Python
        null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.mypy,

        -- C++
        -- null_ls.builtins.formatting.cpplint,
        -- null_ls.builtins.formatting.clang_format.with({
        --   extra_args = {
        --     "-style={BasedOnStyle: Google, AllowShortFunctionsOnASingleLine: None}",
        --   },
        -- }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
