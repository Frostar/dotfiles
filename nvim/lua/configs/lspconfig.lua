require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ansible-language-server", "clangd", "csharp-ls", "gopls" }
vim.lsp.enable(servers)
