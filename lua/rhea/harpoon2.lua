local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)
vim.keymap.set("n", "<leader>d", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>qq", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>ww", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>ee", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>rr", function() harpoon:list():select(4) end)

