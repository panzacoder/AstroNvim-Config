--============================================================================--
--
-- https://github.com/TaDaa/vimade/
--
--============================================================================--
--
-- Vimade is a plugin that fades the text of inactive windows in Neovim. THIS
-- PLUGIN IS EXPERIMENTAL AND MAY NOT WORK AS EXPECTED.
--
--------------------------------------------------------------------------------
if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
---@type LazySpec
return {
  {
    dir = "~/Code/vimade",
    config = function()
      vim.g.vimade = {
        enabletreesitter = 1,
        fadelevel = 0.7,
        enablesigns = 1,
        ignorebuffers = { "neo-tree" },
        enablefocusfading = 1, -- fades when in another tmux split.
        -- basefg = "#808080",
        -- basebg = "#000000",
        -- checkinterval = 10000,
      }
    end,
  },
}
