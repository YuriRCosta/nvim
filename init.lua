-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lazyvim.util").on_load("lazyvim.plugins.extras.editor.mappings", function()
  vim.keymap.del("n", "<leader>sg")
end)
