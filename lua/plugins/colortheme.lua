--============================================================================--
--
-- Colorscheme: kanso.nvim — matched to the terminal (Ghostty) config:
--   theme = dark:Kanso Zen,light:Kanso Pearl
--
-- dark-notify watches the macOS system appearance and swaps the nvim colorscheme
-- to match: kanso-zen in dark mode, kanso-pearl in light mode.
--
-- https://github.com/webhooked/kanso.nvim
-- https://github.com/cormacrelf/dark-notify  (needs the `dark-notify` binary on PATH)
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000, -- load the colorscheme before other UI plugins
    config = function() require("kanso").setup {} end,
  },
  {
    "cormacrelf/dark-notify",
    lazy = false,
    config = function()
      require("dark_notify").run {
        schemes = {
          dark = { colorscheme = "kanso-zen", background = "dark" },
          light = { colorscheme = "kanso-pearl", background = "light" },
        },
      }
    end,
  },
}
