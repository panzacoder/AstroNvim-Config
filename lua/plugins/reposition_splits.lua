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
--   <C-W>H - Move the current window all the way to the left
--   <C-W>J - .......................................... bottom
--   <C-W>K - .......................................... top
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

---@param direction string
local function move_window(direction)
  -- Mark the current position
  local success, err = pcall(function() vim.cmd "normal! mR" end)
  if not success then
    print("Error setting mark: " .. tostring(err))
    return
  end

  -- Check if NeoTree is open using the NeoTree API
  local manager = require "neo-tree.sources.manager"
  local renderer = require "neo-tree.ui.renderer"
  local state = manager.get_state "filesystem"
  local neotree_open = renderer.window_exists(state)

  if neotree_open then vim.cmd "Neotree close" end

  vim.cmd("wincmd " .. direction) -- Move the window in the specified direction

  vim.schedule(function() vim.cmd "Neotree show" end)

  -- Return to the marked position
  success, err = pcall(function() vim.cmd "normal! 'R" end)
  if not success then print("Error returning to mark: " .. tostring(err)) end
end

---@type LazySpec
return {
  {
    vim.keymap.set("n", "<C-W>H", function()
      vim.g.moving_window_c_hjkl = true
      move_window "H"
    end, { noremap = true, silent = true, desc = "Move window left accounting for NeoTree" }),

    vim.keymap.set("n", "<C-W>J", function()
      move_window "J"
      vim.g.moving_window_c_hjkl = true
    end, { noremap = true, silent = true, desc = "Move window down accounting for NeoTree" }),

    vim.keymap.set("n", "<C-W>K", function()
      move_window "K"
      vim.g.moving_window_c_hjkl = true
    end, { noremap = true, silent = true, desc = "Move window up accounting for NeoTree" }),

    vim.keymap.set("n", "<C-W>L", function()
      move_window "L"
      vim.g.moving_window_c_hjkl = true
    end, { noremap = true, silent = true, desc = "Move window right accounting for NeoTree" }),
  },
}
