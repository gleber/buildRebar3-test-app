{}:
let
  sources = import ./sources.nix;
  overrides = {
    overlays = [
      (_: pkgs: { inherit sources; })
      (_: pkgs: { nix-filter = import pkgs.sources.nix-filter; })
    ];
    config = {};
  };
in rec {
  pkgsMaster = import sources.nixpkgs overrides;
  pkgsPatched = import sources."nixpkgs-patched" overrides;
  pkgs = pkgsPatched;
}
