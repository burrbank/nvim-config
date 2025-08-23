require("rhea.harpoon2")
require("peacock").setup()
local ls = require("luasnip")

require("oil").setup({
  view_options = {
    show_hidden=true
  }
})
vim.cmd "colorscheme gruvbox"
vim.cmd "setlocal spell spelllang=en_us mousemodel=popup"

vim.o.tabstop = 2 -- set tab to 4 spaces
vim.o.expandtab = true -- insert spaces instead of tab
vim.o.softtabstop = 2 -- number of spaces to insert with tab
vim.o.shiftwidth = 2 -- number of spaces when indenting
vim.o.title = true
vim.o.wildmenu = true
vim.o.cursorline = true

vim.wo.number = true -- turn on line numbers by default

-- bash fix?

vim.o.shellcmdflag="-c"


--fixes some issue where vim cannot find python
local function system(command)
    local file = assert(io.popen(command, 'r'))
    local output = file:read('*all'):gsub("%s+", "")
    file:close()
    return output

end

if vim.fn.executable("python3") > 0 then
    vim.g.python3_host_prog = system("which python3")
end

local cmp = require("cmp")


-- remaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", "<CMD>Oil<CR>")

-- telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- peacock
local nvim_set_hl = vim.api.nvim_set_hl
-- Apply Peacock color to other UI components
nvim_set_hl(0, "WinSeparator", { link = "PeacockFg" })
nvim_set_hl(0, "FloatBorder", { link = "PeacockFg" })
nvim_set_hl(0, "LineNr", { link = "PeacockFg" })

-- luasnip
--
local luasnip = require("luasnip")
local cmp = require("cmp")

require("luasnip.loaders.from_vscode").load({paths = {"~/.config/nvim/LuaSnip/flask-snippets"}})
require("luasnip.loaders.from_vscode").load({paths = {"~/.config/nvim/LuaSnip/terraform-examples"}})
require("luasnip.loaders.from_vscode").load({paths = {"~/.config/nvim/LuaSnip/vscode-terraform-snippets"}})
require("luasnip.loaders.from_vscode").load({paths = {"~/.config/nvim/LuaSnip/vscode-pyproject-toml-snippets"}})

require("luasnip.loaders.from_vscode").load()

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
    end,
    {silent = true}
)


-- on save delete excess white space
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

require('lualine').setup()

vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}


