{ config, pkgs, lib, ... }:
{
    imports = [
        ./configs/i3.nix
        ./configs/taf.nix
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
