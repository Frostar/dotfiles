require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ansible-language-server", "clangd", "omnisharp", "gopls", "ts_ls", "terraformls", "yamlls" }
vim.lsp.enable(servers)
