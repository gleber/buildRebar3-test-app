let
  sources = import ./nix {};
  pkgs = sources.pkgs;
in
pkgs.stdenv.mkDerivation {
  name = "test-shell";
  NIX_PATH = ("nixpkgs=" + toString pkgs.path);
  buildInputs = with pkgs; [
    erlang
    rebar3
  ];
}
