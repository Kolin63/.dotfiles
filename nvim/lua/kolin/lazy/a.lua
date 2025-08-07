return {
    {
        'vim-scripts/a.vim',

        enabled = false,

        config = function ()
            vim.keymap.del("i", "<leader>ih")
            vim.keymap.del("i", "<leader>is")
            vim.keymap.del("i", "<leader>ihn")
        end
    },
    {
        'kolin63/a63.vim',

        config = function ()
            vim.keymap.del("i", "<leader>ih")
            vim.keymap.del("i", "<leader>is")
            vim.keymap.del("i", "<leader>ihn")
        end
    }
}
