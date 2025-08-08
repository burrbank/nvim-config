return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    max_height = 14,
    floating_window_above_cur_line = false,
    ignore_error = func(err, ctx, config),
  },
}

