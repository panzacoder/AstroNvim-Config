if true then return {} end -- DISABLED (ported from v4): delete this line to enable

--============================================================================--
--
-- https://docs.astronvim.com/recipes/disable_winbar/
--
--============================================================================--
--
-- This removes the extra top bar with info about the function or class the
-- cursor is currently in. I always get it mixed up w/ the tabline / bufferline
--
--------------------------------------------------------------------------------
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts) opts.winbar = nil end,
}
