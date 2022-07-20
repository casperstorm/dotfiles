vim.cmd [[packadd packer.nvim]]
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP config
    use {"neovim/nvim-lspconfig", config = [[ require('plugins/lspconfig') ]]}
    use {'simrat39/rust-tools.nvim', config = [[ require('plugins/rust-tools') ]]}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = [[ require('plugins/nvim-treesitter') ]]}

    -- Color
    use {"rebelot/kanagawa.nvim", 
    config = function()
        require("kanagawa").setup {
            dimInactive = true,
        }
    end
}

-- Auto completion
use {'hrsh7th/nvim-cmp', config = [[ require('plugins/nvim-cmp') ]]}
use {'hrsh7th/cmp-nvim-lsp'}
use {'hrsh7th/cmp-buffer'}
use {'hrsh7th/cmp-path'}
use {'hrsh7th/cmp-cmdline'}
use {'hrsh7th/cmp-vsnip'}

-- Snippets
use {'hrsh7th/vim-vsnip'}

-- Telescope
use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, {"nvim-telescope/telescope-fzf-native.nvim", run = "make"} },
    config = function()
        require("telescope").setup {
            defaults = {
                mappings = {
                    n = {
                        ["<C-c>"] = "close",
                    },
                },
            },
            pickers = {
                find_files = {
                    find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix', '--exclude', '.git/' },
                    follow = true,
                    hidden = true,
                    no_ignore = false
                },
                buffers = {},
                diagnostic = {
                    root_dir = "/Users/crs/Code",
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                    }
                }
            }
        }

        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("fzf")
    end
}
use {'nvim-telescope/telescope-ui-select.nvim' }
use {'stevearc/dressing.nvim', config = function ()
    require('dressing').setup({
        select = {
            enabled = false,
        }
    })
end}

-- Whichkey
use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
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
    end
}

-- Status line
use {
    'nvim-lualine/lualine.nvim',
    requires = {{ 'kyazdani42/nvim-web-devicons'}, {'arkav/lualine-lsp-progress'}},
    config = function()
        require('lualine').setup {
            sections = {
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'diagnostics',
                        -- .get() for project wide counts (repo uses .get(0) for buffer only)
                        sources = {
                            function()
                                local diagnostics = vim.diagnostic.get()
                                local count = { 0, 0, 0, 0 }
                                for _, diagnostic in ipairs(diagnostics) do
                                    local name = vim.api.nvim_buf_get_name(diagnostic.bufnr)
                                    local whitelist_dir = "/Users/crs/Code"
                                    local allowed = string.sub(name, 1, #whitelist_dir) == whitelist_dir

                                    if allowed then
                                        count[diagnostic.severity] = count[diagnostic.severity] + 1
                                    end
                                end
                                return {
                                    error = count[vim.diagnostic.severity.ERROR],
                                    warn = count[vim.diagnostic.severity.WARN],
                                    info = count[vim.diagnostic.severity.INFO],
                                    hint = count[vim.diagnostic.severity.HINT],
                                }
                            end
                        },
                    }
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    },
                    {
                        'lsp_progress',
                        -- With spinner
                        display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
                        separators = {
                            component = ' ',
                            progress = ' | ',
                            message = { pre = '(', post = ')'},
                            percentage = { pre = '', post = '%% ' },
                            title = { pre = '', post = ': ' },
                            lsp_client_name = { pre = '[', post = ']' },
                            spinner = { pre = '', post = '' },
                            message = { commenced = 'In Progress', completed = 'Completed' },
                        },
                        display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
                        timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
                        spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
                    }
                }
            },
            inactive_sections = {
                lualine_c = {},
                lualine_x = {'location'}
            }
        }
    end
}

-- Tabs
use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    disable = true,
    opt = true,
}

-- Explorer
use {
    'kyazdani42/nvim-tree.lua',
    requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() 
        require'nvim-tree'.setup {
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        } 
    end
}

-- Hop
use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
}

-- Git
use 'tpope/vim-fugitive'

-- Comment text in and out
use 'b3nj5m1n/kommentary'

-- colors
use {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require'colorizer'.setup {}
    end
}

-- tmux
use({
    "aserowy/tmux.nvim",
    config = function()
        require("tmux").setup({
            navigation = {
                -- enables default keybindings (C-hjkl) for normal mode
                enable_default_keybindings = true,
            },
            resize = {
                -- enables default keybindings (A-hjkl) for normal mode
                enable_default_keybindings = true,
            }
        })
    end
})

if packer_bootstrap then
    require('packer').sync()
end
end)


