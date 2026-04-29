{pkgs, lib, ... }:

{
# NE MARCHE PAS
  #     xsession.xrandrHeads = [
  #   {
  #     output = "eDP-1";
  #     monitorConfig = ''
  #       Option "DPMS" "false"
  #     '';
  #   }
  #   {
  #     output = "DP3-1";
  #     primary = true;
  #     monitorConfig = ''
  #       Option "DPMS" "false"
  #     '';
  #   }
  #   {
  #     output = "DP3-3";
  #     monitorConfig = ''
  #       Option "DPMS" "false"
  #     '';
  #   }
  # ];
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3;

        config = rec {
            modifier = "Mod4";
            terminal = "gnome-terminal";
            bars = [
            {
            fonts = {
                names = ["CaskaydiaMono Nerd Font"];
                style = "Bold Semi-Condensed";
                size = 12.0;
            };
                position = "top";
                statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
            }
            ];

            window.border = 0;

            gaps = {
                inner = 4;
                outer = 4;
            };
            fonts = {
                names = ["CaskaydiaMono Nerd Font"];
                style = "Bold Semi-Condensed";
                size = 12.0;
            };

            keybindings = lib.mkOptionDefault {
                "XF86AudioMute" = "exec amixer set Master toggle";
                "XF86AudioLowerVolume" = "exec amixer set Master 4%-";
                "XF86AudioRaiseVolume" = "exec amixer set Master 4%+";
                "XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
                "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";
                "${modifier}+Return" = "exec ${terminal}";
                "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
                "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
                "${modifier}+b" = "exec /usr/bin/google-chrome";
                "${modifier}+e" = "exec /usr/bin/nautilus";


                "${modifier}+h" = "focus left";
                "${modifier}+l" = "focus right";
                "${modifier}+j" = "focus down";
                "${modifier}+k" = "focus up";

                "${modifier}+Shift+h" = "move left";
                "${modifier}+Shift+l" = "move right";
                "${modifier}+Shift+j" = "move down";
                "${modifier}+Shift+k" = "move up";

                "${modifier}+c" = "kill";

                "${modifier}+Shift+x" = "exec i3-msg exit";
                "${modifier}+x" = "exec i3lock -c 222222";

            };
            startup = [
            {
                command = ''
                    exec xset r rate 250 40
                    '';
                always = true;
                notification = false;
            }
            {
                command = ''
                    exec xrandr --output eDP-1 --auto && xrandr --output DP-3-3 --primary --auto --right-of eDP-1 && xrandr --output DP-3-1 --rotate left --auto --right-of DP-3-3
                    '';
                always = true;
                notification = false;
            }
            {
                command = "exec i3-msg workspace 1";
                always = true;
                notification = false;
            }
            # {
            #     command = "i3bar";
            #     always = true;
            #     notification = false;
            # }
            {
                command = "${pkgs.feh}/bin/feh --bg-tile ~/background.png";
                always = true;
                notification = false;
            }
            ];
#  extraPackages = with pkgs; [
#    i3status # gives you the default i3 status bar
#    # dmenu #application launcher most people use
#    # i3lock #default i3 screen locker
# ];
        };
    };
    programs.i3status-rust = {
        enable = true;
        bars = {
            top = {
                blocks = [
                { block = "cpu"; }
                {
                    block = "disk_space";
                    path = "/";
                    info_type = "available";
                    interval = 20;
                    warning = 20.0;
                    alert = 10.0;
                    format = " $icon root: $available.eng(w:2) ";
                }
                {
                    block = "memory";
                    format = " $icon $mem_total_used_percents.eng(w:2) ";
                    format_alt = " $icon_swap $swap_used_percents.eng(w:2) ";
                }
                {
                    block = "sound";
                    click = [
                    {
                        button = "left";
                        cmd = "pavucontrol";
                    }
                    ];
                }
                {
                    block = "time";
                    interval = 5;
                    format = " $timestamp.datetime(f:'%a %d/%m %R') ";
                }
                ];
                icons = "awesome5";
                theme = "gruvbox-dark";
            };
        };
    };
    programs.feh.enable = true;
}
