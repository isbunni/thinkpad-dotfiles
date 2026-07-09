-- ══════════════════════════════════════════════════════════════
--  LSP, Formatting, and Completion
-- ══════════════════════════════════════════════════════════════

return {
  -- ── Mason: LSP server installer ───────────────────────────
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim", -- Bridges mason + lspconfig
      "neovim/nvim-lspconfig",             -- Neovim's built-in LSP client
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        -- Auto-install these language servers
        ensure_installed = { "lua_ls", "clangd" },

        -- Handlers: auto-configure each installed server
        handlers = {
          -- Default: just call setup() with no special settings
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          -- Custom: tell lua_ls about the `vim` global
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- ── None-ls: Formatting via external tools ────────────────
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          -- Web / JS / CSS / HTML / JSON / Markdown / etc.
          require("null-ls").builtins.formatting.prettier.with({
            filetypes = {
              "javascript", "javascriptreact", "typescript", "typescriptreact",
              "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml",
              "markdown", "markdown.mdx", "graphql", "handlebars", "svelte",
              "astro", "htmlangular",
            },
          }),
          -- C / C++
          require("null-ls").builtins.formatting.clang_format,
          -- Lua
          require("null-ls").builtins.formatting.stylua,
          -- Spell completion (for prose/docs)
          require("null-ls").builtins.completion.spell,
        },
      })
    end,
  },

  -- ── Blink.cmp: Completion engine ──────────────────────────
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets", -- Snippet collection
    version = "*",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true, -- Use nvim-cmp highlight groups
        nerd_font_variant = "mono",
      },
    },
  },

  -- Snippet library (loaded silently — used by blink.cmp)
  { "rafamadriz/friendly-snippets" },
}
