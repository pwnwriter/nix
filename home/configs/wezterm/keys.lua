local wezterm = require "wezterm"
local act = wezterm.action
local act_cb = wezterm.action_callback

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

        {
    key = "e",
    mods = "CTRL|SHIFT",
    action = act.PromptInputLine({
      description = "Enter new name for tab",
      action = act_cb(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
}

return keybindings
