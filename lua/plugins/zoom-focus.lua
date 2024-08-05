--============================================================================--
--
-- https://github.com/pocco81/true-zen.nvim
-- https://github.com/folke/zen-mode.nvim
--
--============================================================================--
--
-- These plugins provide a way to zoom the current vim split to view by itself
-- and a distraction-free writing experience.
--
-- KEYMAPS:
--   - <Leader>z key will toggle the Zen Focus whick-key menu showing the following
--     - <Leader>zz key will zoom the current buffer to view by itself while
--       maintaining the rest of the normal vim layout.
--     - <Leader>za key will toggle Zen Mode, which is a distraction-free
--       writing experience.
--
-- These two plugins are similar in functionality, but true-zen
--   - Is currently broken with respect to showing untitled buffers in its
--     distraction free writing mode, so we need to use zen-mode for that
--
--   - Provides a way to integrate with tmux (TODO: (2024-08-05) Jon => figure out how to use this)
--
--   - Works properly accounting for neo-tree when toggling focus to just the
--     current buffer (zoom)
--
-- zen-mode, on the other hand is a more feature-rich plugin that provides a
-- way to customize the distraction-free writing experience and works properly
-- without the untitled buffer issue.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "pocco81/true-zen.nvim",
    opts = {
      integrations = {
        tmux = true,
      },
    },
    config = function(_plugin, opts) require("true-zen").setup(opts) end,
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = { --  TODO: (2024-08-05) Jon => bring these mappings into the config above
        n = {
          ["<Leader>z"] = { name = "Zen Focus" },
          -- ["<Leader>zn"] = { "<cmd>TZNarrow<cr>", desc = "Narrow focused", noremap = true },
          ["<Leader>zz"] = { "<cmd>TZFocus<cr>", desc = "Zoom Buffer", noremap = true },
          -- ["<Leader>zm"] = { "<cmd>TZMinimalist<cr>", desc = "Minimalist mode", noremap = true },
          -- ["<Leader>za"] = { "<cmd>TZAtaraxis<cr>", desc = "Ataraxis mode", noremap = true },
        },
        -- v = {
        --   ["<Leader>z"] = { name = "Zen Focus" },
        --   ["<Leader>zn"] = { "<cmd>'<,'>TZNarrow<cr>", desc = "Ranged narrow focused", noremap = true },
        -- },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here or leave it empty to use the default settings
      window = {
        backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 0.9, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = true }, -- disables git signs
        tmux = { enabled = true }, -- disables the tmux statusline
        todo = { enabled = true }, -- refer to the configuration section below
      },

      on_open = function(_win)
        -- callback where you can add custom code when the Zen window opens
        require("virt-column").update { enabled = false }
        vim.cmd "IBLToggle"
      end,

      on_close = function(_win)
        -- callback where you can add custom code when the Zen window closes
        require("virt-column").update { enabled = true }
        vim.cmd "IBLToggle"
      end,
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = { -- TODO: (2024-08-05) Jon => bring these mappings into the config above
        n = {
          ["<Leader>z"] = { name = "Zen Focus" },
          ["<Leader>za"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode", noremap = true },
        },
      },
    },
  },
}
