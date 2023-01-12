# taken from https://github.com/prisma/prisma/issues/3026#issuecomment-927258138
{
  description = "test";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.turbo.url = "github:alexghr/turbo.nix/v1.7.0";

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
          TMPDIR="$PWD/.corepack"
          mkdir -p "$TMPDIR"
          COREPACK_DIR="$(mktemp --tmpdir="$TMPDIR" --directory)"
          echo "Enabling Corepack. Install directory: $COREPACK_DIR"
          corepack enable --install-directory "$COREPACK_DIR"

          export TURBO_BINARY_PATH="${turbo.packages.${system}.default}/bin/turbo"
          export PATH="$PATH:$COREPACK_DIR"
        '';
      };
    };
}
