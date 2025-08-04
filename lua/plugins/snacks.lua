return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    -- 🔑 Atalhos
    keys = {
      {
        "<leader>ab",
        function()
          require("snacks").lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>E",
        function()
          require("snacks").explorer()
        end,
        desc = "Open Snacks Explorer",
      },
      {
        "<leader>rN",
        function()
          require("snacks").rename.rename_file()
        end,
        desc = "Fast Rename Current File",
      },
      {
        "<leader>dB",
        function()
          require("snacks").bufdelete()
        end,
        desc = "Delete or Close Buffer  (Confirm)",
      },
      {
        "<leader>pf",
        function()
          require("snacks").picker.files()
        end,
        desc = "Find Files (Snacks Picker)",
      },
      {
        "<leader>pc",
        function()
          require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },
      {
        "<leader>ps",
        function()
          require("snacks").picker.grep()
        end,
        desc = "Grep word",
      },
      {
        "<leader>pws",
        function()
          require("snacks").picker.grep_word()
        end,
        desc = "Search Visual selection or Word",
        mode = { "n", "x" },
      },
      {
        "<leader>pk",
        function()
          require("snacks").picker.keymaps({ layout = "ivy" })
        end,
        desc = "Search Keymaps (Snacks Picker)",
      },
      {
        "<leader>gbr",
        function()
          require("snacks").picker.git_branches({ layout = "select" })
        end,
        desc = "Pick and Switch Git Branches",
      },
      {
        "<leader>th",
        function()
          require("snacks").picker.colorschemes({ layout = "ivy" })
        end,
        desc = "Pick Color Schemes",
      },
      {
        "<leader>vh",
        function()
          require("snacks").picker.help()
        end,
        desc = "Help Pages",
      },
    },

    -- ⚙️ Opções
    opts = {
      lazygit = {
        theme = {
          [241] = { fg = "Special" },
          activeBorderColor = { fg = "MatchParen", bold = true },
          cherryPickedCommitBgColor = { fg = "Identifier" },
          cherryPickedCommitFgColor = { fg = "Function" },
          defaultFgColor = { fg = "None" },
          inactiveBorderColor = { fg = "FloatBorder" },
          optionsTextColor = { fg = "Function" },
          searchingActiveBorderColor = { fg = "MatchParen", bold = true },
          selectedLineBgColor = { bg = "Visual" },
          unstagedChangesColor = { fg = "DiagnosticError" },
        },
      },

      gitbrowse = {},

      terminal = {
        -- open in a vertical split
        direction = "vertical",
        -- open on the right
        size = 80,
        win = {
          style = "terminal",
          hl = {
            Normal = { bg = "none" },
            TermNormal = { bg = "none" },
            TermNormalNC = { bg = "none" },
          },
        },
      },
    },
  },
}
