local opts = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        presets = {
            operators = false,
            motions = false,
            g = false,
            z = false,
        },
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
    },
}

require('which-key').setup(opts)
