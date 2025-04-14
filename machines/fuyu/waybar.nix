{ ... }:

let
  waybarConfig = ''
    {
      "position": "top",
      "exlusive": "true",
      "passthrough": "true",
      "gtk-layer-shell": "true",
      "margin-top": 10,
      "margin-left": 10,
      "margin-right": 15,
      "height": 41,
      "modules-left": [
        "cava",
        "cpu",
        "memory",
        "disk",
        "hyprland/workspaces",
      ],
      "modules-center": [
        "hyprland/window",
      ],
      "modules-right": [
        "custom/wallpaper",
        "backlight/slider",
        "pulseaudio",
        "pulseaudio#microphone",
        "battery",
        "clock",
        "tray"
      ],

    "backlight/slider": {
      "min": 20,
      "max": 100,
      "orientation": "horizontal",
      "device": "intel_backlight",
      "reverse-scrolling": true,
      "scroll-step": 20,
      "format": "<span color='#a6e3a1'>󰃠 </span><span color='#cdd6f4'>{percent}%</span>",
      "tooltip": false
    },

      "tray": {
        "icon-size": 16,
        "icon-theme": "Adwaita",
        "spacing": 2
      },
      "custom/spacer": {
        "format": " ",
        "tooltip": false
      },
      "separator": {
        "format": " | "
      },

      "hyprland/window": {
        "format": "{}",
        "max-length": 35,
        "rewrite": {
          "": "pwn"
        },
        "separate-outputs": true
      },

    "hyprland/workspaces": {
      "format": "{icon}",
      "on-click": "activate",
      "format-icons": {
        "1": "<span color='#f38ba8'>󰲠</span>",
        "2": "<span color='#fab387'>󰲢</span>",
        "3": "<span color='#f9e2af'>󰲤</span>",
        "4": "<span color='#a6e3a1'>󰲦</span>",
        "5": "<span color='#89b4fa'>󰲨</span>",
        "active": "<span color='#cba6f7'></span>",
        "urgent": "<span color='#f38ba8'></span>",
        "persistent": "<span color='#cdd6f4'></span>",
        "focused": "<span color='#ffffff'></span>",
        "default": "<span color='#585b70'></span>",
      },
      "sort-by-number": true,
      "persistent-workspaces": {
        "*": 5,
        "eDP-1": 5
      }
    },
      "clock": {
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format": "<span color='#89b4fa'>󰥔 </span><span color='#cdd6f4'>{:%H:%M | %a %d %b}</span>",
        "format-alt": "{:%Y-%m-%d}"
      },

      "cpu": {
        "format": "<span color='#89b4fa'>󰍛</span> <span color='#cdd6f4'>{usage}%</span>",
        "interval": 1,
        "format-alt-click": "click",
        "format-alt": "<span color='#00FF00'>{icon0}{icon1}{icon2}{icon3}</span> <span color='#FFFFFF'>{usage:>2}%</span> <span color='#00FF00'>󰍛</span>",
        "format-icons": ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"],
        "on-click": "gnome-system-monitor"
      },
      "memory": {
        "interval": 3,
        "format": "<span color='#f38ba8'> </span> <span color='#cdd6f4'>{used:0.1f}G</span>"
      },


        "custom/wallpaper": {
            "interval": "once",
          "format": "<span color='#f38ba8'> 󰊠 </span>",
            "on-click": "wal",
        }, 
    "cava": {
        "framerate": 120,
        "autosens": 1,
        "bars": 12,
        "method": "pipewire",
        "source": "auto",
        "bar_delimiter": 0,
        "input_delay": 2,
        "sleep_timer": 2,
        "hide_on_silence": true,
        "format-icons" : ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" ]
    },

    "pulseaudio": {
      "format": "<span color='#a6e3a1'>{icon}</span> <span color='#cdd6f4'>{volume}%</span>",
      "format-bluetooth": "<span color='#a6e3a1'>{icon}</span> <span color='#cdd6f4'>{volume}%</span>",
      "tooltip": false,
      "format-muted": "<span color='#f38ba8'>󰝟 </span>",
      "on-click": "wpctl set-mute @DEFAULT_SINK@ toggle",
      "on-scroll-up": "wpctl set-volume @DEFAULT_SINK@ 5%+",
      "on-scroll-down": "wpctl set-volume @DEFAULT_SINK@ 5%-",
      "format-icons": {
        "headphone": "",
        "hands-free": "",
        "headset": "",
        "phone": "",
        "portable": "",
        "car": "",
        "default": [
          " ",
          " ",
          " "
        ]
      }
    },

    "battery": {
      "states": {
        "warning": 30,
        "critical": 15
      },
      "format": "<span color='#a6e3a1'>󰁹 </span><span color='#cdd6f4'>{capacity}%</span>",
      "format-charging": "<span color='#a6e3a1'>󰂄 </span><span color='#cdd6f4'>{capacity}%</span>",
      "format-plugged": "<span color='#a6e3a1'>󱤓 </span><span color='#cdd6f4'>{capacity}%</span>",
      "format-full": "<span color='#a6e3a1'>󰁹 </span><span color='#cdd6f4'>{capacity}%</span>",
      "format-alt": "<span color='#cdd6f4'>{time}</span> <span color='#a6e3a1'>{icon}</span>",
      "format-icons": [
        "󰁺", "󰁼", "󰁾", "󰂀", "󰂂"
      ]
    },

    "pulseaudio#microphone": {
      "format": "{format_source}",
      "format-source": "<span color='#f38ba8'> </span><span color='#cdd6f4'>{volume}%</span>",
      "format-source-muted": "<span color='#f38ba8'>󰍭</span>",
      "on-click": "wpctl set-mute @DEFAULT_SOURCE@ toggle",
      "on-scroll-up": "wpctl set-volume @DEFAULT_SOURCE@ 5%+",
      "on-scroll-down": "wpctl set-volume @DEFAULT_SOURCE@ 5%-"
    },

      "disk": {
        "interval": 3,
        "path": "/home",
        "format": "<span color='#a6e3a1'> </span><span color='#cdd6f4'>{free}</span>",
        "unit": "GB"
      }
    }
  '';

  styleConfig = ''
    * {
        border: none;
        border-radius: 13px;
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        font-size: 14px;
        min-height: 0;
    }

    window#waybar {
        background: rgba(21, 18, 27, 0);
        color: #cdd6f4;
    }

    tooltip {
        background: #000000;
        border-radius: 10px;
        border: 2.5px solid #8aadf4;
        padding: 5px;
    }

    /* Workspaces */
    #workspaces {
        background: #1e1e2e;
        border-radius: 13px;
        margin: 5px;
        padding-right: 0;
    }

    #workspaces button {
        color: #313244;
        margin-right: 5px;
        padding: 0;
    }

    #workspaces button.active,
    #workspaces button.visible {
        color: #89b4fa;
        box-shadow: inset 0 -1px #1e1e2e;
    }

    #workspaces button.focused {
        color: #a6adc8;
        background: #eba0ac;
    }

    #workspaces button.persistent {
        color: #f9e2af;
    }

    #workspaces button.empty {
        color: #313244;
    }

    #workspaces button.urgent {
        color: #f38ba8;
    }

    /* Modules */
    #battery,
    #cpu,
    #memory,
    #disk,
    #window,
    #clock,
    #pulseaudio,
    #pulseaudio.microphone,
    #language,
    #tray,
    #custom-wallpaper,
    #backlight-slider,
    #cava,
    #network,
    #custom-notifications,
    #custom-updates,
    #custom-player,
    #bluetooth {
        background: #1e1e2e;
        color: inherit;
        border-radius: 13px;
        margin: 5px;
        padding: 1.5px 7px;
    }

    /* Specific styling */
    #clock {
        color: #a6e3a1;
    }

    #memory {
        color: #89b4fa;
    }

    #disk {
        color: #f9e2af;
    }

    #cpu {
        color: #89b4fa;
        padding-left: 10px;
    }

    #pulseaudio {
        color: #89b4fa;
    }

    #pulseaudio.microphone {
        color: #cba6f7;
        margin-left: 5px;
    }

    #language {
        margin-right: 0;
    }

    #network {
        color: #f9e2af;
    }

    #custom-notifications {
        color: #f9e2af;
        padding-left: 9px;
        padding-right: 15px;
    }

    #custom-updates {
        color: #89b4fa;
        border-left: 0;
        border-right: 0;
    }

    #custom-player {
        color: #cba6f7;
        padding-left: 4px;
    }

    /* Window module centered and neat */
    #window {
        margin-left: 60px;
        margin-right: 60px;
    }

  '';

in
{
  home.file.".config/waybar/config.jsonc".text = waybarConfig;
  home.file.".config/waybar/style.css".text = styleConfig;
  # programs.waybar.enable = true;
}
