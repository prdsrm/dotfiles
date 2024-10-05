{
  description = "My Home Manager Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-utils, nixpkgs, home-manager, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        packages = {
          homeConfigurations = {
            "server@root" = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [ ./home-manager/server.nix ];
            };
          };
        };
        devShell = pkgs.mkShell {
          nativeBuildInputs =
            [ pkgs.home-manager pkgs.nixfmt pkgs.nil pkgs.gnumake pkgs.git ];
        };
      });
}
