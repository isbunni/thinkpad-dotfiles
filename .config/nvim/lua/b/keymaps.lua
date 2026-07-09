-- ══════════════════════════════════════════════════════════════
--  Keybindings — Kanagawa only, no theme switcher
-- ══════════════════════════════════════════════════════════════

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- ── File tree (nvim-tree) ──────────────────────────────────
map("n", "<leader>e", vim.cmd.NvimTreeToggle,  { desc = "Toggle file tree" })
map("n", "<leader>E", vim.cmd.NvimTreeFocus,   { desc = "Focus file tree" })
map("n", "<leader>c", vim.cmd.NvimTreeCollapse,{ desc = "Collapse file tree" })

-- ── Undo tree ──────────────────────────────────────────────
map("n", "<leader>u", vim.cmd.UndotreeToggle,   { desc = "Toggle undo tree" })

-- ── Lazy (plugin manager) ──────────────────────────────────
map("n", "<leader>L", vim.cmd.Lazy,            { desc = "Open Lazy" })
map("n", "<leader>I", function()
  require("lazy").install()
end, { desc = "Lazy install missing plugins" })

-- ── Telescope (fuzzy finder) ───────────────────────────────
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })
map("n", "<C-f>", function()
  require("telescope.builtin").git_files()
end, { desc = "Git files" })
map("n", "<leader>fs", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep string in project" })

-- ── LSP / Formatting ───────────────────────────────────────
map("n", "<leader>F", vim.lsp.buf.format,      { desc = "Format buffer" })
map("n", "<leader>M", vim.cmd.Mason,           { desc = "Open Mason" })