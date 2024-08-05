--============================================================================--
--
-- https://github.com/xvzc/chezmoi.nvim?tab=readme-ov-file#telescope-integration
--
--============================================================================--
--
-- This file is for setting up the telescope plugin to work with the
-- chezmoi.nvim plugin. The idea is to use the plugin to find files in the
-- chezmoi repository and then use telescope to display the files in a picker
-- window.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { -- add a new dependency to telescope that is our new plugin
      "xvzc/chezmoi.nvim",
    },
    -- the first parameter is the plugin specification
    -- the second is the table of options as set up in Lazy with the `opts` key
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "astronvim.plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      require("telescope").load_extension "chezmoi"
    end,
  },

  vim.keymap.set(
    "n",
    "<leader>fz",
    function() require("telescope").extensions.chezmoi.find_files() end,
    { desc = "Chezmoi find files" }
  ),
}
