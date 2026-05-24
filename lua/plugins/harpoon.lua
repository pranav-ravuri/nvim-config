return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,
  keys = function()
    local harpoon = require("harpoon")
    return {
      { "<leader>a", function() harpoon:list():add() end, desc = "Harpoon Add" },
      { "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Menu" },
      { "<C-h>", function() harpoon:list():select(1) end, desc = "Harpoon 1" },
      { "<C-t>", function() harpoon:list():select(2) end, desc = "Harpoon 2" },
      { "<C-n>", function() harpoon:list():select(3) end, desc = "Harpoon 3" },
      { "<C-s>", function() harpoon:list():select(4) end, desc = "Harpoon 4" },
      { "<C-S-P>", function() harpoon:list():prev() end, desc = "Harpoon Prev" },
      { "<C-S-N>", function() harpoon:list():next() end, desc = "Harpoon Next" },
    }
  end,
}
