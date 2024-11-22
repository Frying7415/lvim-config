lvim.plugins = {
  -- Git plugins
  { -- Shows changes from the last commit
    "lewis6991/gitsigns.nvim",
    config = function()
      require ( "gitsigns" ).setup()
      require ( "elijah.plugins_config.gitsigns" ).config()
    end
  },
  { -- During merge conflicts resolve shows differences alongside
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
    },
    enabled = true,
    build = function () require("gitlab.server").build(true) end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,
  },
  -- Coding plugins
  {-- Helps managing surrounding characters around text
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  { -- Lets you "hop" to different characters on the page quick 
    "smoka7/hop.nvim",
    version = "*",
    opts = {},
  },
  { -- Highlights TODO: comments.
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {{
      "<leader>tT",  -- Add this line for your new keybind
      "<cmd>Trouble todo<cr>",
      desc = "Todo List (Trouble)",
    },},
  },
  { -- Opens defenition preview in floating windows
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup()
    end
  },
  { -- Hints while you type
    "ray-x/lsp_signature.nvim",
    config = function()
      require"lsp_signature".setup({})
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      require("elijah.plugins_config.ufo").config()
    end
  },
  -- DataBase plugins

  {"tpope/vim-dadbod"},
  {"kristijanhusak/vim-dadbod-completion"},
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_table_helpers = {
        clickhouse = {
          List = 'SELECT * FROM "{table}" LIMIT 500',
          Columns = 'DESCRIBE TABLE "{table}"',
        }
      }
    end,
  },
  -- Utility plugins
  {'nvim-neotest/neotest'},
  {'nvim-neotest/neotest-python'},
  {
    'wet-sandwich/hyper.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    version = "*",
  },
  {
    "jellydn/hurl.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    ft = "hurl",
    opts = {
      -- Show debugging info
      debug = false,
      -- Show notification on run
      show_notification = false,
      -- Show response in popup or split
      mode = "split",
      -- Default formatter
      formatters = {
        json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
        html = {
          'prettier', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
          '--parser',
          'html',
        },
        xml = {
          'tidy', -- Make sure you have installed tidy in your system, e.g: brew install tidy-html5
          '-xml',
          '-i',
          '-q',
        },
      },
      -- Default mappings for the response popup or split views
      mappings = {
        close = 'q', -- Close the response popup or split view
        next_panel = '<C-n>', -- Move to the next response popup window
        prev_panel = '<C-p>', -- Move to the previous response popup window
      },
    },
    -- keys = {
    --   -- Run API request
    --   { "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
    --   { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
    --   { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
    --   { "<leader>tE", "<cmd>HurlRunnerToEnd<CR>", desc = "Run Api request from current entry to end" },
    --   { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
    --   { "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
    --   -- Run Hurl request in visual mode
    --   { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
    -- },
  }
}
