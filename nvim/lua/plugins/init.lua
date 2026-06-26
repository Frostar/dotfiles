return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },


  -- Rust: rustaceanvim wraps rust-analyzer (inlay hints, runnables, macro
  -- expand, cargo integration). Do NOT also add rust_analyzer to the servers
  -- list in configs/lspconfig.lua — this plugin owns the client.
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false, -- plugin sets up its own filetype hooks
    init = function()
      -- Reuse NvChad's completion capabilities. LSP keymaps are applied
      -- automatically via NvChad's global LspAttach autocmd.
      vim.g.rustaceanvim = {
        server = {
          capabilities = require("nvchad.configs.lspconfig").capabilities,
        },
      }
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
        virt_text_pos = "eol",
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local map = vim.keymap.set

        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Next git hunk" })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Prev git hunk" })

        map("n", "<leader>ph", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
        map("n", "<leader>rh", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
        map("n", "<leader>rb", gs.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
        map("n", "<leader>td", gs.toggle_deleted, { buffer = bufnr, desc = "Toggle deleted" })
      end,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
  	opts = {
      ensure_installed = {
  	    "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "gomod",
        "gosum",
        "typescript",
        "javascript",
        "tsx",
        "terraform",
        "hcl",
        "bicep",
        "rust",
        "toml"
  	  },
  	},
  },

  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false,
          accept_word = "<C-Right>",
          accept_line = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        yaml = true,
        terraform = true,
        hcl = true,
        bicep = true,
        help = false,
      },
    },
  },

  -- Remove Tab from cmp so Copilot can use it
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.mapping["<Tab>"] = nil
      opts.mapping["<S-Tab>"] = nil
      return opts
    end,
  },

  -- Sidekick: Copilot Next Edit Suggestions + AI CLI terminal
  {
    "folke/sidekick.nvim",
    event = "VeryLazy",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = {
      nes = { enabled = true },
    },
    keys = {
      {
        "<Tab>",
        function()
          if require("sidekick").nes_jump_or_apply() then
            return
          end
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
            return
          end
          -- no AI suggestion: in normal mode go to next buffer; in insert mode emit a real Tab
          if vim.fn.mode() == "n" then
            vim.schedule(function()
              require("nvchad.tabufline").next()
            end)
            return ""
          end
          return "<Tab>"
        end,
        mode = { "i", "n" },
        expr = true,
        desc = "Sidekick NES → Copilot → next buffer/Tab",
      },
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick toggle CLI",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").select() end,
        desc = "Sidekick pick CLI",
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "v" },
        desc = "Sidekick prompt",
      },
    },
  },

  -- Telescope: make ripgrep follow symbolic links so live_grep / find_files
  -- can search into symlinked directories (rg skips them by default).
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = opts.defaults or {}
      opts.defaults.vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "-L", -- follow symbolic links
      }

      opts.pickers = opts.pickers or {}
      opts.pickers.find_files = {
        find_command = { "rg", "--files", "--hidden", "-L", "--glob", "!**/.git/*" },
      }

      return opts
    end,
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    cmd = "CopilotChat",
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "Explain selection" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = "v", desc = "Fix selection" },
      { "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = "v", desc = "Review selection" },
    },
    opts = {},
  },

}
