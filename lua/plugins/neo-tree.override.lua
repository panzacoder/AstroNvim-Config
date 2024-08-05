--============================================================================--
--
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
--============================================================================--
--
-- Neo Tree is a file explorer plugin for neovim. Here we override some of the
-- defaults to customize it for our use case.
--
-- Of particular note are changes to the searching/filtering defaults inside
-- of neo-tree. This config prevents the default filtering when a forward
-- search is performed `/`. Instead, this config forces vim to search
-- regularly like you would in any vim buffer! See the nvim_create_autocmd
-- code below for the FileType pattern of "neo-tree" to see how this is done.
--
-- This config also defines some event_handlers to resize open windows
-- proportionally when the tree is opened or closed. This is done by using the
-- bufresize plugin to block the resizing of the windows while the tree is
-- opened or closed. However, it is not currently working as expected, so it
-- is commented out for now. See the FIXME below with regard to conflicts with
-- <C-W>H, J, K, L mappings.
--
-- DEPENDENCIES:
--   - kwkarlwang/bufresize.nvim
--
-- OPTIONS:
--   - window.auto_expand_width: Automatically expand the width of the window {
--     default = false }
--   - window.mappings: Disable the default mapping for the `/` key
--   - filesystem.filtered_items: Prevent the display of certain files
--   - filesystem.follow_current_file: Automatically open the current file in
--     the tree
--   - group_empty_dirs: Group empty directories together { default = false }
--   - event_handlers: Resize the windows when the tree is opened or closed
--   - nvim_create_autocmd: Set a keymap for the `/` key when the FileType is
--     "neo-tree"
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "kwkarlwang/bufresize.nvim",
    },
    opts = function(_, opts)
      opts.window = vim.tbl_deep_extend("force", opts.window or {}, {
        auto_expand_width = true,
        mappings = {
          ["/"] = "noop", -- Disable the default mapping
        },
      })

      opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
        filtered_items = {
          visible = true,
          never_show = {
            ".DS_Store",
            "thumbs.db",
            ".cache",
            ".git",
            ".github",
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      })

      opts.group_empty_dirs = true

      --  FIXME: (2024-08-04) Jon => this seems to conflict with my custom <C-W>H and J, K, L mappings, so leaving commented out for now
      --
      -- opts.event_handlers = {
      --   -- See https://github.com/kwkarlwang/bufresize.nvim/pull/8
      --   {
      --     event = "neo_tree_window_before_open",
      --     handler = function()
      --       -- print "neo_tree_window_before_open"
      --       require("bufresize").block_register()
      --     end,
      --   },
      --   {
      --     event = "neo_tree_window_after_open",
      --     handler = function()
      --       -- print "neo_tree_window_after_open"
      --       require("bufresize").resize_open()
      --     end,
      --   },
      --   {
      --     event = "neo_tree_window_before_close",
      --     handler = function()
      --       -- print "neo_tree_window_before_close"
      --       require("bufresize").block_register()
      --     end,
      --   },
      --   {
      --     event = "neo_tree_window_after_close",
      --     handler = function()
      --       -- print "neo_tree_window_after_close"
      --       require("bufresize").resize_close()
      --     end,
      --   },
      -- }

      return opts
    end,
    config = function(_, opts)
      require("neo-tree").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function() vim.api.nvim_buf_set_keymap(0, "n", "/", "/", { noremap = true, silent = true }) end,
      })
    end,
  },
}
