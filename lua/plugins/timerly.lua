return {
  "nvzone/timerly",
  cmd = "TimerlyToggle",
  opts = {
    on_finish = function()
      vim.cmd("silent !echo -e '\\a'")
    end,
  },
}
