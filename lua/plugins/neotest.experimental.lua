--============================================================================--
--
-- https://github.com/nvim-neotest/neotest
--
--============================================================================--
--
-- This plugin provides a test runner for neovim. It is a wrapper around the
-- nvim-nio plugin.
--
-- This configuration was provided by @timgremore, and is yet to be tested or
-- customized
--
-- STATUS: Experimental
-- TODO: (2024-08-05) Jon => figure out how to use the neotest plugin for tsx
-- files
--
--------------------------------------------------------------------------------

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local prefix = "<Leader>t"

---@type LazySpec
return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jfpedroza/neotest-elixir",
    "nvim-neotest/neotest-jest",
    "olimorris/neotest-rspec",
    "zidhuss/neotest-minitest",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n[prefix] = { desc = "󰗇 Tests" }
        maps.n[prefix .. "t"] = { function() require("neotest").run.run() end, desc = "Run test" }
        maps.n[prefix .. "d"] = { function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug test" }
        maps.n[prefix .. "f"] = {
          function() require("neotest").run.run(vim.fn.expand "%") end,
          desc = "Run all tests in file",
        }
        maps.n[prefix .. "p"] = {
          function() require("neotest").run.run(vim.fn.getcwd()) end,
          desc = "Run all tests in project",
        }
        maps.n[prefix .. "<CR>"] = { function() require("neotest").summary.toggle() end, desc = "Test Summary" }
        maps.n[prefix .. "o"] = { function() require("neotest").output.open() end, desc = "Output hover" }
        maps.n[prefix .. "O"] = { function() require("neotest").output_panel.toggle() end, desc = "Output window" }
        maps.n["]T"] = { function() require("neotest").jump.next() end, desc = "Next test" }
        maps.n["[T"] = { function() require("neotest").jump.prev() end, desc = "previous test" }
      end,
    },
  },
  opts = function(_, opts)
    -- opts.level = vim.log.levels.DEBUG
    opts.adapters = {
      require "neotest-elixir",
      require "neotest-jest",
      require "neotest-rspec",
      require "neotest-minitest",
    }
  end,
}
