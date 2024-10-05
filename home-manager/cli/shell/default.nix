{ pkgs, ... }: {
  home.packages = with pkgs; [ fd ripgrep ranger onefetch gitui gnupg ];
  programs = {
    git = {
      userName = "user";
      userEmail = "user@example.com";
      enable = true;
      ignores = [ ".direnv" ];
      aliases = { last = "log -1 HEAD"; };
      extraConfig = {
        color.ui = true;
        pull.rebase = true;
        init.defaultBranch = "main";
      };
      delta.enable = true;
    };
    tmux.enable = true;
    bash = {
      enable = true;
      # NOTE: quick fix, sometimes, it doesn't work.
      bashrcExtra = ''export PATH=~/.nix-profile/bin:$PATH'';
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    btop = {
      enable = true;
      settings = { proc_tree = true; };
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
