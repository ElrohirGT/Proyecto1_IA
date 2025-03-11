{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    devShells.x86_64-linux = let
      pkgs = import nixpkgs {system = "x86_64-linux";};
    in {
      default = pkgs.mkShell {
        packages = [(pkgs.python3.withPackages (p: with p; [numpy matplotlib pytorch]))];
      };
    };
  };
}
