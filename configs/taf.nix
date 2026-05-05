{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    kicad
    freecad
    ltspice
    # marche pas sans sudo, balek c'est électron de tt facon
    # drawio
    gimp
    inkscape
  ];
}
