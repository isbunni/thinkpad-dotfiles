-- ══════════════════════════════════════════════════════════════
--  Telescope — Fuzzy finding for files, git, grep, etc.
-- ══════════════════════════════════════════════════════════════

return {
  "nvim-telescope/telescope.nvim",
  lazy = false,                           -- Load immediately (used on startup)
  dependencies = { "nvim-lua/plenary.nvim" }, -- Required utility library
}
