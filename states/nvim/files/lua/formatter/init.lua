require 'format'.setup {
  javascriptreact = {
    prettier = function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
        stdin = true
      }
    end
  },
  typescriptreact = {
    prettier = function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
        stdin = true
      }
    end
  },
  rust = {
    rustfmt = function()
      return {
        exe = "rustfmt",
        args = {"--edition 2018"},
        stdin = true
      }
    end
  }
}


