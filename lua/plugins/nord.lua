--============================================================================--
--
-- https://github.com/gbprod/nord.nvim
--
-- Dependencies:
--   https://github.com/sindrets/diffview.nvim
--
--============================================================================--
--
-- This plugin provides a colorscheme based on the Nord theme. It also provides
-- a function to set custom diff highlights for the diffview plugin as well as
-- the built in diff highlights.
--
-- nord_pallet_colors = {
--   polar_night = {
--     origin = #2E3440, -- nord0
--     bright = #3B4252, -- nord1
--     brighter = #434C5E, -- nord2
--     brightest = #4C566A, -- nord3
--     light = #616E88, -- out of palette
--   },
--   snow_storm = {
--     origin = #D8DEE9, -- nord4
--     brighter = #E5E9F0, -- nord5
--     brightest = #ECEFF4, -- nord6
--   },
--   frost = {
--     polar_water = #8FBCBB, -- nord7
--     ice = #88C0D0, -- nord8
--     artic_water = #81A1C1, -- nord9
--     artic_ocean = #5E81AC, -- nord10
--   },
--   aurora = {
--     red = #BF616A, -- nord11
--     orange = #D08770, -- nord12
--     yellow = #EBCB8B, -- nord13
--     green = #A3BE8C, -- nord14
--     purple = #B48EAD, -- nord15
--   },
--   none = "NONE",
-- }
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup {
        enhanced_diff_hl = true, -- Enable enhanced diff highlighting
        -- other diffview settings can go here
      }

      -- Customize the git status indicators (A, M, etc.)
      vim.api.nvim_set_hl(0, "DiffviewStatusAdded", { fg = "#A3BE8C", bg = "none" }) -- nord14
      vim.api.nvim_set_hl(0, "DiffviewStatusModified", { fg = "#EBCB8B", bg = "none" }) -- nord13
      vim.api.nvim_set_hl(0, "DiffviewStatusDeleted", { fg = "#BF616A", bg = "none" }) -- nord11
      vim.api.nvim_set_hl(0, "DiffviewStatusRenamed", { fg = "#88C0D0", bg = "none" }) -- nord8
      vim.api.nvim_set_hl(0, "DiffviewStatusUntracked", { fg = "#81A1C1", bg = "none" }) -- nord9
      vim.api.nvim_set_hl(0, "DiffviewStatusIgnored", { fg = "#4C566A", bg = "none" }) -- nord3
      vim.api.nvim_set_hl(0, "DiffviewStatusUnknown", { fg = "#D08770", bg = "none" }) -- nord12
    end,
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Set up nord colorscheme
      require("nord").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        transparent = false, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
        borders = true, -- Enable the border between vertically split windows visible
        errors = { mode = "bg" }, -- Display mode for errors and diagnostics
        -- values : [bg|fg|none]
        search = { theme = "vim" }, -- theme for highlighting search results
        -- values : [vim|vscode]
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = {},
          functions = {},
          variables = {},

          -- To customize lualine/bufferline
          bufferline = {
            current = {},
            modified = { italic = true },
          },
        },
      }
      vim.cmd.colorscheme "nord"

      -- Append custom fill character for diff areas
      vim.opt.fillchars:append { diff = "╱" }

      -- Function to set custom diff highlights
      local function FixNord()
        vim.api.nvim_set_hl(0, "DiffviewDiffDeleteDim", { fg = "#3B4252" }) -- the color of the / or - character in the diff
        vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#723A3F" })
        vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#495A52" })
        vim.api.nvim_set_hl(0, "DiffChange", { bg = "#434C5E" })
        vim.api.nvim_set_hl(0, "DiffText", { bg = "#616E88" })
      end
      FixNord()

      -- Autocommand to apply custom diff highlights when the colorscheme is loaded
      vim.api.nvim_create_autocmd("ColorScheme", { pattern = { "nord" }, callback = FixNord })
    end,
  },
}
