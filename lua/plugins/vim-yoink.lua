--============================================================================--
--
-- https://github.com/svermeulen/vim-yoink
--
--============================================================================--
--
-- The vim-yoink plugin is a clipboard manager that stores the last 10 items
-- that were yanked or deleted. It also has a persistent storage feature that
-- saves the clipboard history between sessions.
--
-- OPTIONS:
--   - yoinkIncludeDeleteOperations: This option is set to true to include
--     delete operations in the clipboard history.
--   - yoinkSavePersistently: This option is set to true to save the clipboard
--     history between sessions.
--
-- KEYMAPS:
--   - I have mapped the <C-P> and <C-N> keys to cycle through the clipboard,
--     back and forward, respectively.
--
--   - I have also mapped the p and P keys to paste the clipboard contents.
--
-- EXTENSIONS:
--   NOTE: The vim-subversive plugin extends the vim-yoink plugin by adding
--   additional keymaps to substitute text.
--
--   - <Leader>ss key will substitute a word range.
--   - s key in visual mode will substitute the selected text.
--   - p and P keys in visual mode will substitute the selected
--
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "svermeulen/vim-yoink",
    opts = {
      yoinkIncludeDeleteOperations = true,
      yoinkSavePersistently = true,
    },

    config = function(plugin)
      local map = vim.api.nvim_set_keymap
      local options = {
        noremap = true,
      }
      map("n", "<c-p>", "<plug>(YoinkPostPasteSwapBack)", options)
      map("n", "<c-n>", "<plug>(YoinkPostPasteSwapForward)", options)
      map("n", "p", "<plug>(YoinkPaste_p)", options)
      map("n", "P", "<plug>(YoinkPaste_P)", options)

      -- Apply the options to the global scope
      for option, value in pairs(plugin.opts) do
        vim.g[option] = value
      end
    end,
  },

  --==========================================================================--
  --
  -- https://github.com/svermeulen/vim-subversive
  -- https://github.com/svermeulen/vim-subversive?tab=readme-ov-file#integration-with-yoink
  --
  --==========================================================================--
  --
  -- STATUS: Experimental
  -- --  TODO: (2024-08-05) Jon => try out the subersive aspects of the yoink pluginto understand how it works
  --
  ------------------------------------------------------------------------------
  {
    "svermeulen/vim-subversive",
    config = function()
      local map = vim.api.nvim_set_keymap
      local options = { noremap = true }

      map("n", "<Leader>ss", "<plug>(SubversiveSubstituteWordRange)", options)
      map("x", "s", "<plug>(SubversiveSubstitute)", options)
      map("x", "p", "<plug>(SubversiveSubstitute)", options)
      map("x", "P", "<plug>(SubversiveSubstitute)", options)
    end,
  },
}
