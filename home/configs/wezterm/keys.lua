local wezterm = require "wezterm"
local act = wezterm.action

local keybindings = {
  { key = "c", mods = "ALT", action = act.CopyTo "Clipboard" },
  { key = "v", mods = "ALT", action = act.PasteFrom "Clipboard" },

  { key = "u", mods = "CMD", action = act.ActivateCopyMode },

  {
    key = "-",
    mods = "CTRL",
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "|",
    mods = "CTRL",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },

  {
    key = "t",
    mods = "ALT",
    action = act.SpawnTab "CurrentPaneDomain",
  },

    { key = 'Tab',        mods = 'ALT',       action = act.ActivateTabRelative(1) },
}

return keybindings
