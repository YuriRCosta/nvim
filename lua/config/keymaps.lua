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
keymap.set("n", "<leader>gdo", ":DiffviewOpen<CR>", { desc = "Open Git Diffview" })
keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", { desc = "Close Git Diffview" })

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

-- clear highlights
keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear highlights" })

-- set ctrl b to enter in visual block mode
keymap.set("n", "<C-b>", "<C-v>")

-- add line above and below
keymap.set("n", "<C-o>", "O<C-c>j")
keymap.set("n", "<C-m>", "o<C-c>k")

-- move left and right in insert mode
keymap.set("i", "<C-h>", "<left>")
keymap.set("i", "<C-l>", "<right>")

-- open Timerly
keymap.set("n", "<leader>ot", ":TimerlyToggle<CR>", { desc = "Open Timerly" })

-- switch relative line numbers
keymap.set("n", "<leader>rl", ":set relativenumber!<CR>", { desc = "Toggle relative line numbers" })

-- unset leader sg
vim.keymap.del("n", "<leader>sg")

-- exit terminal mode
vim.keymap.set("t", "<C-t>", "[[<C-\\><C-n>]]", { noremap = true })

-- Mapeia <leader>gb para alternar o git blame
vim.keymap.set("n", "<leader>gb", function()
  vim.cmd("GitBlameToggle")
end, { desc = "Toggle git blame" })

-- open mini.files
vim.keymap.set("n", "<leader>mf", function()
  require("mini.files").open()
end, { desc = "Open mini.files" })

vim.keymap.set("n", "<leader>oi", function()
  require("tstools").organize_imports()
end, { desc = "Organize imports" })

vim.keymap.set("n", "<leader>rf", function()
  require("tstools").rename_file()
end, { desc = "Rename file" })

vim.keymap.set("n", "<leader>cp", function()
  local repo_root_cmd_output = vim.fn.systemlist("git rev-parse --show-toplevel")

  if
    vim.v.shell_error ~= 0
    or #repo_root_cmd_output == 0
    or repo_root_cmd_output[1] == nil
    or repo_root_cmd_output[1] == ""
  then
    vim.notify("Não foi possível determinar a raiz do repositório git ou não está em um.", vim.log.levels.WARN)
    return
  end

  local repo_root_raw = repo_root_cmd_output[1]
  local repo_root = vim.fn.resolve(repo_root_raw)

  if repo_root == nil or repo_root == "" then
    vim.notify(
      "Não foi possível resolver o caminho canônico da raiz do repositório: " .. repo_root_raw,
      vim.log.levels.WARN
    )
    return
  end

  repo_root = repo_root:gsub("/$", "")

  local current_file_path_raw = vim.fn.expand("%:p")
  if current_file_path_raw == nil or current_file_path_raw == "" then
    vim.notify("Não foi possível obter o caminho do arquivo atual.", vim.log.levels.WARN)
    return
  end
  local file_path = vim.fn.resolve(current_file_path_raw)

  if file_path == nil or file_path == "" then
    vim.notify(
      "Não foi possível resolver o caminho canônico do arquivo atual: " .. current_file_path_raw,
      vim.log.levels.WARN
    )
    return
  end

  local prefix_to_remove = repo_root .. "/"

  if string.sub(file_path, 1, string.len(prefix_to_remove)) == prefix_to_remove then
    local relative_path = string.sub(file_path, string.len(prefix_to_remove) + 1)
    vim.fn.setreg("+", relative_path)
    vim.notify("Caminho relativo copiado: " .. relative_path)
  else
    vim.notify(
      "Falha ao gerar caminho relativo. Raiz: '" .. repo_root .. "', Arquivo: '" .. file_path .. "'",
      vim.log.levels.ERROR
    )
  end
end, { desc = "Copiar caminho relativo (raiz do repo)" })

vim.keymap.set({ "n", "t" }, "<C-\\>", function()
  vim.cmd("ToggleTerm direction=vertical size=80")
end, { desc = "Toggle Terminal on the right" })

vim.keymap.set("n", "<leader>E", function()
  require("snacks").explorer()
end, { desc = "Open Snacks Explorer" })

vim.keymap.set("n", "<leader>ad", function()
  local word = vim.fn.expand("<cword>")
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local indent = vim.fn.indent(row) -- pega a indentação da linha atual
  local log = string.format("%sconsole.log('%s', %s);", string.rep(" ", indent), word, word)
  vim.api.nvim_buf_set_lines(0, row, row, false, { log })
end, { desc = "Inserir console.log com indentação", noremap = true })
