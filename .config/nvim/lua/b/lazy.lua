-- ══════════════════════════════════════════════════════════════
--  Lazy.nvim — Plugin Manager Bootstrap
-- ══════════════════════════════════════════════════════════════

-- Install lazy.nvim if it doesn't exist yet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end

-- Put lazy.nvim on the runtimepath so we can require it
vim.opt.rtp:prepend(lazypath)

-- Load all plugin specs from lua/b/plugins/*.lua
require("lazy").setup({
  spec = { { import = "b.plugins" } },
  install = { colorscheme = { "gruvbox" } }, -- fallback colorscheme during first install
  checker = { enabled = false },              -- don't auto-check for updates
})
