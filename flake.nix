# taken from https://github.com/prisma/prisma/issues/3026#issuecomment-927258138
{
  description = "test";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.turbo.url = "github:alexghr/turbo.nix/v1.6.3";

  outputs = { self, nixpkgs, turbo }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = [ pkgs.bashInteractive ];
        buildInputs = with pkgs; [
          turbo.packages.${system}.default
        ];
        shellHook = with pkgs; ''
          export TURBO_BINARY_PATH="${turbo.packages.${system}.default}/bin/turbo"
        '';
      };
    };
}
