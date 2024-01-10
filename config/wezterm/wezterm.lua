local wezterm = require "wezterm"

-- Font configuration
local font_name = "JetBrainsMono Nerd Font"
local font_config = wezterm.font_with_fallback {
  { family = font_name, weight = "Regular" },
}


local config = wezterm.config_builder() or {}
-- General configuration
config.font = font_config
config.front_end = "OpenGL"
config.font_size = 9.38
config.color_scheme = "Catppuccin Macchiato"
config.enable_tab_bar = false
config.cursor_blink_rate = 0
config.use_cap_height_to_scale_fallback_fonts = true
config.enable_wayland = true
config.default_cursor_style = "BlinkingUnderline"
config.bold_brightens_ansi_colors = true

-- Window settings
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "NONE"
config.window_padding = { left = 15, right = 10, top = 10, bottom = 10 }
-- config.window_background_opacity = 0.99
-- config.default_prog = { "tmux" }

-- Keybindings
config.disable_default_key_bindings = true
config.keys = {
  { key = "c", mods = "ALT", action = wezterm.action.CopyTo "Clipboard" },
  { key = "v", mods = "ALT", action = wezterm.action.PasteFrom "Clipboard" },
  {
    key = "_",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "|",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
}

return config
