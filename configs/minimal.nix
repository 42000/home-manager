{ config, pkgs, lib, ... }:

{
    imports = [
        ./nvim.nix
    ];
    home.packages = with pkgs; [
        fzf
        git-credential-manager
    ];
    programs = {
        command-not-found.enable = true;
    git = {
      enable = true;
      package = pkgs.gitFull;
      settings = {
        user.name = "42000";
        user.email = "ptimorveux" + "@" + "gmail.com";
        credential = {
            helper = "manager";
            credentialStore = "cache";
            "https://github.com".username = "42000";
        };
      };
      # signing = {
      #   key = "???";
      #   signByDefault = true;
      # };
    };
    zsh = {
      enable = true;
      initExtraFirst = ''
          alias vim='nvim'
          alias v='nvim'
          alias ls='ls --color=auto'
          alias l="ls -lah"
          alias grep='grep --color=auto'
          bindkey -e
          source <(fzf --zsh)

          setopt AUTO_LIST
          setopt PROMPT_SUBST
          PROMPT='%F{green} %%%f '
          RPROMPT='%~ %B%F{blue}%m%b%f'
      '';
      # plugins = [
      #   {
      #     name = "fast-syntax-highlighting";
      #     src = pkgs.fetchFromGitHub {
      #       owner = "zdharma";
      #       repo = "fast-syntax-highlighting";
      #       # rev = "v1.55";
      #       # sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
      #     };
      #   }
      # ];
    };
  };
}
