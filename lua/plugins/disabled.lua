--============================================================================--
--
-- https://docs.astronvim.com/configuration/customizing_plugins/#disabling-plugins
--
--============================================================================--
--
-- Disable plugins that are not needed or that are causing issues.
--
-- Document each disabled plugin with a brief explanation of the plugin's
-- functionality and why it was disabled. Use the following template:
--
-- MAIN FUNCTIONALITY: what is the plugin's main job?
-- REASON FOR DISABLING: why did you disable it, what problem was it causing?
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    -- MAIN FUNCTIONALITY:
    --
    -- REASON FOR DISABLING:
    "<github_user>/<plugin_name>",
    enabled = false,
  },
  {
    -- MAIN FUNCTIONALITY: use jk in quick succession to escape from insert
    -- mode into normal mode.
    --
    -- REASON FOR DISABLING: when I would use capital V to visually select a
    -- line, then hold j to select lines below, when going too far and pressing
    -- k to move back up a line or two, it would escape me from visual mode and
    -- I'd lose my selection.
    "max397574/better-escape.nvim",
    enabled = false,
  },
}
