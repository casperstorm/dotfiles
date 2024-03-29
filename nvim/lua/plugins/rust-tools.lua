local rt = require("rust-tools")

local opts = {
    tools = {
        inlay_hints = {
            only_current_line = true,
        },
        runnables = {
            use_telescope = true,
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
        end,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                diagnostics = {
                    experimental = true,
                },
                imports = {
                    prefix = "self",
                    granularity = {
                        enforce = true,
                        group = "module",
                    },
                },
                rustfmt = {
                    extraArgs = {
                        "--config",
                        "imports_granularity=Module",
                        "--config",
                        "group_imports=StdExternalCrate",
                    },
                },
                -- enable clippy on save
                checkOnSave = {
                    overrideCommand = {
                        "cargo",
                        "clippy",
                        "--all",
                        "--message-format=json",
                        "--",
                        "-A", "clippy::too_many_arguments",
                        "-A", "clippy::large_enum_variant",
                        "-A", "clippy::inherent_to_string",
                        "-A", "clippy::result_unit_err",
                        "-A", "clippy::module_inception",
                        "-A", "clippy::should_implement_trait",
                        "-A", "clippy::mutable_key_type",
                        "-A", "clippy::from_over_into",
                        "-A", "clippy::enum_variant_names",
                        "-A", "clippy::type_complexity",
                        "-A", "clippy::upper_case_acronyms",
                        "-A", "clippy::redundant_closure",
                        "-A", "clippy::many-single-char-names",
                        "-A", "clippy::result_large_err",
                    },
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
