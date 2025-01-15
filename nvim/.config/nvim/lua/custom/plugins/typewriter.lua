return {
  'joshuadanpeterson/typewriter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('typewriter').setup {
      enable_with_zen_mode = true,
      keep_cursor_position = true,
      enable_notifications = true,
      enable_horizontal_scroll = true,
    }
  end,
  opts = {},
}
