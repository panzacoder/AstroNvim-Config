--============================================================================--
--
-- https://github.com/hrsh7th/nvim-cmp
--
-- Dependencies:
--   - https://github.com/L3MON4D3/LuaSnip
--   - https://github.com/zbirenbaum/copilot.lua
--   - https://github.com/abecodes/tabout.nvim
--   - https://github.com/hrsh7th/cmp-buffer
--   - https://github.com/hrsh7th/cmp-nvim-lsp
--   - https://github.com/hrsh7th/cmp-path
--   - https://github.com/hrsh7th/cmp-emoji
--   - https://github.com/saadparwaiz1/cmp_luasnip
--   - https://github.com/onsails/lspkind.nvim
--
-- Notes:
--   - https://github.com/hrsh7th/nvim-cmp/blob/ae644feb7b67bf1ce4260c231d1d4300b19c6f30/doc/cmp.txt#L149
--   - https://docs.astronvim.com/configuration/customizing_plugins/#extending-core-plugin-config-functions
--
--============================================================================--
--
-- nvim-cmp is a completion plugin that is designed to be fast and easy to use.
-- It is highly customizable and can be extended with custom sources and
-- completion items. It also has a large ecosystem of plugins that can be added
-- to enhance its functionality.
--
-- AstroNvim has a custom configuration for nvim-cmp that sets up the default
-- settings and sources. It also adds some custom settings to extend the default
-- configuration. The custom configuration includes mappings for the completion
-- menu, sources for completion items, and formatting for the completion items.
-- We override many of those things here to add support for LuaSnip and Copilot.
--
-- CMP TUTORIAL:
--   - Open a file in Neovim
--   - Start typing a word, such as "require" or "function" and a completion
--     menu will appear. The first item will be selected.
--   - Press <UP/DONW> to navigate the completion item list, respectively
--     - Or Press <C-n> to select the next item and <C-p> to select the previous
--   - Press <C-d> to scroll down in the documentation windows (if shown)
--   - Press <C-u> to scroll up in the documentation windows (if shown)
--   - Press <CR> to accept the currently selected item
--   - Press <C-e> to abort the completion menu and restore the original text
--   - Press <BS> to dismiss the completion menu
--     Note: <BS> will dismiss the suggestion and wait 5 seconds before
--     re-enabling to make typing easier and less intrusive
--
-- Custom LuaSnip Comment Annotations TUTORIAL:
--   - Type fixme, fix, todo, hack, warn, perf, note, or test, then press
--     <Tab> (or <CR>) to expand the annotation snippet. It will look like this:
--
--     FIXME: (2024-08-12) Jon =>
--       FIX: (2024-08-12) Jon =>
--      TODO: (2024-08-12) Jon =>
--      HACK: (2024-08-12) Jon =>
--      WARN: (2024-08-12) Jon =>
--      PERF: (2024-08-12) Jon =>
--      NOTE: (2024-08-12) Jon =>
--      TEST: (2024-08-12) Jon =>
--
--     The snippet will automatically insert the current date and your name,
--     after which the intention is to write a comment about the issue or task
--
-- General LuaSnip TUTORIAL:
--   - Type a snippet trigger, such as "for", "if", or "func"
--   - Select a snippet from the completion menu using the CMP tutorial above
--
--   Once a snippet is triggered and displayed:
--     - Press <Tab> to jump to the next snippet placeholder
--     - Press <S-Tab> to jump to the previous snippet placeholder
--     - The final <Tab> will exit the snippet and place the cursor at the end
--       of the snippet context where you can continue typing
--
-- CoPilot TUTORIAL:
--   - Start typing and CoPilot will suggest completions
--   - Press <Tab> to accept a copilot suggestion
--   - Press <BS> to dismiss the copilot suggestion
--     Note: <BS> will dismiss the suggestion and wait 5 seconds before
--     re-enabling to make typing easier and less intrusive
--
-- Tabout TUTORIAL:
--   - When inside a string, parentheses, or brackets context, press <Tab> to
--     exit that context which will move the cursor outside of the innermost
--     current context. <Tab> is then repeatable to continue to exit out of the
--     other remaining nested contexts. However, sometimes, if all the
--     remaining closing context characters are in a row, a single <Tab> will
--     exit ALL of the remaining contexts.
--
--     NOTE: The temporary pausing of the completion menu (cmp) and CoPilot
--     suggestions will allow you to navigate out of the context via <Tab>
--     without accepting a suggestion as easily.
--
--------------------------------------------------------------------------------
return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "saadparwaiz1/cmp_luasnip",
    "zbirenbaum/copilot.lua",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
  },
  opts = function(_, _opts)
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local copilot_suggestion = require "copilot.suggestion"

    local function is_word_before_cursor(words)
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local before_cursor = line:sub(1, col):lower()

      for _, word in ipairs(words) do
        if before_cursor:match(word .. "%s*$") then return true end
      end
      return false
    end

    local comment_annotation_snippet = {
      "fixme",
      "fix",
      "todo",
      "hack",
      "warn",
      "perf",
      "note",
      "test",
    }

    local copilot_timer = nil
    local function pause_copilot(duration)
      -- Cancel previous timer if it exists
      if copilot_timer then vim.fn.timer_stop(copilot_timer) end

      -- Disable Copilot suggestions
      copilot_suggestion.toggle_auto_trigger()

      -- Schedule re-enabling after the specified duration
      copilot_timer = vim.defer_fn(function()
        copilot_suggestion.toggle_auto_trigger()
        copilot_timer = nil
      end, duration * 1000) -- Convert seconds to milliseconds
    end

    local cmp_timer = nil
    local function pause_cmp(duration)
      -- Cancel previous timer if it exists
      if cmp_timer then vim.fn.timer_stop(cmp_timer) end

      require("cmp").setup.buffer { enabled = false }

      -- Schedule re-enabling after the specified duration
      cmp_timer = vim.defer_fn(function()
        require("cmp").setup.buffer { enabled = true }
        cmp_timer = nil
      end, duration * 1000) -- Convert seconds to milliseconds
    end

    return {
      mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expandable() and is_word_before_cursor(comment_annotation_snippet) then
            luasnip.expand()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif copilot_suggestion.is_visible() then
            copilot_suggestion.accept()
          else
            fallback() -- tabout plugin / default tab behavior
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          elseif cmp.visible() then
            cmp.select_prev_item()
          else
            fallback() -- tabout plugin / default tab behavior
          end
        end, { "i", "s" }),
        ["<BS>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()
            -- after hitting backspace to dismiss a cmp suggestion, wait <n>
            -- seconds before re-enabling so we can use the tabout fallback
            -- to get out of quotes or parens, etc.
            pause_cmp(5)
          elseif copilot_suggestion.is_visible() then
            -- after hitting backspace to dismiss a copilot suggestion, wait <n>
            -- seconds before re-enabling so we can use the tabout fallback to
            -- get out of quotes or parens, etc.
            pause_copilot(5)
            copilot_suggestion.dismiss()
          else
            fallback()
          end
        end, { "i" }),
      },
      sources = cmp.config.sources {
        { name = "luasnip", priority = 1000 },
        { name = "copilot", priority = 900 },
        { name = "nvim_lsp", priority = 800 },
        { name = "emoji", priority = 700 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
          vim_item.menu = ({
            luasnip = "[Snippet]",
            copilot = "[Copilot]",
            nvim_lsp = "[LSP]",
            emoji = "[Emoji]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert", -- ,noselect is another option
      },

      -- Hide copilot suggestions if the cmp menu is open or the specific
      -- comment annotation keywords are present: fixme, fix, todo, hack, warn,
      -- perf, note, test
      cmp.event:on("menu_opened", function()
        if is_word_before_cursor(comment_annotation_snippet) then
          print "fixme is present"
          vim.b.copilot_suggestion_hidden = true
        else
          print "no special word"
          vim.b.copilot_suggestion_hidden = false
        end
      end),

      cmp.event:on("menu_closed", function() vim.b.copilot_suggestion_hidden = false end),
    }
  end,
}
