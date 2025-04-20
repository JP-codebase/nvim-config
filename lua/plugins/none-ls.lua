return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      on_attach = function(client, bufnr)
        -- Force null-ls to use UTF-8 to match clangd.
        -- client.positionEncoding = { "utf-8" }
      end,

      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Python
        null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.mypy,

        -- C++
        -- null_ls.builtins.formatting.clang_format.with({
        --   extra_args = {
            -- "--style",
            -- "file:/home/gianpaolosantarsiero/.config/clangd/.clang-format",
            -- "--fail-on-incomplete-format",
            -- "--fallback-style",
            -- "Mozilla",
        --   },
        -- }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    -- vim.keymap.set("n", "<leader>gf", function()
    --   vim.lsp.buf.format({
    --     filter = function(client)
    --       return client.name == "null-ls"
    --     end,
    --   })
    -- end, {})
  end,
}
