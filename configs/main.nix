{ config, pkgs, lib, ... }:

{
  imports = [
    ./i3.nix
    ./nvim.nix
    ./taf.nix
    # ./polybar.nix
  ];

  # fonts.fontconfig.enable = true;
  # home.packages = with pkgs; [
  #     (nerdfonts.override {
  #      fonts = [
  #      "IBMPlexMono"
  #      "Iosevka"
  #      "IosevkaTerm"
  #      ];
  #      })
  # ];
  # programs = {
  #   # i3status.enable = true;
  #   home-manager.enable = true;
  #   command-not-found.enable = true;
  #   git = {
  #     enable = true;
  #     settings.user.name = "42000";
  #     settings.user.email = "ptimorveux" + "@" + "gmail.com";
  #     signing = {
  #       key = "937F956B9008A22F";
  #       signByDefault = true;
  #     };
  #   };
  #
  #   zsh = {
  #     enable = true;
  #     initExtraFirst = ''
  #         alias vim='nvim'
  #         alias v='nvim'
  #         alias ls='ls --color=auto'
  #         alias l="ls -lah"
  #         alias grep='grep --color=auto'
  #         bindkey -e
  #         source <(fzf --zsh)
  #
  #         setopt AUTO_LIST
  #         setopt PROMPT_SUBST
  #         PROMPT='%F{green} %%%f '
  #         RPROMPT='%~ %B%F{blue}%m%b%f'
  #     '';
  #     # plugins = [
  #     #   {
  #     #     name = "fast-syntax-highlighting";
  #     #     src = pkgs.fetchFromGitHub {
  #     #       owner = "zdharma";
  #     #       repo = "fast-syntax-highlighting";
  #     #       rev = "v1.55";
  #     #       sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
  #     #     };
  #     #   }
  #     # ];
  #   };
  # };
  #
  # xsession.enable = true;
}
