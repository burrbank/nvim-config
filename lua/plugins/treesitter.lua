return {
  "nvim-treesitter/nvim-treesitter",
  event = {"BufReadPre", "BufNewFile"},
  build = ":TSUpdate",
  dependencies = {"windwp/nvim-ts-autotag"},
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup(
        {
            highlight = {
                enable=true,
                additional_vim_regex_highlighting=false
            },
            auto_install = true,
            indent = {enable = true},
            autotag = {enable = true},
            ensure_installed = {
                "json",
                "yaml",
                "toml",
                "markdown",
                "html",
                "css",
                "javascript",
                "python",
                "c",
                "bash",
                "dockerfile",
                "vim",
                "lua",
                "vimdoc",
                "terraform",
                "zig",
            }
        }
    )

  end
}

