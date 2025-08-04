vim.g.lazygit_config = true

local opt = vim.opt

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

-- set fileencoding=utf-8
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
-- opt.clipboard:append("unnamedplus")
vim.g.gitblame_enabled = 0
