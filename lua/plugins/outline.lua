return {
  "hedyhli/outline.nvim",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" }
    )
    vim.keymap.set("n", "<leader>O", "<cmd>OutlineFollow<CR>")

    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
    }
  end,
}
