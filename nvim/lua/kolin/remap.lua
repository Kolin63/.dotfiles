-- Leader pv does explore
vim.keymap.set("n", "<leader>pv", require('oil').open)

-- Tab Remaps
vim.keymap.set("n", "<C-t>", function()
    vim.cmd.tabnew()
    require('oil').open()
    require('telescope.builtin').find_files()
end)

vim.keymap.set("n", "<Tab>", vim.cmd.tabn)
vim.keymap.set("n", "<S-Tab>", vim.cmd.tabp)

-- Scrolling Remap
vim.keymap.set("n", "<M-k>", "2<C-y>2k")
vim.keymap.set("n", "<M-j>", "2<C-e>2j")
vim.keymap.set("n", "<C-y>", "2<C-y>")
vim.keymap.set("n", "<C-e>", "2<C-e>")

-- Page Up and Down
vim.keymap.set("n", "<PageUp>", "<C-u>")
vim.keymap.set("n", "<PageDown>", "<C-d>")
vim.keymap.set("n", "<S-PageUp>", "<PageUp>")
vim.keymap.set("n", "<S-PageDown>", "<PageDown>")

-- Leader Y Goes to System Clipboard
-- + Register is System Clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Void Register Delete
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set({ "n", "v" }, "<leader>D", "\"_dd")

-- Leader S over a word to replace it
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Split Remaps (M is alt, better as right alt)
vim.keymap.set("n", "<M-s>", function ()
    vim.cmd.split()
    require('oil').open()
end)
vim.keymap.set("n", "<M-v>", function ()
    vim.cmd.vsplit()
    require('oil').open()
end)
vim.keymap.set("n", "<M-t>", function ()
    vim.cmd.split()
    vim.cmd.term()
    vim.cmd.norm('A')
end)

-- Big D to dd
vim.keymap.set("n", "D", "dd")
-- Big Y to yy
vim.keymap.set("n", "Y", "yy")
-- Big C to cc
vim.keymap.set("n", "C", "cc")

-- Alt d deletes word in insert mode
vim.keymap.set("i", "<M-d>", "<Esc>diwi")

-- Ctrl d maps to backspace in insert mode
vim.keymap.set("i", "<C-d>", "<BS>")

-- Emacs controls (dont worry guys its ok)
vim.keymap.set("i", "<C-f>", "<Esc>la")
vim.keymap.set("n", "<C-f>", "l")
vim.keymap.set("i", "<C-b>", "<Esc>i")
vim.keymap.set("n", "<C-b>", "h")

-- Ctrl Shift G Opens GitHub Repo in Web
vim.keymap.set("n", "<C-G>", function() vim.cmd("silent exec \"!gh repo view --web\"") end)

-- Auto Braces and Parentheses and stuff
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
-- vim.keymap.set("i", "(", "()<Esc>i")
-- vim.keymap.set("i", "\"", "\"\"<Esc>i")
-- vim.keymap.set("i", "'", "''<Esc>i")

-- Ctrl Z undo
vim.keymap.set("i", "<C-z>", "<Esc>ui")
vim.keymap.set("n", "<C-z>", "<Esc>u")

-- Get rid of arrow keys
vim.keymap.set({ 'i', 'n', 'v' }, "<Up>", "<nop>")
vim.keymap.set({ 'i', 'n', 'v' }, "<Down>", "<nop>")
vim.keymap.set({ 'i', 'n', 'v' }, "<Left>", "<nop>")
vim.keymap.set({ 'i', 'n', 'v' }, "<Right>", "<nop>")
vim.keymap.set({ 'i', 'n', 'v' }, "<S-Up>", "<nop>")
vim.keymap.set({ 'i', 'n', 'v' }, "<S-Down>", "<nop>")
vim.keymap.set({ 'i', 'n', 'v' }, "<S-Left>", "<nop>")
vim.keymap.set({ 'i', 'n', 'v' }, "<S-Right>", "<nop>")

-- :LuaToVim to convert basic remaps from Lua to Vimscript
vim.api.nvim_create_user_command("LuaToVim", function(args)
  vim.cmd([['<,'>s/.*"\([nvi]\)", *"\(.*\)", *"\(.*\)")/\1noremap \2 \3]])
end, { nargs=0, range=true })
