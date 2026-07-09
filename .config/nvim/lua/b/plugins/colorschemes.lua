-- ══════════════════════════════════════════════════════════════
--  Colorschemes — Kanagawa default, others for theme switcher
-- ══════════════════════════════════════════════════════════════

return {
  -- Kanagawa — ink-inspired, wave theme (DEFAULT)
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true,
        theme = "wave",
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
      vim.cmd([[colorscheme kanagawa]])
    end,
  },

  -- Gruvbox — warm retro groove
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },

  -- OneDark Pro — clean, Atom-inspired
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
  },

  -- Tokyo Night — deep blue, modern
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = { style = "night" },
  },

  -- Catppuccin — pastel, easy on the eyes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { flavour = "mocha" },
  },
}