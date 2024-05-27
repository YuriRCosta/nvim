-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.lazygit_config = false

local opt = vim.opt

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

-- Some OS detectors
-- local is_wsl = vim.fn.has("wsl") == 1
-- -- local is_mac = vim.fn.has("macunix") == 1
-- -- local is_linux = not is_wsl and not is_mac
--
-- -- WSL Clipboard support
-- if is_wsl then
--   -- This is NeoVim's recommended way to solve clipboard sharing if you use WSL
--   -- See: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
--   vim.g.clipboard = {
--     name = "WslClipboard",
--     copy = {
--       ["+"] = "clip.exe",
--       ["*"] = "clip.exe",
--     },
--     paste = {
--       ["+"] = 'powershell.exe -NoProfile -Command [Console]::OutputEncoding=[System.Text.Encoding]::UTF8; [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--       ["*"] = 'powershell.exe -NoProfile -Command [Console]::OutputEncoding=[System.Text.Encoding]::UTF8; [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0,
--   }
-- end
