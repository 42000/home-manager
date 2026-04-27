{ config, pkgs, lib, ... }:

{
    nixpkgs = {
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
        };
    };
    imports = [
        ./configs/desktop.nix
        ./configs/minimal.nix
    ];
    home.username = "ts280586";
    home.homeDirectory = "/volatile/home/ts280586";
# regarder release notes avant de changer
    home.stateVersion = "26.05"; # Please read the comment before changing.
    programs.home-manager.enable = true;
}
