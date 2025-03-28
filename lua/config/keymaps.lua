local keymap = vim.keymap

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')

local opts = { noremap = true, silent = true }

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Diagnostics
keymap.set("n", "<C-g>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<C-e>", function()
  vim.diagnostic.goto_next({
    severity = vim.diagnostic.severity.ERROR,
  })
end, opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- dont save to clipboard when delete and change
keymap.set("n", "D", '"_D')
keymap.set("n", "d", '"_d')
keymap.set("n", "c", '"_c')

-- paste from yank register
keymap.set("n", "p", '"0p')
keymap.set("n", "P", '"0P')

-- Split window
keymap.set("n", "sh", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- update and save
keymap.set({ "n", "i" }, "<C-s>", "<ESC>:up<CR>")

-- open diff view
keymap.set("n", "<leader>gdo", ":DiffviewOpen<CR>")
keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>")

-- set U do redu
keymap.set("n", "U", "<C-r>")

-- Tmux navigation
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })

-- Move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line down(v)

-- clean highlights
keymap.set("n", "<leader>ch", ":nohl<CR>")

-- set ctrl b to enter in visual block mode
keymap.set("n", "<C-b>", "<C-v>")

-- add line above and below
keymap.set("n", "<C-o>", "O<C-c>j")
keymap.set("n", "<C-m>", "o<C-c>k")

-- move left and right in insert mode
keymap.set("i", "<C-h>", "<left>")
keymap.set("i", "<C-l>", "<right>")

-- open Timerly
keymap.set("n", "<leader>ot", ":TimerlyToggle<CR>")

-- switch relative line numbers
keymap.set("n", "<leader>rl", ":set relativenumber!<CR>")

-- unset leader sg
vim.keymap.del("n", "<leader>sg")

vim.keymap.set("t", "<C-t>", [[<C-\><C-n>]], { noremap = true })
