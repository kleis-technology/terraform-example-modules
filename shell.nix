let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    opentofu
    tofu-ls
    awscli2
  ];
}
