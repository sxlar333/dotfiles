-- Personal overrides for blink.cmp.
--
-- The plugin itself (event, version, dependencies, nvim-cmp disabling and the
-- NvChad menu/snippet/autopairs integration) is loaded by
-- `{ import = "nvchad.blink.lazyspec" }` in lua/plugins/init.lua.
--
-- Everything below is deep-merged on top of NvChad's defaults, so only list
-- the things you actually want to change.
return {
  "saghen/blink.cmp",
  opts = {
    appearance = {
      -- 'mono' for 'Nerd Font Mono', 'normal' for 'Nerd Font'
      nerd_font_variant = "mono",
    },

    -- only show the documentation popup when manually triggered (C-space)
    completion = { documentation = { auto_show = false } },
  },
}
