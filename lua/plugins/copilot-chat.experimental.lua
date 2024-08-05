--============================================================================--
--
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
--
--============================================================================--
--
-- CopilotChat.nvim is a plugin that allows you to interact with Copilot from
-- within Neovim.
--
-- The custom mappings add a page of which-key mappings for the AI actions
-- shown below
--
-- STATUS: Experimental
-- TODO: validate each mapping for copilot below works and works as intended
---
--------------------------------------------------------------------------------
---@type LazySpec
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim_lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      -- See Configuration section for rest
      -- window = {
      --   layout = "float",
      --   relative = "cursor",
      --   width = 1,
      --   height = 0.4,
      --   row = 1,
      -- },
    },
    -- See Commands section for default commands if you want to lazy load on them
    --
  },
  ---@type AstroCoreOpts
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>a"] = { name = "AI Actions" },
          ["<Leader>aa"] = { desc = "AI Toggle Chat", "<CMD>CopilotChatToggle<CR>" },
          ["<Leader>ae"] = { desc = "AI Explain", "<CMD>CopilotChatExplain<CR>" },
          ["<Leader>ar"] = { desc = "AI Review", "<CMD>CopilotChatReview<CR>" },
          ["<Leader>at"] = { desc = "AI Tests", "<CMD>CopilotChatTests<CR>" },
          ["<Leader>af"] = { desc = "AI Fix", "<CMD>CopilotChatFix<CR>" },
          ["<Leader>ao"] = { desc = "AI Optimize", "<CMD>CopilotChatOptimize<CR>" },
          ["<Leader>ad"] = { desc = "AI Documentation", "<CMD>CopilotChatDocumentation<CR>" },
          ["<Leader>ac"] = { desc = "AI Generate Commit", "<CMD>CopilotChatCommit<CR>" },
          ["<Leader>ax"] = { desc = "AI CopilotChat Reset", "<CMD>CopilotChatReset<CR>" },
          ["<Leader>am"] = { desc = "AI Select Model", "<CMD>CopilotChatModel<CR>" },
        },
        v = {
          ["<Leader>a"] = { name = "AI Actions" },
          ["<Leader>aa"] = { desc = "AI Toggle Chat", "<CMD>CopilotChatToggle<CR>" },
          ["<Leader>ae"] = { desc = "AI Explain", "<CMD>CopilotChatExplain<CR>" },
          ["<Leader>ar"] = { desc = "AI Review", "<CMD>CopilotChatReview<CR>" },
          ["<Leader>at"] = { desc = "AI Tests", "<CMD>CopilotChatTests<CR>" },
          ["<Leader>af"] = { desc = "AI Fix", "<CMD>CopilotChatFix<CR>" },
          ["<Leader>ao"] = { desc = "AI Optimize", "<CMD>CopilotChatOptimize<CR>" },
          ["<Leader>ad"] = { desc = "AI Documentation", "<CMD>CopilotChatDocumentation<CR>" },
          ["<Leader>ac"] = { desc = "AI Generate Commit", "<CMD>CopilotChatCommit<CR>" },
          ["<Leader>ax"] = { desc = "AI CopilotChat Reset", "<CMD>CopilotChatReset<CR>" },
          ["<Leader>am"] = { desc = "AI Select Model", "<CMD>CopilotChatModel<CR>" },
        },
      },
    },
  },
}
