local opts = {
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}

require("nvim-tree").setup(opts)
