return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('pyright')
        vim.lsp.enable('gopls')
        vim.lsp.enable('terraform_lsp')
        vim.lsp.enable('dockerls')
        vim.lsp.enable('zls')
        vim.lsp.enable('ccls')
        vim.lsp.enable('jinja_lsp')
        vim.lsp.enable('gdscript')
  end,
    dependencies = {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    }
}
