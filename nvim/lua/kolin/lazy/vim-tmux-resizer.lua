return {
    'RyanMillerC/better-vim-tmux-resizer',

    config = function ()
        vim.g.tmux_resizer_no_mappings = 1

        vim.keymap.set("n", "<M-H>", vim.cmd.TmuxResizeLeft)
        vim.keymap.set("n", "<M-J>", vim.cmd.TmuxResizeDown)
        vim.keymap.set("n", "<M-K>", vim.cmd.TmuxResizeUp)
        vim.keymap.set("n", "<M-L>", vim.cmd.TmuxResizeRight)

    end
}
