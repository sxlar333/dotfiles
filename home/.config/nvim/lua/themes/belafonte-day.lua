-- Belafonte Day, ported from the kitty theme
-- Syntax colors are the kitty hues darkened for contrast on the #d4ccb9 bg
-- (kitty hexes in comments; syntax colors now sit at ~4.4:1 or better)

local M = {}

M.base_30 = {
  white = "#45363b", -- fg
  darker_black = "#cec6b3",
  black = "#d4ccb9", -- nvim bg
  black2 = "#c9c1ae",
  one_bg = "#c2baa7",
  one_bg2 = "#bcb4a1", -- context highlight
  one_bg3 = "#b6ae9b",
  grey = "#a89f8c",
  grey_fg = "#6b6259", -- comments
  grey_fg2 = "#5f574f",
  light_grey = "#7d736b", -- line numbers
  line = "#c0b8a5", -- vertsplit etc
  red = "#a02b25", -- #bd100d
  baby_pink = "#b5453f",
  pink = "#c46963",
  green = "#5b5530", -- #858062
  vibrant_green = "#6f6940",
  blue = "#2f566a", -- #416978
  nord_blue = "#295062",
  yellow = "#7f4e07", -- #e9a448
  sun = "#96600a",
  purple = "#84401c", -- #96522b
  dark_purple = "#6f3417",
  teal = "#4a5259",
  orange = "#8a4320",
  cyan = "#4f575e", -- #98999c
  statusline_bg = "#c9c1ae",
  lightbg = "#c2baa7",
  pmenu_bg = "#5c544c",
  folder_bg = "#7d736b",
}

M.base_16 = {
  base00 = "#d4ccb9",
  base01 = "#cec6b3",
  base02 = "#b8b09d", -- visual selection
  base03 = "#b6ae9b",
  base04 = "#7d736b",
  base05 = "#45363b",
  base06 = "#392b30",
  base07 = "#20111a",
  base08 = "#a02b25",
  base09 = "#84401c",
  base0A = "#7f4e07",
  base0B = "#5b5530",
  base0C = "#4f575e",
  base0D = "#2f566a",
  base0E = "#a02b25",
  base0F = "#5e5252",
}

M.polish_hl = {
  treesitter = {
    ["@comment"] = { fg = M.base_30.grey_fg, italic = true },
    ["@variable.parameter"] = { fg = M.base_16.base09, italic = true },
    ["@keyword.import"] = { fg = M.base_16.base0D },
    ["@constructor"] = { fg = M.base_16.base0D },
    ["@tag"] = { fg = M.base_16.base08 },
    ["@tag.attribute"] = { fg = M.base_16.base0A },
    ["@tag.delimiter"] = { fg = M.base_16.base0F },
  },

  defaults = {
    Visual = { bg = M.base_16.base02 },
    LineNr = { fg = M.base_30.light_grey },
    PmenuSel = { fg = M.base_30.black, bg = M.base_30.pmenu_bg },
  },

  statusline = {
    St_pos_text = { fg = M.base_30.white },
  },
}

M.type = "light"

M = require("base46").override_theme(M, "belafonte-day")

return M
