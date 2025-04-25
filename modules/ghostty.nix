{ config, ... }:
let
  ghosttyPath = "${config.xdg.configHome}/ghostty";
in
{
  home.file."${ghosttyPath}/config".text = ''
    window-padding-x = 40,40
    window-padding-y = 20,30

    shell-integration = zsh
    auto-update = off

    theme = dark:catppuccin-mocha,light:rose-pine-dawn
    mouse-hide-while-typing = true

    background-opacity = 99
    background-blur-radius = 100

    macos-titlebar-style = hidden

    shell-integration-features = no-cursor,sudo,no-title

    window-colorspace = "display-p3"

    gtk-titlebar = false

    keybind = cmd+shift+o=toggle_quick_terminal

    keybind = cmd+s>z=toggle_split_zoom

    keybind = cmd+shift+o=toggle_quick_terminal

    keybind = alt+c=copy_to_clipboard
    keybind = alt+v=paste_from_clipboard

    keybind = cmd+s>j=goto_split:bottom

    keybind = cmd+s>k=goto_split:top
    keybind = cmd+s>h=goto_split:left
    keybind = cmd+s>l=goto_split:right

    # split
    keybind = cmd+s>\=new_split:right
    keybind = cmd+s>-=new_split:down

  '';
}
