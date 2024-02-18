local wezterm = require 'wezterm'

if wezterm.config_builder then
  config = wezterm.config_builder()
end

return {
  color_scheme = 'Catppuccin Mocha',
  cursor_blink_rate = 0,
  enable_scroll_bar = false,
  scrollback_lines = 5000,
  enable_tab_bar = false,
  font = wezterm.font 'JetBrains Mono',
  font_size = 14,
  freetype_load_target = "Normal",
  freetype_load_flags = "NO_HINTING",
  window_padding = {
    top = 0,
    bottom = 0,
  },
}
