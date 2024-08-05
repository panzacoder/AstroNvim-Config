--============================================================================--
--
-- CUSTOM PLUGIN, created by iterating on code with ChatGPT 4o
--
--============================================================================--
--
-- PURPOSE: This plugin is designed to allow for repositioning of splits in Vim
-- while accounting for the NeoTree plugin being open which messes up window
-- movement commands without taking extra steps.
--
-- This config overrides the default keymaps for moving windows around in Vim:
--
--   <C-W>J - Move the current window all the way to the bottom
--   <C-W>K - .......................................... top
--   <C-W>H - .......................................... left
--   <C-W>L - .......................................... right
--
-- The code will allow for repositioning a split to another location using
-- those default keybindings, while accounting for neo-tree in the process by
-- closing and reopening the neo-tree window before and after the split
-- movement, respectively.
--
-- Additionally, after the split has been moved. The cursor will be returned to
-- the original position.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    vim.keymap.set("n", "<C-W>J", function()
      -- Mark the current position
      local success, err = pcall(vim.cmd, "normal! mR")
      if not success then
        print("Error setting mark: " .. err)
        return
      end

      -- Check if NeoTree is open using the NeoTree API
      local manager = require "neo-tree.sources.manager"
      local renderer = require "neo-tree.ui.renderer"
      local state = manager.get_state "filesystem"
      local neotree_open = renderer.window_exists(state)

      if neotree_open then vim.cmd "Neotree close" end

      vim.cmd "wincmd J" -- Move the window down

      if neotree_open then vim.schedule(function() vim.cmd "Neotree show" end) end

      -- Return to the marked position
      success, err = pcall(vim.cmd, "normal! 'R")
      if not success then print("Error returning to mark: " .. err) end
    end, { noremap = true, silent = true, desc = "Move window down accounting for NeoTree" }),

    vim.keymap.set("n", "<C-W>K", function()
      -- Mark the current position
      local success, err = pcall(vim.cmd, "normal! mR")
      if not success then
        print("Error setting mark: " .. err)
        return
      end

      -- Check if NeoTree is open using the NeoTree API
      local manager = require "neo-tree.sources.manager"
      local renderer = require "neo-tree.ui.renderer"
      local state = manager.get_state "filesystem"
      local neotree_open = renderer.window_exists(state)

      if neotree_open then vim.cmd "Neotree close" end

      vim.cmd "wincmd K" -- Move the window up

      if neotree_open then vim.schedule(function() vim.cmd "Neotree show" end) end

      -- Return to the marked position
      success, err = pcall(vim.cmd, "normal! 'R")
      if not success then print("Error returning to mark: " .. err) end
    end, { noremap = true, silent = true, desc = "Move window up accounting for NeoTree" }),

    vim.keymap.set("n", "<C-W>H", function()
      -- Mark the current position
      local success, err = pcall(vim.cmd, "normal! mR")
      if not success then
        print("Error setting mark: " .. err)
        return
      end

      -- Check if NeoTree is open using the NeoTree API
      local manager = require "neo-tree.sources.manager"
      local renderer = require "neo-tree.ui.renderer"
      local state = manager.get_state "filesystem"
      local neotree_open = renderer.window_exists(state)

      if neotree_open then vim.cmd "Neotree close" end

      vim.cmd "wincmd H" -- Move the window left

      if neotree_open then vim.schedule(function() vim.cmd "Neotree show" end) end

      -- Return to the marked position
      success, err = pcall(vim.cmd, "normal! 'R")
      if not success then print("Error returning to mark: " .. err) end
    end, { noremap = true, silent = true, desc = "Move window left accounting for NeoTree" }),

    -- NOTE: This mapping is not needed for moving right as the NeoTree window is on the left side of the screen
  },
}
