--============================================================================--
--
-- CUSTOM PLUGIN, created by iterating on code with ChatGPT 4o
--
--============================================================================--
--
-- PURPOSE: This plugin is designed to add a blank line above or below the
-- current line in Vim while keeping your cursor exactly where it is.
--
-- TUTORIAL:
--   - Press [[ to add a blank line above the current line.
--   - Press ]] to add a blank line below the current line.
--
-- This is similar to the tpope unimpaired mappings but on the repeat of the ]
-- and [ keys instead of [␣ and ]␣ to add a blank line above or below the
-- current line.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  vim.keymap.set("n", "[[", function()
    local count = vim.v.count1
    local lines = {}
    for _ = 1, count do
      table.insert(lines, "")
    end
    vim.api.nvim_buf_set_lines(0, vim.fn.line "." - 1, vim.fn.line "." - 1, false, lines)
  end, { desc = "Add blank line(s) above" }),

  vim.keymap.set("n", "]]", function()
    local count = vim.v.count1
    local lines = {}
    for _ = 1, count do
      table.insert(lines, "")
    end
    vim.api.nvim_buf_set_lines(0, vim.fn.line ".", vim.fn.line ".", false, lines)
  end, { desc = "Add blank line(s) below" }),
}
