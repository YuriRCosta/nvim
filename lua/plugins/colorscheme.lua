return {
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        transparent = true,
        style = "deep",
        lualine = {
          transparent = true, -- lualine center bar transparency
        },
      })
    end,
    opts = {},
  },
}
