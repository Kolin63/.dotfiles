-- Line Numbers
vim.opt.rnu = true
vim.opt.number = true

-- Line Wrap
vim.opt.wrap = false

-- Tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Makes Undo Files in a seperate directory
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Colors
vim.opt.syntax = on
vim.opt.termguicolors = true
vim.opt.bg = dark

-- Faster Update Times
vim.opt.updatetime = 50

-- Netrw LSD Emojis
vim.g.netrw_list_cmd = 'lsd'

-- Cursor Line
-- GRUVBOX!!!!!
vim.opt.cursorline = true
vim.cmd("highlight CursorLine guibg=#1d2021")

-- Color Column
vim.opt.colorcolumn = "80"

-- Dont start new lines with comments
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- CMP toggles
local cmp = require("cmp")
vim.api.nvim_create_user_command("CmpOn", function() 
  cmp.setup.buffer { enabled = true }
  print("CMP enabled")
end, {})
vim.api.nvim_create_user_command("CmpOff", function() 
  cmp.setup.buffer { enabled = false }
  print("CMP disabled")
end, {})

-- Open Spellcheck File
vim.api.nvim_create_user_command("SpellList", function()
  vim.cmd("split")
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(win, buf)
  vim.cmd("edit ~/.local/share/nvim/site/spell/en.utf-8.add")
end, {})
