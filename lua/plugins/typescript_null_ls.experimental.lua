--============================================================================--
--
-- https://docs.astronvim.com/recipes/advanced_lsp/#deno-deno-nvim
--   - Specifically the lua/plugins/typescript_deno_null_ls.lua file
--
--============================================================================--
--
-- I believe this file is for setting up the null-ls plugin to work with
-- JavaScript and TypeScript files. I think the idea is to use the prettier{d}
-- and eslint_d plugins to format and lint the files respectively. Specifically
-- using the prettier configuration files and eslint configuration files at the
-- root of a project.
--
-- NOTE: I'm not using Demo, at least intentionally, but I think since this
-- just extends the jay-babu/mason-null-ls.nvim plugin, I can just copy the
-- structure of the typescript_deno_null_ls.lua file and modify it to fit my
-- needs.
--
-- STATUS: Experimental
-- TODO: (2024-08-04) Jon => validate that the handlers for null-ls are loading
-- the proper prettier and eslint configs
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  "jay-babu/mason-null-ls.nvim",
  opts = {
    handlers = {
      -- for prettier
      prettier = function()
        require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
              or utils.root_has_file ".prettierrc"
              or utils.root_has_file ".prettierrc.json"
              or utils.root_has_file ".prettierrc.js"
          end,
        })
      end,
      -- for prettierd
      prettierd = function()
        require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
              or utils.root_has_file ".prettierrc"
              or utils.root_has_file ".prettierrc.json"
              or utils.root_has_file ".prettierrc.js"
          end,
        })
      end,
      -- For eslint_d:
      eslint_d = function()
        require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
              or utils.root_has_file ".eslintrc.json"
              or utils.root_has_file ".eslintrc.js"
          end,
        })
      end,
    },
  },
}
