vim.cmd [[packadd packer.nvim]]
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
        install_path })
end

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- lsp
    use { "neovim/nvim-lspconfig", config = [[ require("plugins/lspconfig") ]] }
    use { "simrat39/rust-tools.nvim", config = [[ require("plugins/rust-tools") ]] }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = [[ require("plugins/nvim-treesitter") ]] }

    -- lsp servers, debuggers, linters
    use { "williamboman/mason.nvim", config = [[ require("plugins/mason") ]] }
    use "williamboman/mason-lspconfig.nvim"

    -- auto completion
    use { "hrsh7th/nvim-cmp", config = [[ require("plugins/nvim-cmp") ]] }
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    -- themes
    use { 'glepnir/zephyr-nvim', requires = { 'nvim-treesitter/nvim-treesitter', opt = true } }
    use 'folke/tokyonight.nvim'
    use 'shaunsingh/moonlight.nvim'
    use 'shaunsingh/nord.nvim'
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use "rebelot/kanagawa.nvim"

    -- telescope
    use "nvim-telescope/telescope-ui-select.nvim"
    use { "stevearc/dressing.nvim", config = [[ require("plugins/dressing") ]] }
    use { "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
        config = [[ require("plugins/telescope") ]] }

    -- misc
    use "tpope/vim-fugitive"
    use "b3nj5m1n/kommentary"
    use { "aserowy/tmux.nvim", config = [[ require("plugins/tmux") ]] }
    use { "folke/which-key.nvim", config = [[ require("plugins/which-key") ]] }
    use { "windwp/nvim-autopairs", config = [[ require("plugins/nvim-autopairs") ]] }
    use { "nvim-lualine/lualine.nvim",
        requires = { { "kyazdani42/nvim-web-devicons" }, { "arkav/lualine-lsp-progress" } },
        config = [[ require("plugins/lualine") ]] }
    use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" },
        config = [[ require("plugins/nvim-tree") ]] }
    use { "phaazon/hop.nvim", branch = "v2", config = [[ require("plugins/hop") ]] }
    use { "glepnir/dashboard-nvim", opt = false, config = [[ require('plugins.dashboard') ]] }


    if packer_bootstrap then
        require("packer").sync()
    end
end)
