local keymap = vim.keymap

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

local opts = { noremap = true, silent = true }

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Diagnostics
keymap.set("n", "<C-g>", function()
  vim.diagnostic.goto_next()
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
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- update and save
keymap.set({ "n", "i" }, "<C-s>", "<ESC>:up<CR>")

-- open copilot chat
keymap.set("n", "<leader>cc", ":CopilotChat ")
keymap.set("n", "<leader>ct", ":CopilotChatToggle<CR>")

-- open diff view
keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
keymap.set("n", "<leader>gD", ":DiffviewClose<CR>")
keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame <CR>")

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
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- set ctrl b to enter in visual block mode
keymap.set("n", "<C-b>", "<C-v>")

-- add line above and below
keymap.set("n", "<C-o>", "O<C-c>j")
keymap.set("n", "<C-m>", "o<C-c>k")

-- double quote a word
keymap.set("n", "<leader>q", 'viw<ESC>a"<ESC>bi"<ESC>')

-- create space between lines and insert
keymap.set("i", "<C-o>", "<C-j>")

-- move left and right in insert mode
keymap.set("i", "<C-h>", "<left>")
keymap.set("i", "<C-l>", "<right>")
