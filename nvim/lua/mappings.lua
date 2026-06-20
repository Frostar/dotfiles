require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Toggle focus between NvimTree and previous window
map("n", "<leader>e", function()
  if vim.bo.filetype == "NvimTree" then
    vim.cmd("wincmd p")
  else
    require("nvim-tree.api").tree.focus()
  end
end, { desc = "Toggle NvimTree focus" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
