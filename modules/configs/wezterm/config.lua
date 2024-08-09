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
--- config.tab_max_width = 4
config.font_size = 12.5
config.color_scheme = "Catppuccin Mocha"
config.cursor_blink_rate = 0
config.use_cap_height_to_scale_fallback_fonts = true
config.default_cursor_style = "BlinkingUnderline"
config.bold_brightens_ansi_colors = true

-- Window settings
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_padding = { left = 50, right = 50, top = 50, bottom = 50 }

config.colors = {
  tab_bar = {
    background = "None",
    active_tab = {
      bg_color = "None",
      fg_color = "#c0c0c0",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = "None",
      fg_color = "#808080",
    },
    inactive_tab_hover = {
      bg_color = "None",
      fg_color = "#909090",
      italic = true,
    },

    new_tab = {
      bg_color = "None",
      fg_color = "#808080",
    },
    new_tab_hover = {
      bg_color = "#494d64",
      fg_color = "#909090",
      italic = true,
    },
  },
}

wezterm.on("gui-startup", function(cmd)
  local active_screen = wezterm.gui.screens()["active"]
  local width = active_screen.width * 0.90
  local height = active_screen.height * 0.85
  local x = (active_screen.width - width) / 2 -- Center horizontally
  local y = (active_screen.height - height) / 2 -- Center vertically

  local _, _, window = wezterm.mux.spawn_window(cmd or {})

  window:gui_window():set_position(x, y)
  window:gui_window():set_inner_size(width, height)
end)

local process_icons = {
  ["psql"] = "󱤢",
  ["usql"] = "󱤢",
  ["nvim"] = "",
  ["make"] = "󱂟",
  ["just"] = "󱂟",
  ["vim"] = " ",
  ["go"] = "",
  ["python3"] = "",
  ["zsh"] = " ",
  ["bash"] = " ",
  ["htop"] = "󱋊",
  ["cargo"] = "󱘗",
  ["sudo"] = "",
  ["git"] = "",
  ["lua"] = "󰢱",
  ["zola"] = "󰘯 ",
  ["zig"] = "",
}

local function get_process(tab)
  if not tab.active_pane or tab.active_pane.foreground_process_name == "" then
    return nil
  end

  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
  if string.find(process_name, "kubectl") then
    process_name = "kubectl"
  end

  return process_icons[process_name]
end

wezterm.on("format-tab-title", function(tab)
  local process = get_process(tab)
  local title = process and string.format(" %s  ", process) or "   "
  return {
    { Text = title },
  }
end)

return config
