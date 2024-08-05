--============================================================================--
--
-- https://github.com/lukas-reineke/virt-column.nvim
--
--============================================================================--
--
-- virt-column.nvim is a vim plug-in which provides a virtual column that is
-- displayed with virtual text on the right side of the buffer.
--
-- Add an autocmd to display two columns in gitcommit buffers. One at 51 chars
-- to highlight the 50 char limit for the commit message subject, and one at 73
-- chars to highlight the 72 char limit for the commit message body.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "lukas-reineke/virt-column.nvim",
    config = function()
      -- Set the global virtcolumn value
      require("virt-column").setup {
        char = "│", -- You can customize the character used for the virtual column | is the default
        size = 0.5, -- The size of the virtual column, default is 1
        virtcolumn = "81",
      }

      -- Set the virtcolumn setting for COMMIT_EDITMSG buffer only
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "COMMIT_EDITMSG",
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          require("virt-column").setup_buffer(bufnr, {
            virtcolumn = "51,73",
          })
        end,
      })
    end,
  },
}
