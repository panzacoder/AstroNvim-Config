--============================================================================--
--
-- https://github.com/DanielVolchek/tailiscope.nvim
--
--============================================================================--
--
-- This plugin provides a telescope extension for tailwindcss classes that
-- mirrors the https://nerdcave.com/tailwind-cheat-sheet
--
-- KEYMAPS:
--   - <Leader>tw key will open the tailiscope telescope extension.
--
-- TUTORIAL:
--   - Type in the search bar to filter the tailwindcss classes.
--   - Press <CR> to copy the class to the clipboard.
--   - Press <ESC> to close the telescope window.
--   - Press <Tab> to limit what telescope will search for.
--
--  OPTIONS:
--    - register: sets the register to copy the tailwind class to. "+" is
--      synchronized with the system clipboard. { default = "a" }
--
--    - default: sets the search scope.
--      indicates what picker opens when running Telescope tailiscope can be
--      any file inside of docs dir but most useful opts are all, base,
--      categories, classes These are also accesible by running Telescope
--      tailiscope <picker>
--
--    - no_dot: if set to false will copy the class with the dot. { default = true }
--
--  TODO: (2024-08-05) Jon => figure out how tab works in telescope for tailiscope
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "danielvolchek/tailiscope.nvim",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript", "javascriptreact", "typescriptreact", "tailwindcss" },
        callback = function() require("telescope").load_extension "tailiscope" end,
      })

      require("telescope").setup {
        extensions = {
          tailiscope = {
            register = "+",
            default = "base",
            no_dot = true,
          },
        },
      }
      -- Set the keymap for opening tailiscope
      vim.keymap.set("n", "<Leader>tw", "<cmd>Telescope tailiscope<cr>", { desc = "Open Tailiscope" })
    end,
  },
}
