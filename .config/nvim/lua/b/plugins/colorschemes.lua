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
  { "ellisonleao/gruvbox.nvim" },

  -- OneDark Pro — clean, Atom-inspired
  { "olimorris/onedarkpro.nvim" },

  -- Tokyo Night — deep blue, modern
  { "folke/tokyonight.nvim", opts = { style = "night" } },

  -- Catppuccin — pastel, easy on the eyes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { flavour = "mocha" },
  },
}