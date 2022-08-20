local opts = {
    defaults = {
        mappings = {
            n = {
                ["<C-c>"] = "close",
            },
        },
    },
    pickers = {
        find_files = {
            file_ignore_patterns = { ".cargo/", ".git/" },
            hidden = true,
        },
        diagnostics = {
            root_dir = os.getenv("HOME") .. "/projects",
        },
        colorscheme = {
            enable_preview = true,
        },

    },
}

require('telescope').setup(opts)
require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")
