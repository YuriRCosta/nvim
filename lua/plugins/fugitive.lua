return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "Gblame", "Gedit" },
  keys = {
    { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Diff com staging" },
  },
}
