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
    ];
    xsession.enable = true;
}
