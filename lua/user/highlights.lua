local set_hl = vim.api.nvim_set_hl

-- Transparência geral
-- set_hl(0, "Normal", { bg = "none" })
-- set_hl(0, "NormalNC", { bg = "none" })
-- set_hl(0, "TermNormal", { bg = "none" })
-- set_hl(0, "TermNormalNC", { bg = "none" })
set_hl(0, "NormalFloat", { bg = "none" })
set_hl(0, "FloatBorder", { bg = "none" })
-- set_hl(0, "TelescopeNormal", { bg = "none" })
-- set_hl(0, "TelescopeBorder", { bg = "none" })

-- Transparência para terminais do snacks
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "snacks_terminal",
--   callback = function()
--     set_hl(0, "Normal", { bg = "none" })
--     set_hl(0, "TermNormal", { bg = "none" })
--     set_hl(0, "TermNormalNC", { bg = "none" })
--   end,
-- })

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.wo.winbar = ""
  end,
})
