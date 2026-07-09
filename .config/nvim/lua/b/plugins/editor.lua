-- ══════════════════════════════════════════════════════════════
--  Editor Plugins — Tools that enhance the editing experience
-- ══════════════════════════════════════════════════════════════

return {
  -- ── Auto-pair brackets, quotes, etc. ─────────────────────
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" }, -- Load when entering insert mode
    branch = "v0.6",
    opts = {
      tabout = { enable = true, map = "<Tab>", hopout = true }, -- Tab to jump out of pairs
    },
  },

  -- ── File tree sidebar ─────────────────────────────────────
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,                               -- Load immediately (<leader>e on startup)
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- File type icons
    opts = {},
  },

  -- ── Git diff signs in the gutter ─────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end,
  },

  -- ── Undo tree — visualize your undo history ──────────────
  { "mbbill/undotree" },

  -- ── Harpoon — Quick file navigation ──────────────────────
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- Keymaps registered via lazy's "keys" — harpoon loads when triggered
    keys = {
      { "<leader>a",   function() require("harpoon:list")():add() end, desc = "Harpoon: add file" },
      { "<leader>h",   function() require("harpoon.ui").toggle_quick_menu(require("harpoon:list")()) end, desc = "Harpoon: quick menu" },
      { "<leader>0",   function() require("harpoon:list")():select(1) end, desc = "Harpoon: file 1" },
      { "<leader>9",   function() require("harpoon:list")():select(2) end, desc = "Harpoon: file 2" },
      { "<leader>8",   function() require("harpoon:list")():select(3) end, desc = "Harpoon: file 3" },
      { "<leader>7",   function() require("harpoon:list")():select(4) end, desc = "Harpoon: file 4" },
      { "<leader>6",   function() require("harpoon:list")():select(5) end, desc = "Harpoon: file 5" },
      { "<leader>5",   function() require("harpoon:list")():select(6) end, desc = "Harpoon: file 6" },
      { "<C-S-P>",     function() require("harpoon:list")():prev() end,   desc = "Harpoon: previous file" },
      { "<C-S-N>",     function() require("harpoon:list")():next() end,   desc = "Harpoon: next file" },
    },
  },

  -- ── Dashboard — Custom startup screen ────────────────────
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",                         -- Show on startup
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Red accent for the ASCII art header
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#cc241d" })

      require("dashboard").setup({
        theme = "doom",
        config = {
          -- ASCII art banner (don't touch — too pretty to change)
          header = {
            "                                                          ",
            " ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⠿⠿⢻⣿⣿⣿⣿⣭⣭⣭⣍⣛⡛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢹⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣬⡙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠹⣿⣿⡿⢋⣡⣾⣶⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡙⢿⣿⣿⣿⣿⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⢉⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠹⣿⣿⣿⣿⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⣹⣿⡿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿⣿⣿⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣀⡜⡻⠡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠘⠉⢐⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠘⣿⣿⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⣿⡟⢰⣿⡿⠡⢁⣽⣿⠎⣿⢻⣿⣿⣿⣿⣿⣷⡆⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢹⣿⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⡿⠁⠁⣼⣿⠃⣰⠃⣾⡿⠁⣾⣿⡿⠁⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⡏⣼⡿⠁⠀⠀⣸⠃⢂⢃⠰⡿⠁⢼⣿⠏⢀⣧⢸⣿⣿⣿⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢹⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⣿⢠⣿⠃⡄⠀⠀⡇⣴⠘⡌⡨⢃⠐⢹⠟⠀⢾⣿⡌⣿⣿⣿⡄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⠘⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⡇⣼⠇⠐⠁⡀⠀⠀⢻⠀⣇⠃⢸⠀⡿⠀⠀⠄⢉⠓⠘⢿⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡍⢻⣿⡆⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⣿⠠⣿⣸⠄⡀⠃⠀⡀⢹⣄⣿⣶⣤⣦⡇⢀⠀⠀⠀⠈⠱⠈⢿⣿⢸⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣷⠸⣿⡇⣿⣿⣿",
            " ⣿⣿⣿⣿⣿⡇⣾⣿⣿⢰⣿⣶⣦⣤⠿⣿⣿⣿⣿⣿⣷⣿⠀⠀⡀⠀⣶⠄⠈⢿⡄⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⡄⣿⡇⣿⣿⣿",
            " ⣿⣿⣿⣿⡇⣼⣿⣿⠇⣿⣿⣿⣯⣼⣿⣿⣿⣿⣿⡏⠉⠙⠿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⠁⣾⡟⣿⣿⣿⣿⠸⡇⣿⣿⣿",
            " ⣿⣿⣿⣿⢠⣿⣿⡿⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣇⢹⣿⣿⣿⣿⣿⠀⣿⣷⠸⣿⣿⣿⡇⠇⣿⣿⣿",
            " ⣿⣿⣿⡿⢸⣿⣿⡇⣆⠹⣿⣿⡋⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠛⢸⣿⣿⣿⣿⣿⢰⣿⣿⣧⠹⣿⣿⣷⠀⣿⣿⣿",
            " ⣿⣿⣿⣧⢸⣿⣿⠀⢾⠂⠙⠿⣿⡆⣦⣭⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢡⣎⡶⢸⣿⣿⣿⣿⣿⢸⣿⣿⣿⣧⠹⣿⣿⡆⢿⣿⣿",
            " ⣿⡿⠛⣛⣈⣐⣈⣤⠤⢒⣨⣀⠀⣰⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣋⣴⣶⣿⣿⣿⢸⣿⣿⣿⣿⡿⠀⣿⣿⣿⣿⣷⡘⢿⣷⠸⣿⣿",
            " ⢏⣴⡿⠿⠟⣛⣩⣴⡾⠟⡋⠁⢠⡙⠿⠿⠿⠿⠛⢛⢋⣉⣴⣶⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣌⠻⡆⢻⣿",
            " ⣾⣿⣶⣿⠿⠛⣋⣥⣶⡿⠋⠰⠿⣷⡀⢺⣦⣾⣿⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⡟⢰⣆⠻⣿⣿⣿⣿⣿⣿⣧⡘⠄⢿",
            " ⣿⣿⣤⣶⣾⡿⠟⠋⣁⠠⠈⢸⣷⣶⠆⣬⣭⣭⣥⣶⡆⠙⢿⣿⣿⣿⣿⣿⣿⣿⡟⣀⣿⣿⠏⠠⢀⣉⡃⠘⠿⣿⣿⣿⣿⣿⣿⣦⡈",
            " ⣿⡿⠟⣉⣠⣤⣶⠾⢃⠀⣾⠸⣿⣿⣇⠸⣿⣿⣿⣿⣿⣵⡌⢿⣿⣿⣿⣿⣿⣿⢃⣽⡿⠃⣤⣾⣿⣿⣿⣷⣦⣌⡛⠿⣿⣿⣿⣿⣷",
            " ⣿⣷⣿⠟⢋⢁⢲⣾⣿⡇⢻⠀⣿⣿⣿⣧⠙⣿⣿⣿⣿⣿⣯⢸⣿⣿⣿⣿⣿⠏⣼⠏⣴⠿⢛⣭⣭⣥⣿⣿⣿⣿⣿⣷⣌⠻⣿⣿⣿",
            " ⣿⡏⣰⡆⣿⡌⠸⣿⣿⣿⠸⠀⣿⣿⣿⣿⡄⢹⣿⣿⣿⣿⣿⠤⠛⣿⣿⡿⠏⠰⠃⣨⠴⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠻⣿⣿",
            "                                                          ",
          },

          -- Quick-launch button below the banner
          center = {
            {
              icon_hl = "Title",
              desc = "Find File       ",
              desc_hl = "String",
              keymap = "SPC f f       ",
              key = "f",
              key_hl = "Number",
              key_format = " %s",
              action = "Telescope find_files",
            },
            {
              icon_hl = "Title",
              desc = "File Tree       ",
              desc_hl = "String",
              keymap = "SPC e         ",
              key = "e",
              key_hl = "Number",
              key_format = " %s",
              action = "NvimTreeToggle",
            },
            {
              icon_hl = "Title",
              desc = "Harpoon Menu    ",
              desc_hl = "String",
              keymap = "SPC h         ",
              key = "h",
              key_hl = "Number",
              key_format = " %s",
              action = "lua require(\"harpoon.ui\").toggle_quick_menu(require(\"harpoon:list\")())",
            },
            {
              icon_hl = "Title",
              desc = "Plugin Manager  ",
              desc_hl = "String",
              keymap = "SPC L         ",
              key = "L",
              key_hl = "Number",
              key_format = " %s",
              action = "Lazy",
            },
            {
              icon_hl = "Title",
              desc = "Format Buffer   ",
              desc_hl = "String",
              keymap = "SPC F         ",
              key = "F",
              key_hl = "Number",
              key_format = " %s",
              action = "lua vim.lsp.buf.format()",
            },
            {
              icon_hl = "Title",
              desc = "LSP Mason       ",
              desc_hl = "String",
              keymap = "SPC M         ",
              key = "M",
              key_hl = "Number",
              key_format = " %s",
              action = "Mason",
            },
            {
              icon_hl = "Title",
              desc = "Undo Tree       ",
              desc_hl = "String",
              keymap = "SPC u         ",
              key = "u",
              key_hl = "Number",
              key_format = " %s",
              action = "UndotreeToggle",
            },
          },

          footer = {},
        },
      })
    end,
  },
}
