--============================================================================--
--
-- https://discord.com/channels/939594913560031363/1174272252372582410/1269282093171736667
--
--============================================================================--
--
-- Extend the AstroCoreOpts table to include custom mappings for terminal mode
-- that provides a way to navigate between vim splits using <C-h>, <C-j>,
-- <C-k>, and <C-l> keybindings.
--
-- This is useful when operating inside a vim instance nested in a floating
-- neovim terminal window. Normal split movements will work as expected, but
-- <C-movement> commands do not hide the floating window, which is the default
-- behavior in AstroNvim.
--
-- NOTE: (2024-08-11) Jon => May not be necessary with the latest AstroNvim updates
--
--------------------------------------------------------------------------------
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      t = {
        ["<C-H>"] = {
          function()
            if vim.api.nvim_win_get_config(0).zindex ~= nil then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-h>", true, false, true), "n", false)
            else
              vim.cmd "wincmd h"
            end
          end,
        },
        ["<C-J>"] = {
          function()
            if vim.api.nvim_win_get_config(0).zindex ~= nil then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-j>", true, false, true), "n", false)
            else
              vim.cmd "wincmd j"
            end
          end,
        },
        ["<C-K>"] = {
          function()
            if vim.api.nvim_win_get_config(0).zindex ~= nil then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-k>", true, false, true), "n", false)
            else
              vim.cmd "wincmd k"
            end
          end,
        },
        ["<C-L>"] = {
          function()
            if vim.api.nvim_win_get_config(0).zindex ~= nil then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-l>", true, false, true), "n", false)
            else
              vim.cmd "wincmd l"
            end
          end,
        },
      },
    },
  },
}
