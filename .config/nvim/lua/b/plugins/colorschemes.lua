-- ══════════════════════════════════════════════════════════════
--  Colorschemes — Kanagawa only
-- ══════════════════════════════════════════════════════════════

return {
  -- Kanagawa — ink-inspired, wave theme
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
}