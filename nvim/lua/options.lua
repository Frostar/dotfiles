require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorline = true
o.cursorlineopt = 'both' -- to enable cursorline!

o.smartindent = true
o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.smarttab = true
o.expandtab = true

o.incsearch = true

-- Whitespace rendering
o.list = true
vim.opt.listchars = {
  space = '·',
  tab = '→ ',
  trail = '·',
  extends = '›',
  precedes = '‹',
  nbsp = '␣',
}

-- Auto-reload files changed outside of Neovim
o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
})

-- Open NvimTree when launching without a file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
      require("nvim-tree.api").tree.open()
    end
  end,
})

-- NvimTree git colors
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#e06c75" })   -- red (unstaged)
vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#98c379" })  -- green (staged)
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#d19a66" })     -- orange (untracked)
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#e06c75" }) -- red (deleted)
vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#c678dd" })   -- purple (conflict)
vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#61afef" }) -- blue (renamed)
vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#5c6370" }) -- gray (ignored)
