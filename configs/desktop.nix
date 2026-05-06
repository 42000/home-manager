{ config, pkgs, lib, ... }:
{
    imports = [
        ./i3.nix
        ./taf.nix
    ];

    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        zathura
        nerd-fonts.caskaydia-mono
        liberation_ttf
        font-awesome
        kdePackages.dolphin
    ];
    # environment.etc."/xdg/menus/plasma-applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
    xdg.mimeApps.enable = lib.mkDefault true;
    xdg.configFile."mimeapps.list" = lib.mkIf config.xdg.mimeApps.enable { force = true; };
    xsession.enable = true;
}
