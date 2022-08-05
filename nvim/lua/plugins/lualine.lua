local opts = {
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
                            local whitelist_dir = os.getenv( "HOME" ) .. "/projects"
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

require('lualine').setup(opts)
