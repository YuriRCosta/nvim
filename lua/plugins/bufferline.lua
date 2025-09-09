return {
  "akinsho/bufferline.nvim",
  version = "*",
  enabled = false,
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
      },
      highlights = {},
    })
  end,
}
