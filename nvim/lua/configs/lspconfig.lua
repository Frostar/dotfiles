require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ansible-language-server", "clangd" }
vim.lsp.enable(servers)
