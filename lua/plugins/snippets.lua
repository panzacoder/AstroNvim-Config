-- Load your custom vscode-style snippets (copied to this config's snippets/ dir).
-- LuaSnip is the snippet engine under blink.cmp in v6, so loading them here makes
-- them available in completion. Your snippet files: snippets/*.json + package.json.

---@type LazySpec
return {
  "L3MON4D3/LuaSnip",
  opts = function(_, opts)
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }
    return opts
  end,
}
