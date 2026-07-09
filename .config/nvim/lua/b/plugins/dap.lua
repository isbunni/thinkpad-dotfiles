-- ══════════════════════════════════════════════════════════════
--  DAP — Debug Adapter Protocol (C/C++ via GDB)
-- ══════════════════════════════════════════════════════════════

return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    -- Register GDB as a debug adapter
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }

    local map = vim.keymap.set

    -- All debug keymaps use the <Leader> prefix
    map("n", "<Leader>!",  dap.continue,         { desc = "DAP: start/continue" })
    map("n", "<Leader>@",  dap.step_over,        { desc = "DAP: step over" })
    map("n", "<Leader>#",  dap.step_into,        { desc = "DAP: step into" })
    map("n", "<Leader>$",  dap.step_out,         { desc = "DAP: step out" })
    map("n", "<Leader>b",  dap.toggle_breakpoint,{ desc = "DAP: toggle breakpoint" })
    map("n", "<Leader>B",  dap.set_breakpoint,   { desc = "DAP: set breakpoint" })
    map("n", "<Leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "DAP: set log point" })
    map("n", "<Leader>dr", dap.repl.open,        { desc = "DAP: open REPL" })
    map("n", "<Leader>dl", dap.run_last,         { desc = "DAP: run last session" })
    map({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end, { desc = "DAP: inspect variable under cursor" })
  end,
}
