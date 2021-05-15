let
  sources = import ./nix {};
  pkgs = sources.pkgs;
  erlangPkgs = pkgs.beam.packagesWith pkgs.beam.interpreters.erlang;
in
erlangPkgs.buildRebar3 {
  name = "test-app";
  version = "0.1.0";
  src = pkgs.nix-filter {
    root = ./.;
    exclude = [
      ./nix
      ./result
      (pkgs.nix-filter.matchExt "nix")
    ];
  };

  beamDeps = (builtins.attrValues (import ./rebar-deps.nix { inherit (pkgs) fetchHex fetchFromGitHub; }));
}
