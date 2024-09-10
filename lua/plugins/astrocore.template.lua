--============================================================================--
--
-- https://github.com/AstroNvim/template/blob/main/lua/plugins/astrocore.lua
--
--============================================================================--
--
-- This Lua script is a configuration file for the AstroNvim plugin for Neovim.
-- It's structured as a lua table that is returned when the script is run,
-- containing several nested tables configuring various aspects of AstroNvim.
--
-- Key sections include:
--
--   FEATURES: Enables or disables core features like autopairs, completion,
--     diagnostics, URL highlighting, and notifications. It also sets global
--     limits for large files.
--
--   DIAGNOSTICS: Configures the behavior of diagnostics, controlling the use of
--     virtual text and underlines.
--
--   OPTIONS: Configures vim options and global vim variables. It includes
--     settings for relativenumber, virtualedit, shiftround, listchars, etc.
--
--   MAPPINGS: Configures key mappings for different modes (normal, terminal,
--     visual, and insert). Each sub-table contains key-value pairs where the
--     key is the key combination and the value is another table that specifies
--     the command to run and a description of what the command does.
--
-- This Configuration file includes and extends the default AstroNvim core
-- configuration with my personal preferences.
--
--------------------------------------------------------------------------------

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        virtualedit = "all", -- allows the cursor to go anywhere, not just the beginning of lines when moving with j and k
        shiftround = true, -- when indenting, round up or down to align with the nearest multiple of shiftwidth
        iskeyword = vim.opt.iskeyword:append "-", -- append '-' to iskeyword
        listchars = { --Use the same symbols as TextMate for tabstops and EOLs
          tab = "▸ ",
          eol = "¬",
        },
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        ["QA"] = { "<cmd>qa<cr>", desc = "Close all buffers" },
        ["SS"] = { "<cmd>w<cr>", desc = "Save current buffer" },
        ["<Leader><space>"] = { "<cmd>noh<cr>", desc = "Clear search highlights (noh)" },

        -- navigate buffer tabs
        [")"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["("] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Navigating actual tabs, positionined at the end of the tabline "named" 1,2,3,etc.
        ["<Leader>1"] = { "<cmd>tabprev<cr>", desc = "Prevtab" },
        ["<Leader>2"] = { "<cmd>tabnext<cr>", desc = "Next tab" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<Leader>bt"] = { "<cmd>tabnew<cr>", desc = "New tab" },

        --Window resizing
        ["=="] = { "<cmd>wincmd =<cr>", desc = "Resize all windows to be equal height and width" },

        -- NeoTree
        ["<Leader>D"] = { "<cmd>:Neotree reveal<cr>", desc = "Reveal current buffer in Explorer" }, -- <Leader>o is the default, but this mapping is muscle memory from NERDTree

        -- UI tweaks
        ["<Leader>ue"] = { "<cmd>set list!<cr>", desc = "Toggle showing line ending and tab characters" }, -- the listchars setting from above in the opts -> options -> opt table

        -- Diagnostics
        ["<LocalLeader>e"] = {
          "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>",
          desc = "Show full error message in floating window for the current line",
        },

        -- Config
        ["<LocalLeader>z"] = { "<CMD>Lazy<CR>", desc = "Open Lazy configuration" },

        -- Open floating terminal
        ["<C-t>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Launch floating terminal" },
      },
      t = { -- Close floating terminal
        ["<C-T>"] = { "<cmd>ToggleTerm<cr>" },
        -- ["<C-t>"] = { "<cmd>ToggleTerm<cr>" },
      },
      v = { -- Visual mode mappings
        ["gq"] = { "<cmd> normal gw<cr>", desc = "Format" }, -- Add "gq" format back via an alias.
        --   ["<A-j>"] = ":m '>+1<CR>gv-gv",
        --  ["<A-k>"] = ":m '<-2<CR>gv-gv",
      },
      i = { -- Insert mode mappings
        ["SS"] = { "<Esc><cmd>w<cr>", desc = "Save current buffer" },
        ["II"] = { "<Esc>I", desc = "Move to beginning of line in insert mode" },
        ["AA"] = { "<Esc>A", desc = "Move to end of line in insert mode" },
        --    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
        --    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
