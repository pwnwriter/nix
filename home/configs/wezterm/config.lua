local wezterm = require "wezterm"

-- Font configuration
local font_name = "JetBrainsMono Nerd Font"
local font_config = wezterm.font_with_fallback {
  { family = font_name, weight = "Regular" },
}

local config = wezterm.config_builder() or {}

-- General configuration
config.font = font_config
config.tab_bar_at_bottom = true
config.check_for_updates = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 3
config.font_size = 12
config.color_scheme = "Catppuccin Macchiato"
config.cursor_blink_rate = 0
config.use_cap_height_to_scale_fallback_fonts = true
config.default_cursor_style = "BlinkingUnderline"
config.bold_brightens_ansi_colors = true

-- Window settings
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_padding = { left = 15, right = 10, top = 10, bottom = 10 }

return config
