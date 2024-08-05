--============================================================================--
--
-- https://github.com/mbbill/undotree
--
--============================================================================--
--
-- This plugin provides a visual representation of the Vim undo tree. It allows
-- you to traverse the undo tree and restore the buffer to a previous state.
--
-- OPTIONS:
-- --------
--   - undotree_WindowLayout: sets the layout of the undo tree window.
--
--     Option "4" will set the window layout like so:
--       +-----------------------++----------+
--       |                        |          |
--       |                        |          |
--       |                        | undotree |
--       |                        |          |
--       |                        |          |
--       +------------------------+----------+
--       |                                   |
--       |                            diff   |
--       |                                   |
--       +-----------------------------------+
--     More options are available in the plugin documentation here:
--     https://github.com/mbbill/undotree/blob/56c684a805fe948936cda0d1b19505b84ad7e065/plugin/undotree.vim#L29
--
--   - undotree_DiffpanelHeight: sets height of the diff panel. { default: "10" }
--
--   - undotree_SplitWidth: sets the width of the split. { default: "30" }
--
--   - undotree_SetFocusWhenToggle: sets focus when undotree opens. { default: 0 }
--
-- KEYMAPS:
--   - <Leader>gz key will toggle the undo tree window.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_WindowLayout = "4"
      vim.g.undotree_DiffpanelHeight = "15"
      vim.g.undotree_SplitWidth = "46"
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
  vim.keymap.set("n", "<Leader>gz", "<cmd>UndotreeToggle<CR>"),
}
