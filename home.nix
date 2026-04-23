{ config, pkgs, lib, ... }:

{
    nixpkgs = {
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
        };
    };
    imports = [
        ./configs/i3.nix
        ./configs/taf.nix
        ./configs/minimal.nix
    ];
    home.username = "ts280586";
    home.homeDirectory = "/volatile/home/ts280586";
# regarder release notes avant de changer
    home.stateVersion = "26.05"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        zathura
        nerd-fonts.caskaydia-mono
        liberation_ttf
        font-awesome
    ];

    programs.home-manager.enable = true;
    xsession.enable = true;
}
