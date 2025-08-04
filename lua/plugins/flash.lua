return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = true,
        keys = { ";" },
      },
    },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, false },
    {
      ";",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          mode = "char",
          search = {
            wrap = true, -- permite busca contínua (volta se estiver no fim)
          },
        })
      end,
      desc = "Flash Jump bidirectional",
    },
  },
}
