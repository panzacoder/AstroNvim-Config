return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      local copilot = require "copilot"

      copilot.setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = false, -- We're handling this with Tab in the cmp mapping
            dismiss = false, -- We're handling this with Backspace in the cmp mapping
          },
        },
      }
    end,
  },
}
