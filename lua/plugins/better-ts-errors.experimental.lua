--============================================================================--
--
-- https://github.com/OlegGulevskyy/better-ts-errors.nvim
--
--============================================================================--
--
-- If you are unlucky enough to work with TypeScript and stuck in Vim mode
-- (using Neovim tho), then at least have a better formatted TypeScript errors.
--
-- Editor Gif Demos:
--   - https://gifyu.com/image/Sipos
--   - https://gifyu.com/image/Sipox
--
-- STATUS: Experimental
-- TODO: validate that the better-ts-errors plugin works and is desired
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  "OlegGulevskyy/better-ts-errors.nvim",
  config = function()
    require("better-ts-errors").setup {
      keymaps = {
        toggle = "<leader>dd", -- Toggling keymap
        go_to_definition = "<leader>dx", -- Go to problematic type from popup window
      },
    }
  end,
}
