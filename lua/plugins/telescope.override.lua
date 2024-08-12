--============================================================================--
--
-- https://github.com/nvim-telescope/telescope.nvim
--
--============================================================================--
--
-- Telescope is a highly extendable fuzzy finder over lists. Built on the latest
-- Lua technologies, it is a fast and efficient way to search for files, buffers,
-- git files, and more. It also has a large ecosystem of extensions that can be
-- added to enhance its functionality.
--
-- AstroNvim has a custom configuration for Telescope that sets up the default
-- settings and pickers. It also adds some custom settings to extend the default
--
-- NOTE: https://docs.astronvim.com/configuration/customizing_plugins/#extending-core-plugin-config-functions
--
-- DEFINITIONS:
--   - MRU: Most Recently Updated
--   - CWD: Current Working directory
--   - Fuzzy Finder: A search tool that uses fuzzy matching to find files
--   - Picker: A type of search that is used to find files, buffers, and more
--
-- OPTIONS:
--   - pickers: A table of pickers that can be configured with custom settings
--     - find_files: A picker that searches for files in the CWD
--       - configured to show hidden files that aren't in the .gitignore
--     - oldfiles: A picker that shows the most recently opened files
--       - configure to sort by MRU
--       - configure to only show files in the root of the CWD
--     - buffers: A picker that shows all open buffers
--       - configured to sort by last used (not toggle friendly, unfortunately)
--
-- TUTORIAL:
--   1. Open a project in Neovim
--   2. Run the command :Telescope find_files (<Leader>ff)
--   3. Type the name of the file you want to find
--   4. Press Enter
--   5. The file is opened in a new buffer
--
--  Commonly used shortcuts in Normal mode:
--    - <Leader>ff: Find files
--    - <Leader>fo: Find Oldfiles (recently opened history)
--        - Sorted by MRU
--        - Only shows files in the root of the CWD
--        - Toggle between the other most recently opened file: <Leader>fo<CR>
--    - <Leader>fw: Find words (live grep)
--    - <Leader>fc: Find word under cursor (live grep)
--
--  Less commonly used shortcuts:
--    - <Leader>a:  Find AstroNvim Config Files
--    - <Leader>fb: Find buffers
--    - <Leader>fh: Find help tags
--    - <Leader>ft: Find themes (can preview easily)
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.pickers = {
      find_files = {
        hidden = true, -- default: false
      },
      oldfiles = {
        sort_mru = true, -- default: false
        only_cwd = true, -- default: false
      },
      buffers = {
        sort_lastused = true, --default: false
      },
    }
  end,
}
