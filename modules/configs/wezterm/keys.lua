local wezterm = require "wezterm"
local act = wezterm.action

local keybindings = {

	-- copy paste
	{ key = "c",   mods = "ALT",        action = act.CopyTo "Clipboard" },
	{ key = "v",   mods = "ALT",        action = act.PasteFrom "Clipboard" },

	-- goto last tab
	{ key = "Tab", mods = "ALT",        action = act.ActivateTabRelative(1) },

	--- Copymode vi
	{ key = "u",   mods = "CMD",        action = act.ActivateCopyMode },

	--- Splits
	{ key = "-",   mods = "CTRL",       action = act.SplitVertical { domain = "CurrentPaneDomain" } },
	{ key = ";",   mods = "CTRL",       action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

	--- spawn new tab
	{ key = "t",   mods = "ALT",        action = act.SpawnTab "CurrentPaneDomain" },

	--- Pane switching
	{ key = "h",   mods = "SHIFT|CTRL", action = act.ActivatePaneDirection "Left" },
	{ key = "l",   mods = "SHIFT|CTRL", action = act.ActivatePaneDirection "Right" },
	{ key = "k",   mods = "SHIFT|CTRL", action = act.ActivatePaneDirection "Up" },
	{ key = "j",   mods = "SHIFT|CTRL", action = act.ActivatePaneDirection "Down" },
	{ key = "z",   mods = "SHIFT|CTRL", action = "TogglePaneZoomState" },

	{ key = "h",   mods = "SHIFT|ALT",  action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
	{ key = "j",   mods = "SHIFT|ALT",  action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
	{ key = "k",   mods = "SHIFT|ALT",  action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
	{ key = "l",   mods = "SHIFT|ALT",  action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
}

return keybindings
