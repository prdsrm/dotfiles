{ pkgs, ... }: {
  home.stateVersion = "24.11";
  home.username = "root";
  home.homeDirectory = "/root";

  programs.home-manager.enable = true;
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  imports = [ ./cli ];
}
