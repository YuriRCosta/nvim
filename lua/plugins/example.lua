-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "yioneko/nvim-vtsls", -- Plugin otimizado para TypeScript
    },
    opts = {
      servers = {
        vtsls = {
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true, -- Usa a versão do TypeScript do projeto
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true, -- Melhora a velocidade da autocompletação
                },
              },
              tsserver = {
                disableAutomaticTypeAcquisition = true, -- Evita sobrecarga de downloads automáticos de tipos
                maxTsServerMemory = 4096, -- Aloca mais memória para TypeScript (útil para monorepos)
              },
            },
          },
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false -- Evita conflitos com Prettier

            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true, buffer = bufnr }

            keymap("n", "<leader>co", "VtsExec organize_imports", opts)
            keymap("n", "<leader>cR", "VtsExec rename_file", opts)
            keymap("n", "<C-g>", vim.diagnostic.goto_next, opts)
            keymap("n", "<C-e>", function()
              vim.diagnostic.goto_next({
                severity = vim.diagnostic.severity.ERROR,
              })
            end, opts)
          end,
        },
        gopls = {
          keys = {
            -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
            { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
          },
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
        --
        -- gopls = {
        --   gofumpt = true,
        --   codelenses = {
        --     gc_details = false,
        --     generate = true,
        --     regenerate_cgo = true,
        --     run_govulncheck = true,
        --     test = true,
        --     tidy = true,
        --     upgrade_dependency = true,
        --     vendor = true,
        --   },
        --   hints = {
        --     assignVariableTypes = true,
        --     compositeLiteralFields = true,
        --     compositeLiteralTypes = true,
        --     constantValues = true,
        --     functionTypeParameters = true,
        --     parameterNames = true,
        --     rangeVariableTypes = true,
        --   },
        --   analyses = {
        --     fieldalignment = true,
        --     nilness = true,
        --     unusedparams = true,
        --     unusedwrite = true,
        --     useany = true,
        --   },
        --   usePlaceholders = true,
        --   completeUnimported = true,
        --   staticcheck = true,
        --   directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        --   semanticTokens = true,
        -- },
      },
    },
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     "jose-elias-alvarez/typescript.nvim",
  --     init = function()
  --       require("lazyvim.util").lsp.on_attach(function(_, buffer)
  --         -- stylua: ignore
  --         vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
  --         vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
  --       end)
  --     end,
  --   },
  --   ---@class PluginLspOpts
  --   opts = {
  --     servers = {
  --       gopls = {
  --         keys = {
  --           -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
  --           { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
  --         },
  --         settings = {
  --           gopls = {
  --             gofumpt = true,
  --             codelenses = {
  --               gc_details = false,
  --               generate = true,
  --               regenerate_cgo = true,
  --               run_govulncheck = true,
  --               test = true,
  --               tidy = true,
  --               upgrade_dependency = true,
  --               vendor = true,
  --             },
  --             hints = {
  --               assignVariableTypes = true,
  --               compositeLiteralFields = true,
  --               compositeLiteralTypes = true,
  --               constantValues = true,
  --               functionTypeParameters = true,
  --               parameterNames = true,
  --               rangeVariableTypes = true,
  --             },
  --             analyses = {
  --               fieldalignment = true,
  --               nilness = true,
  --               unusedparams = true,
  --               unusedwrite = true,
  --               useany = true,
  --             },
  --             usePlaceholders = true,
  --             completeUnimported = true,
  --             staticcheck = true,
  --             directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
  --             semanticTokens = true,
  --           },
  --         },
  --       },
  --       tsserver = {
  --         on_attach = function(client, bufnr)
  --           -- Desativa a formatação automática do tsserver, pois usamos o Prettier
  --           client.server_capabilities.documentFormattingProvider = false
  --
  --           -- Configurações de atalhos para navegação entre diagnósticos
  --           local keymap = vim.keymap.set
  --           local opts = { noremap = true, silent = true, buffer = bufnr }
  --
  --           keymap("n", "<C-g>", vim.diagnostic.goto_next, opts)
  --           keymap("n", "<C-e>", function()
  --             vim.diagnostic.goto_next({
  --               severity = vim.diagnostic.severity.ERROR,
  --             })
  --           end, opts)
  --         end,
  --       },
  --     },
  --     setup = {
  --       gopls = function(_, opts)
  --         -- workaround for gopls not supporting semanticTokensProvider
  --         -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
  --         require("lazyvim.util").lsp.on_attach(function(client, _)
  --           if client.name == "gopls" then
  --             if not client.server_capabilities.semanticTokensProvider then
  --               local semantic = client.config.capabilities.textDocument.semanticTokens
  --               client.server_capabilities.semanticTokensProvider = {
  --                 full = true,
  --                 legend = {
  --                   tokenTypes = semantic.tokenTypes,
  --                   tokenModifiers = semantic.tokenModifiers,
  --                 },
  --                 range = true,
  --               }
  --             end
  --           end
  --         end)
  --         -- end workaround
  --         return opts
  --       end,
  --       eslint = function(_, opts)
  --         opts.on_attach = function(client)
  --           client.server_capabilities.diagnostics = false
  --         end
  --       end,
  --     },
  --   },
  -- },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  -- { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
      local function get_timerly_status()
        local state = require("timerly.state")
        if state.progress == 0 then
          return ""
        end

        local total = math.max(0, state.total_secs + 1) -- Add 1 to sync with timer display
        local mins = math.floor(total / 60)
        local secs = total % 60

        return string.format("%s %02d:%02d", state.mode:gsub("^%l", string.upper), mins, secs)
      end

      table.insert(opts.sections.lualine_x, get_timerly_status)
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
        lualine_c = { "harpoon2" },
      }
    end,
  },

  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "goimports",
        "gofumpt",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
