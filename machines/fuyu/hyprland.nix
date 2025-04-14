{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      monitor = eDP-1, 1920x1080, 0x0, 1
      env = XCURSOR_SIZE,10

      exec-once = waybar > /tmp/waybar.log 2>&1
      exec-once = setsid swww-daemon 
      exec-once = swww img ~/Pictures/dreamy.png

      input {
          kb_layout = us

          follow_mouse = 1
          repeat_delay = 250
          repeat_rate = 80

          touchpad {
              natural_scroll = true
          }

          sensitivity = 0.1
      }

      general {
          gaps_in = 4
          gaps_out = 8
          border_size = 2
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)
          layout = dwindle
      }

      decoration {
          rounding = 7
          active_opacity = 0.95
          inactive_opacity = 0.95
          blur {
             size = 5
             passes = 3
              enabled = true
              new_optimizations = true
          }
      }

      misc {
          vfr = true
          disable_hyprland_logo = true
          disable_splash_rendering = true
          enable_swallow = true
          swallow_regex = ^(ghostty|kitty|footclient|mpv)$
      }


      animations {
          enabled = 1
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          pseudotile = true 
          preserve_split = true 
      }

      gestures {
          workspace_swipe = on
      }

      debug {
          overlay=false
          damage_blink=false
          disable_logs=true
      }


      $mainMod = Mod1
      $terMinal = ghostty
      $launCher = wofi
      $bar = waybar
      $browSer = firefox

      # Apps specific bindings
      bind = $mainMod, Enter, exec, $terMinal
      bind = $mainMod_Control_Shift, Q, exit,
      bind = $mainMod, space, exec, pkill $launCher -9 || $launCher --show drun
      bind = $mainMod, E, exec, dolphin

      bind = $mainMod_CTRL, F, togglefloating,
      bind = $mainMod_CTRL, P, pseudo, # dwindle
      bind = $mainMod_CTRL, S, togglesplit, # dwindle
      bind = $mainMod_CTRL, U, fullscreen

      bind = $mainMod, w, killactive,

      # Change focused window
      bind = $mainMod, h, movefocus, l
      bind = $mainMod, l, movefocus, r
      bind = $mainMod, k, movefocus, u
      bind = $mainMod, j, movefocus, d


      # Switch workspaces with mainMod + [0-9]
      bind = CTRL, 1, workspace, 1
      bind = CTRL, 2, workspace, 2
      bind = CTRL, 3, workspace, 3
      bind = CTRL, 4, workspace, 4
      bind = CTRL, 5, workspace, 5

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5


      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod , mouse:272, movewindow
      bindm = $mainMod , mouse:273, resizewindow

      # gouchpad shit not good so :)
      bindm = $mainMod, r, resizewindow

      # switch to last/previous workspace
      bind = $mainMod,TAB,workspace,previous

      ## Utilities
      bind = , XF86MonBrightnessUp,    exec,   light -A 5
      bind = , XF86MonBrightnessDown,  exec,   light -U 10
      bind = , XF86AudioLowerVolume,   exec,  pactl set-sink-volume @DEFAULT_SINK@ -5%
      bind = , XF86AudioMute,          exec,  pactl set-sink-mute @DEFAULT_SINK@ toggle
      bind = , XF86AudioRaiseVolume,   exec,  pactl set-sink-volume @DEFAULT_SINK@ +5%
      bind = , Print,   exec,  bash sst no_selection

      bind =  SHIFT, Print,   exec,  bash sst selection
      bind =  $mainMod_Control_Shift, b, exec, pkill -9 $bar || setsid $bar 
      bind =  $mainMod,       b, exec,  $browSer
          
    '';
  };
  catppuccin.hyprland.enable = true;
}
