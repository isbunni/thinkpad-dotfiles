-- ══════════════════════════════════════════════════════════════
--  Keybindings
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

-- ── Theme switcher ─────────────────────────────────────────
local themes = { "kanagawa", "gruvbox", "onedark", "tokyonight", "catppuccin" }
local theme_idx = 1

local function apply_theme(name)
  vim.cmd("colorscheme " .. name)
  vim.notify("Theme: " .. name, vim.log.levels.INFO, { title = "Theme" })
end

-- Cycle forward / backward through all themes
map("n", "<leader>tt", function()
  theme_idx = (theme_idx % #themes) + 1
  apply_theme(themes[theme_idx])
end, { desc = "Cycle theme forward" })

map("n", "<leader>ts", function()
  theme_idx = (theme_idx - 2 + #themes) % #themes + 1
  apply_theme(themes[theme_idx])
end, { desc = "Cycle theme backward" })

-- Direct jumps: <leader>tk = kanagawa, tg = gruvbox, to = onedark, tn = tokyonight, tc = catppuccin
for _, t in ipairs(themes) do
  map("n", "<leader>t" .. t:sub(1, 1), function()
    apply_theme(t)
  end, { desc = "Switch to " .. t })
end