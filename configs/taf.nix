{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    kicad
    freecad
    ltspice
  ];
}
