--============================================================================--
--
-- https://github.com/piersolenski/wtf.nvim
--
--============================================================================--
-- PREREQUISITES:
--   - export an OpenAI API key as an environment variable in your shell:
--     e.g. in .zshenv or .zshrc: `export OPENAI_API_KEY=sk-xxxxxxxxxxxxxx`
--
-- TUTORIAL:
--   - which key bindings are available:
--     - <Leader> (in a tsx file) shows the "WTF TypeScript..." folder
--     - <Leader>w shows "WTF TypeScript...press t to continue"
--     - <Leader>wt show the list of options for the current line or visual
--       selection
--
--   - xmap <Leader>wtf will send the current context to OpenAI and return a
--     helpful response with suggestions on how to fix the issues
--
--   - nmap <Leader>wtg will open the current error on a given line in google
--
-- STATUS: experimental
-- TODO: (2024-08-07) Jon => verify that wtf.nvim works well to provide help with typescript errors
-- TODO: (2024-08-07) Jon => verify that the wtf.nvim hooks are working
--
--------------------------------------------------------------------------------
return {
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    -- config = function()
    --   local wtf = require "wtf"
    --   wtf.setup {
    --     openai_api_key = "sk-xxxxxxxxxxxxxx",
    --     openai_model_id = "gpt-3.5-turbo",
    --   }
    -- end,
    opts = {
      -- -- Default AI popup type
      -- popup_type = "popup" | "horizontal" | "vertical",
      -- -- An alternative way to set your API key
      -- openai_api_key = "sk-xxxxxxxxxxxxxx",
      -- -- ChatGPT Model
      -- openai_model_id = "gpt-3.5-turbo",
      -- -- Send code as well as diagnostics
      -- context = true,
      -- -- Set your preferred language for the response
      -- language = "english",
      -- -- Any additional instructions
      -- additional_instructions = "Start the reply with 'OH HAI THERE'",
      -- -- Default search engine, can be overridden by passing an option to WtfSeatch
      -- search_engine = "google" | "duck_duck_go" | "stack_overflow" | "github" | "phind" | "perplexity",
      -- Add custom colours
      -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      -- -- Callbacks
      hooks = {
        request_started = function() vim.cmd "hi StatusLine ctermbg=NONE ctermfg=yellow" end,
        request_finished = vim.schedule_wrap(function() vim.cmd "hi StatusLine ctermbg=NONE ctermfg=NONE" end),
      },
    },
    keys = {
      {
        "<Leader>w",
        mode = { "n", "x" },
        desc = "WTF TypeScript...",
      },
      {
        "<Leader>wt",
        mode = { "n", "x" },
        desc = "WTF TypeScript...press t to continue",
      },
      {
        "<Leader>wtf",
        mode = { "n", "x" },
        function() require("wtf").ai() end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n" },
        "<Leader>wtf",
        function() require("wtf").search() end,
        desc = "Search diagnostic with Google",
      },
    },
  },
}
