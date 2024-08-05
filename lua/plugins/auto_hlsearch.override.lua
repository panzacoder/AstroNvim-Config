--============================================================================--
--
-- https://github.com/AstroNvim/AstroNvim/issues/1529#issuecomment-2261568959
--
--============================================================================--
--
-- Setting auto_hlsearch to a function inside of opts -> on_keys ->
-- auto_hlsearch like this will override the auto_hlsearch functionality in
-- astrocore, resetting hlsearch functionality back to the default neovim
-- functionality.
--
-- The function ultimately maps the <Esc> key to clear the search highlighting
-- when pressed in normal mode. Providing this function will override whatever
-- AstroNvim would have done with the auto_hlsearch key, so we get to add
-- useful code while disabling unwanted behavior. Win-win!
--
-- The reason I do this is to be able to easily scan a file for other instances
-- of a variable or function definition, etc. And it works across multiple open
-- buffers, too. It's a quick easy way to orient yourself and get over to where
-- you want to go in the same or another buffer.
--
-- The default AstroNvim functionality of clearing the hlsearch on movement
-- makes it a lot harder to use those highlights as a visual aid / navigation
-- map for getting from point a to point b more quickly. And this is even,
-- perhaps especially, if you don't just hold hjkl to get where you want to go.
-- But it's nice for those that do that, too.
--
-- Furthermore, I change the default behavior of the * key (which performs the
-- action: search for the word under the cursor) so that when the * key is
-- pressed on a keyword in my source code, the cursor stays there on the newly
-- highlighted word and doesn't jump to the next instance of the word (which is
-- the default behavior).I do that with the vim.keymap.set function below.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    on_keys = {
      auto_hlsearch = {
        function(char)
          if vim.fn.mode() == "n" then
            local key = vim.fn.keytrans(char)
            if key == "<Esc>" then
              vim.cmd ":noh" -- Disable hlsearch when 'Esc' is pressed
            end
          end
        end,
      },
    },
  },

  -- Jump back to the current search result after pressing * on a word,
  -- effectively preventing the cursor from moving to the next result.
  vim.keymap.set("n", "*", function()
    -- Store the current view
    local view = vim.fn.winsaveview()

    -- Perform the search
    vim.cmd "normal! *N"

    -- Restore the view (cursor position)
    vim.fn.winrestview(view)
  end, { noremap = true, desc = "Search word under cursor, highlight, but don't move" }),
}
