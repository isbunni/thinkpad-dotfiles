-- ══════════════════════════════════════════════════════════════
--  Treesitter — Syntax highlighting + indentation
-- ══════════════════════════════════════════════════════════════

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",         -- Auto-update parsers on build
  lazy = false,                -- Load immediately (needed for proper highlighting)
  opts = {
    -- Languages we actually write in — installed automatically
    ensure_installed = { "cpp", "c", "lua", "vim", "vimdoc", "bash" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false, -- Disable old regex-based highlighting
    },
    indent = { enable = true }, -- Auto-indent based on syntax trees
  },
}
