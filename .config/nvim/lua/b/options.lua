-- ══════════════════════════════════════════════════════════════
--  Editor Options
-- ══════════════════════════════════════════════════════════════

local o = vim.opt

-- ── Line numbers ───────────────────────────────────────────
o.number = true            -- Show absolute line number on current line
o.relativenumber = true    -- Show relative numbers on all other lines

-- ── Line wrapping ───────────────────────────────────────────
o.wrap = false             -- Don't visually wrap long lines
o.linebreak = true         -- If wrapping were on, break at word boundaries

-- ── Clipboard ───────────────────────────────────────────────
o.clipboard = "unnamedplus" -- Use system clipboard for all yank/delete

-- ── Tabs & indentation ──────────────────────────────────────
o.expandtab = true         -- Use spaces instead of tab characters
o.shiftwidth = 2           -- Indent width for >> and auto-indent
o.tabstop = 2              -- Visual width of a tab character
o.softtabstop = 2          -- Tab key inserts 2 spaces
o.smartindent = true       -- Auto-indent on new lines based on syntax

-- ── Ruler ───────────────────────────────────────────────────
o.textwidth = 80           -- Hard-wrap at 80 columns when formatting
o.colorcolumn = "80"       -- Highlight column 80 as a visual guide
