if true then return {} end -- DISABLED (ported from v4): delete this line to enable

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
