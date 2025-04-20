return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },

  config = function()
    -- require("neo-tree").setup({
      -- close_if_last_window = true,
      -- filesystem = {
        -- hijack_netrw_behavior = "disabled",
        -- follow_current_file = {
        --   enabled = false,
        -- },
        -- bind_to_cwd = false,
        -- filtered_items = {
        -- hide_dotfiles = false,
        -- hide_gitignored = false,
        -- },
      -- },
    -- })

    vim.keymap.set("n", "<C-l>", ":Neotree filesystem toggle <CR>", { desc = "Toggle Neo-tree" })
  end,
}
