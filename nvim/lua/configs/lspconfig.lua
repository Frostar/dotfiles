require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ansible-language-server", "clangd", "omnisharp", "gopls", "ts_ls", "terraformls", "yamlls", "bicep" }
vim.lsp.enable(servers)

vim.lsp.config("bicep", {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/bicep-lsp" },
})
