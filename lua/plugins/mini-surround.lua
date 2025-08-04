return {
  "echasnovski/mini.surround",
  version = "*",
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "sa", -- Add surrounding
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding to the right
        find_left = "sF", -- Find surrounding to the left
        replace = "sr", -- Replace surrounding
      },
    })
  end,
}
