return {
  "hampushauffman/peacock.nvim",
  lazy = false,
  config = function()
    require("peacock").setup({
        colors = { -- Colors that you'd like to use instead of the defaults.
            "#fca5a5",
            "#fdba74",
            "#fcd34d",
            "#fde047",
            "#bef264",
            "#86efac",
            "#6ee7b7",
            "#5eead4",
            "#67e8f9",
            "#7dd3fc",
            "#93c5fd",
            "#a5b4fc",
            "#c4b5fd",
            "#d8b4fe",
            "#f0abfc",
            "#f9a8d4",
            "#fda4af",
        },
        bar_enabled = true, -- When this is enabled (default) the left most window will show its signcolumn with the project color.
        sign_column_width = 1, -- This is the width of the bar sowhing in the left most window.
        eob_enabled = true,
    })
  end,
}
