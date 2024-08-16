return {
  'echasnovski/mini.map',
  version = '*',
  keys = function (_, keys)
    local minimap = require('mini.map');
    return {
      {
        "<leader>Mm",
        minimap.toggle,
        desc = "Toggle Mini Map"
      },
    }
  end,
}
