--============================================================================--
--
-- https://github.com/tpope/vim-fugitive
--
--============================================================================--
--
-- vim-fugitive is a Vim plug-in that provides a feature complete Git wrapper
-- for Vim.
--
-- The main reason I find vim-fugitive still useful in a sea of other Git
-- plugins like Lazygit and Neogit, is when I'm wanting to easily add and
-- commit a new file that I'm editing, sometimes it's easier to just do it
-- directly and not deal with the context switching of opening Lazygit
--
-- I've mapped the most useful (to me) commands that I use on a regular basis
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "tpope/vim-fugitive",
    config = function()
      -- git add on the current (saved) buffer
      vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>")

      -- quick toggle of git blame
      vim.keymap.set("n", "<leader>gb", ":Git blame -w -M<CR>")

      -- git checkout the current (saved) buffer. This resets the buffer's
      -- underlying file to the last commit
      vim.keymap.set("n", "<leader>gco", ":Gread<CR>")

      -- Open the commit window in vim to write a better commit message than is
      -- possible in lazygit. Wrap is set to 72 characters.
      vim.keymap.set("n", "<leader>gcm", ":silent Git commit<CR>")
    end,
  },
}
