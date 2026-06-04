-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme — kanso, matched to the Ghostty `dark:Kanso Zen,light:Kanso Pearl`.
    -- Pick the variant up front from the current macOS appearance so the FIRST colorscheme
    -- applied already matches the system — otherwise a static dark default would flash dark
    -- (FOUC) before dark-notify corrected it to light. dark-notify still does LIVE switching
    -- while nvim is open; this just makes startup flash-free. (~20ms one-time `defaults` read.)
    colorscheme = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }):find "Dark"
        and "kanso-zen"
      or "kanso-pearl",
    -- Disable AstroNvim's auto-generated lazygit theme. It derives muted colors from
    -- the kanso highlight groups and injects them (via LG_CONFIG_FILE) *over* our own
    -- ~/Library/Application Support/lazygit/config.yml, washing out the borders inside
    -- toggleterm. With this off, lazygit uses only our config (crisp, and it already
    -- adapts light/dark via named ANSI colors) — matching standalone `lazygit`.
    lazygit = false,
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
