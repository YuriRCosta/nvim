return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 30,
      mappings = {
        ["l"] = "open",
      },
      sources = { "filesystem", "document_symbols" },
    },
  },
}
