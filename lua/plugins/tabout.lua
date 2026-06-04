-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

--============================================================================--
--
-- https://github.com/abecodes/tabout.nvim
--
-- Dependencies:
--   - https://github.com/nvim-treesitter/nvim-treesitter
--   - https://github.com/L3MON4D3/LuaSnip
--   - https://github.com/hrsh7th/nvim-cmp
--
--============================================================================--
--
-- Tabout is a inspired by the tabout.vim plugin, which allows you to tab out
-- of brackets, quotes, etc.
--
-- This plugin is tied into the custom nvim-cmp completion plugin in
-- cmp.override.lua. The fallback() for the <Tab> key is what allows tabout to
-- work if the cmp menu isn't open and no CoPilot hints are being shown, both
-- of which are able to be hidden by pressing <BS>.
--
--------------------------------------------------------------------------------
---@type LazySpec
return {
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup {
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      }
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    opt = false, -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1100,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },
}
