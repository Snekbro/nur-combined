# Common modules
{ ... }:

{
  imports = [
    ./bluetooth.nix
    ./documentation.nix
    ./ergodox.nix
    ./home.nix
    ./language.nix
    ./media.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./upower.nix
    ./users.nix
  ];
}
