--============================================================================--
--
-- https://github.com/folke/trouble.nvim
--
--============================================================================--
--
-- This plugin provides a pretty list for LSP diagnostics, etc.
--
-- STATUS: Experimental
-- TODO: (2024-08-05) Jon => try out the trouble plugin to see how it works
-- TODO: (2024-08-12) Jon => add a keybinding to toggle the trouble list
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    -- Pretty list for LSP diagnostics, etc
    "folke/trouble.nvim",
    -- lazy = false,
    config = function() require("trouble").setup {} end,
  },
}
