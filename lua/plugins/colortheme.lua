---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      local catppuccin = require "catppuccin"

      catppuccin.setup {
        background = {
          light = "latte",
          dark = "mocha",
        },
        integrations = {
          -- cmp = true,
          gitsigns = true,
          -- neotree = true,
          treesitter = true,
          telescope = true,
          -- lsp_trouble = true,
          -- window_picker = true,
        },
      }
    end,
  },
  {
    "cormacrelf/dark-notify",
    lazy = false,
    config = function()
      local dn = require "dark_notify"
      dn.run {
        schemes = {
          dark = {
            colorscheme = "catppuccin",
            background = "dark",
          },
          light = {
            colorscheme = "catppuccin",
            background = "light",
          },
        },
      }
    end,
  },
}
