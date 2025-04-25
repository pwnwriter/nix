{ lib, pkgs, ... }:

{

  home.packages = with pkgs; [
    gnomeExtensions.clipboard-history
    gnomeExtensions.dash-to-dock
    gnomeExtensions.space-bar
    gnomeExtensions.user-themes
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
  ];

  dconf.settings = with lib.hm.gvariant; {

    "org/gnome/desktop/wm/keybindings" = {
      "close" = [ "<Alt>q" ];
      "minimize" = [ "<Alt>comma" ];
      "move-to-center" = [ "<Control><Alt>c" ];
      "move-to-workspace-1" = [ "<Alt><Shift>1" ];
      "move-to-workspace-10" = [ "<Alt><Shift>0" ];
      "move-to-workspace-2" = [ "<Alt><Shift>2" ];
      "move-to-workspace-3" = [ "<Alt><Shift>3" ];
      "move-to-workspace-4" = [ "<Alt><Shift>4" ];
      "move-to-workspace-5" = [ "<Alt><Shift>5" ];
      "move-to-workspace-6" = [ "<Alt><Shift>6" ];
      "move-to-workspace-7" = [ "<Alt><Shift>7" ];
      "move-to-workspace-8" = [ "<Alt><Shift>8" ];
      "move-to-workspace-9" = [ "<Alt><Shift>9" ];
      "switch-applications" = [ "<Alt>Tab" ];
      "switch-to-workspace-1" = [ "<Ctrl>1" ];
      "switch-to-workspace-2" = [ "<Ctrl>2" ];
      "switch-to-workspace-3" = [ "<Ctrl>3" ];
      "switch-to-workspace-4" = [ "<Ctrl>4" ];
      "switch-to-workspace-5" = [ "<Ctrl>5" ];
      "switch-to-workspace-6" = [ "<Ctrl>6" ];
      "switch-to-workspace-7" = [ "<Ctrl>7" ];
      "switch-to-workspace-8" = [ "<Ctrl>8" ];
      "switch-to-workspace-9" = [ "<Ctrl>9" ];
      "toggle-fullscreen" = [ "<Alt><Ctrl>f" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7" = {
      "binding" = "<Alt>Enter";
      "command" = "ghostty";
      "name" = "Ghostty";
    };

    "org/gnome/desktop/interface" = {
      "enable-animations" = false;
      "enable-hot-corners" = false;
      "font-hinting" = "slight";
      "show-battery-percentage" = true;
      "toolkit-accessibility" = false;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      "delay" = mkUint32 300;
      "repeat-interval" = mkUint32 20;
    };

    "org/gnome/desktop/sound" = {
      "event-sounds" = false;
    };

    "org/gnome/mutter" = {
      "center-new-windows" = true;
      "dynamic-workspaces" = true;
      "edge-tiling" = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/altcopy/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/altpaste/"
      ];
    };

    "org/gnome/shell/extensions/space-bar/appearance" = {
      "inactive-workspace-text-color" = "rgb(154,153,150)";
      "workspace-margin" = 3;
      "workspaces-bar-padding" = 3;
    };

    "org/gnome/shell/extensions/space-bar/behavior" = {
      "scroll-wheel" = "panel";
      "show-empty-workspaces" = false;
      "smart-workspace-names" = false;
      "toggle-overview" = false;
    };

    "org/gnome/shell/extensions/space-bar/shortcuts" = {
      "enable-activate-workspace-shortcuts" = true;
      "enable-move-to-workspace-shortcuts" = true;
    };

    "org/gnome/shell/extensions/clipboard-history" = {
      "display-mode" = 3;
      "next-entry" = [ "<Alt><Ctrl>n" ];
      "prev-entry" = [ "<Alt><Ctrl>p" ];
      "toggle-menu" = [ "<Alt><Ctrl>c" ];
    };

    "org/gnome/shell/extensions/useless-gaps" = {
      "inner-gap" = lib.hm.gvariant.mkUint32 16;
      "outer-gap" = lib.hm.gvariant.mkUint32 16;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close,minimize,maximize:";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      "accessibility-menu" = true;
      "activities-button" = true;
      "activities-button-icon-monochrome" = false;
      "activities-button-label" = true;
      "animation" = 0;
      "app-menu" = false;
      "app-menu-icon" = true;
      "app-menu-label" = true;
      "background-menu" = true;
      "clock-menu" = true;
      "controls-manager-spacing-size" = 0;
      "dash" = true;
      "dash-icon-size" = 0;
      "dash-separator" = true;
      "double-super-to-appgrid" = true;
      "gesture" = true;
      "hot-corner" = false;
      "keyboard-layout" = true;
      "notification-banner-position" = 2;
      "osd" = false;
      "panel" = true;
      "panel-arrow" = true;
      "panel-button-padding-size" = 4;
      "panel-corner-size" = 0;
      "panel-in-overview" = true;
      "panel-indicator-padding-size" = 0;
      "panel-notification-icon" = true;
      "panel-size" = 0;
      "power-icon" = true;
      "quick-settings" = true;
      "ripple-box" = true;
      "screen-sharing-indicator" = true;
      "search" = true;
      "show-apps-button" = true;
      "startup-status" = 0;
      "theme" = false;
      "window-demands-attention-focus" = false;
      "window-menu-take-screenshot-button" = true;
      "window-picker-icon" = true;
      "window-preview-caption" = true;
      "window-preview-close-button" = true;
      "workspace" = false;
      "workspace-background-corner-size" = 0;
      "workspace-peek" = false;
      "workspace-popup" = true;
      "workspace-switcher-size" = 0;
      "workspace-wrap-around" = false;
      "workspaces-in-app-grid" = true;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "just-perfection-desktop@just-perfection"
        "hidetopbar@mathieu.bidon.ca"
        "appindicatorsupport@rgcjonas.gmail.com"
        "caffeine@patapon.info"
        "dash-to-dock@micxgx.gmail.com"
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        "space-bar@luchrioh"
        "clipboard-history@alexsaveau.dev"
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      "settings-version" = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      "pipeline" = "pipeline_default_rounded";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      "animate-show-apps" = true;
      "apply-custom-theme" = true;
      "autohide" = true;
      "custom-theme-shrink" = false;
      "dash-max-icon-size" = 15;
      "dock-fixed" = false;
      "dock-position" = "LEFT";
      "extend-height" = false;
      "height-fraction" = 0.9;
      "intellihide" = false;
      "preferred-monitor" = -1; # use main monitor
      "preview-size-scale" = 0.0;
      "show-show-apps-button" = false;
      "show-trash" = false;
      "transparency-mode" = "DYNAMIC";
      "unity-backlit-items" = true;
    };

    "org/gnome/shell/extensions/pop-shell" = {
      "active-hint" = false;
      "gap-inner" = mkUint32 1;
      "gap-outer" = mkUint32 1;
      "tile-by-default" = true;
    };

  };
}
