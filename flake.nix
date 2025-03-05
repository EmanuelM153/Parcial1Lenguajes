{
  description = "Flake para ejecutar los puntos";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:

        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              (python3.withPackages (
                p: with p; [
                  antlr4-python3-runtime
                ]
              ))
              ghc
              antlr
              gawk
              flex
            ];
          };
        }
      );
    };
}
