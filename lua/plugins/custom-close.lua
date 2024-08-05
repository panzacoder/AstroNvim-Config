--============================================================================--
--
-- CUSTOM PLUGIN, created by iterating on code with ChatGPT 4o
--
--============================================================================--
--
-- This custom Neovim plugin is designed to work within the context of
-- AstroNvim, which uses a specific approach to managing buffers, tabs, and
-- windows. Let's break down how this plugin functions:
--
--   1. The main function close_buffer_conditionally() is the entry point, which
--      is mapped to the "QQ" key in normal mode.
--
--   2. It first checks the number of buffers, tabs, and windows in the current
--      Neovim session.
--
--   3. The plugin then handles different scenarios:
--
--      a. If there's only one buffer, tab, and window, it quits Vim entirely
--         with qall!.
--
--      b. If there are multiple tabs but only one buffer, it closes the
--         current tab but keeps the buffer open.
--
--      c. For other cases, it calls close_buffers_in_tab().
--
--   4. The close_buffers_in_tab() function handles various scenarios:
--
--      a. If there are multiple tabs and only one buffer in the current tab, it
--         closes the tab and removes the buffer using AstroNvim's mini.bufremove
--         plugin.
--
--      b. If there are multiple buffers in the current tab and two windows
--         (likely a main window and a sidebar/drawer), it removes the current
--         buffer using mini.bufremove.
--
--      c. If there's only one buffer in the tab but two windows, it closes the
--         current window (likely closing a sidebar/drawer).
--
--      d. For other cases with multiple buffers and windows, it either closes
--        the current split or removes the buffer, depending on the situation.
--
--   5. The plugin uses AstroNvim's mini.bufremove plugin to safely remove
--      buffers without disrupting the window layout.
--
--   6. It takes into account AstroNvim's use of a tabline (for managing tabs)
--      and a bufferline (for managing buffers within a tab).
--
-- This plugin aims to provide a smart way to close buffers, windows, and tabs
-- based on the current context, which is particularly useful in AstroNvim's
-- setup where buffers and tabs are managed separately. It tries to maintain a
-- smooth workflow by closing things in a logical order: first attempting to
-- close buffers within a tab, then closing tabs if necessary, and finally
-- quitting Vim if no other buffers or tabs remain.
--
-- TODO: (2024-08-04) Jon => add a debug mode so that it's easier to turn the
-- pause_until_dismissed function on and off.
--------------------------------------------------------------------------------

-- Function to display a message and pause until dismissed
-- function pause_until_dismissed(message)
--   vim.cmd "redraw"
--   vim.cmd "echohl Question"
--   vim.cmd('echo "' .. message .. '"')
--   vim.cmd "echohl None"
--
--   local response = vim.fn.input "Press Enter to continue..."
--
--   -- Optionally, you can check the response and handle it accordingly.
--   -- For example, if the user types 'q', you can quit the script.
--   if response == "q" then
--     vim.cmd 'echo "Script canceled."'
--     return
--   end
-- end

-- Define a function to close the current buffer conditionally
local function close_buffers_in_tab(num_tabs, num_windows)
  if num_tabs > 1 then
    if #vim.t.bufs == 1 then
      -- pause_until_dismissed "close tab, bufremove"
      local bufnr = vim.api.nvim_get_current_buf()
      vim.cmd.tabclose()
      require("mini.bufremove").delete(bufnr, true)
      return
    end
  end

  if #vim.t.bufs > 1 and num_windows == 2 then
    -- pause_until_dismissed "drawer open bufremove"
    local bufnr = vim.api.nvim_get_current_buf()
    require("mini.bufremove").delete(bufnr, true)
    return
  end

  if #vim.t.bufs == 1 and num_windows == 2 then
    -- pause_until_dismissed "drawer open q"
    vim.cmd "q" -- close buffer and drawer
    return
  end

  if #vim.t.bufs > 1 and num_windows > 1 then
    -- pause_until_dismissed "q"
    vim.cmd "q" -- close split
  else
    -- pause_until_dismissed "bufremove2"
    local bufnr = vim.api.nvim_get_current_buf()
    require("mini.bufremove").delete(bufnr, true)
  end
end

-- Function to close the current buffer conditionally
local function close_buffer_conditionally()
  local num_buffers = #vim.fn.getbufinfo { buflisted = 1 }
  local num_tabs = vim.fn.tabpagenr "$"
  local num_windows = vim.fn.winnr "$"

  -- Check if there is more than one buffer or tab or window to act upon, otherwise quit vim
  if num_buffers > 1 or num_tabs > 1 or num_windows > 1 then
    -- Check if only one listed buffer remains in the vim session but is open in more than one tab.
    -- If so, close the tab, but leave the buffer open.
    if num_tabs > 1 and num_buffers == 1 then
      vim.cmd.tabclose()
      return
    end

    close_buffers_in_tab(num_tabs, num_windows)
  else
    vim.cmd "qall!"
  end

  return {}
end

---@type LazySpec
return {
  vim.keymap.set("n", "QQ", close_buffer_conditionally, {
    noremap = true,
    silent = true,
    desc = "Conditionally close window, buffer, then tab",
  }),
}
