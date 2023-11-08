# DO NOT EDIT. This file is auto generated by ./scripts/generate-default.sh
{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; };
  modules = import ./modules;
  overlays = import ./overlays;

  cf-alias = pkgs.callPackage ./pkgs/cf-alias.nix { };
  fetch-hls = pkgs.callPackage ./pkgs/fetch-hls.nix { };
  gomodrun = pkgs.callPackage ./pkgs/gomodrun.nix { };
  languagetool-code-comments = pkgs.callPackage ./pkgs/languagetool-code-comments.nix { };
  oatmeal = pkgs.callPackage ./pkgs/oatmeal.nix { };
}
