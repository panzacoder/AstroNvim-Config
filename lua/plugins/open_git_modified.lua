--============================================================================--
--
-- CUSTOM PLUGIN, created by iterating on code with ChatGPT 4o
--
--============================================================================--
--
-- PURPOSE: open the files that have been added or modified in the git
-- repository each as a buffer in the bufferline of a new window
--
-- NOTE: This works best when you only have a few files that have been
-- modified. If you have more than 4-5 files, it might be better to use a
-- different approach.
--
--------------------------------------------------------------------------------

-- Ensure plenary is available
local Job = require "plenary.job"

-- Function to open modified and new git files
local function open_git_modified_files()
  -- Run git command to get modified and new files
  Job:new({
    command = "git",
    args = { "ls-files", "--modified", "--others", "--exclude-standard" },
    on_exit = function(j, return_val)
      if return_val == 0 then
        local result = j:result()
        vim.schedule(function()
          for _, file in ipairs(result) do
            vim.cmd("e " .. file)
          end
        end)
      else
        print "Failed to get modified and new files"
      end
    end,
  }):start()
end

-- Return a table with the setup functions
---@type LazySpec
return {
  -- Create a command to call the function
  vim.api.nvim_create_user_command("OpenGitModifiedFiles", open_git_modified_files, { nargs = 0 }),

  -- Map a keyboard shortcut to the command
  vim.api.nvim_set_keymap("n", "<leader>gm", ":OpenGitModifiedFiles<CR>", { noremap = true, silent = true }),
}
