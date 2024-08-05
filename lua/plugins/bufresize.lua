--============================================================================--
--
-- https://github.com/kwkarlwang/bufresize.nvim
--
--============================================================================--
--
-- bufresize.nvim can keep your buffers width and height in proportion when the
-- terminal window is resized.
--
-- For example, if you have two buffers side by side, with the left buffer
-- taking up 70% of the terminal width and the right buffer taking up 30% of
-- the terminal width. Then if you resized the terminal window, the left buffer
-- and right buffer will still take up 70% and 30% respectively
--
-- By default, resizing terminal window does not keep the buffers dimension in
-- proportion.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "kwkarlwang/bufresize.nvim",
    config = function()
      require("bufresize").setup {
        resize = {
          keys = {},
          trigger_events = { "VimResized" },
          increment = 5,
        },
      }
    end,
  },
}
