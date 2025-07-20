return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup() -- Initialize harpoon

    -- Keymaps for Harpoon
    local set = vim.keymap.set
    set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add file to Harpoon" })
    set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon menu" })

    -- Jump to files (first 4 slots)
    set("n", "<C-y>", function() harpoon:list():select(1) end, { desc = "Go to Harpoon file 1" })
    set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Go to Harpoon file 2" })
    set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Go to Harpoon file 3" })
    set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Go to Harpoon file 4" })
  end,
}
 
