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
-- opened or closed.
--
-- DEPENDENCIES:
--   - kwkarlwang/bufresize.nvim
--     - See https://github.com/kwkarlwang/bufresize.nvim/pull/8
--
-- OPTIONS:
--   - window.auto_expand_width: Auto expand width of window { default = false }
--   - window.mappings: Disable the default mapping for the `/` key which is to
--     filter the tree. It's an akward interface to me.
--   - filesystem > filtered_items: Prevent the display of certain files
--   - filesystem > follow_current_file: Auto open current file in the tree
--   - group_empty_dirs: Group empty directories together { default = false }
--   - event_handlers: Resize windows proportionally when tree is opened/closed
--   - nvim_create_autocmd: Set keymap for `/` key when FileType is "neo-tree"
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

      opts.event_handlers = vim.list_extend(opts.event_handlers or {}, {
        {
          event = "file_opened",
          handler = function()
            -- Check if neo-tree is the only buffer open
            local buffers = vim.api.nvim_list_bufs()
            local visible_buffers = 0
            for _, buf in ipairs(buffers) do
              if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
                visible_buffers = visible_buffers + 1
              end
            end

            if visible_buffers == 1 then
              require("neo-tree.command").execute { action = "show", dir = vim.fn.getcwd() }
            end
          end,
        },
        -- Keep existing event handlers
        {
          event = "neo_tree_window_before_open",
          handler = function()
            if vim.g.moving_window_c_hjkl then
              vim.g.moving_window_c_hjkl = false
              return
            end
            -- print "neo_tree_window_before_open"
            require("bufresize").block_register()
          end,
        },
        {
          event = "neo_tree_window_after_open",
          handler = function()
            if vim.g.moving_window_c_hjkl then
              vim.g.moving_window_c_hjkl = false
              return
            end
            -- print "neo_tree_window_after_open"
            require("bufresize").resize_open()
          end,
        },
        {
          event = "neo_tree_window_before_close",
          handler = function()
            if vim.g.moving_window_c_hjkl then
              vim.g.moving_window_c_hjkl = false
              return
            end
            -- print "neo_tree_window_before_close"
            require("bufresize").block_register()
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function()
            if vim.g.moving_window_c_hjkl then
              vim.g.moving_window_c_hjkl = false
              return
            end
            -- print "neo_tree_window_after_close"
            require("bufresize").resize_close()
          end,
        },
      })

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
