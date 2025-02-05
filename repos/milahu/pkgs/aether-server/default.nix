# nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
# ./result/bin/aether-frontend run

# based on
# https://gist.github.com/nehbit/4a8c3d81d543e85c9df974f521732b1e
# https://getaether.net/docs/developers/
# https://meta.getaether.net/t/building-from-source-on-arch-linux/244

{ lib
, stdenv
, fetchFromGitHub
, electron_11
, buildGoModule
, callPackage # nodeDependencies
}:

let
/* TODO use node from electron_11?
  # nodejs-11_x was removed, EOL 2019-06-01 https://github.com/NixOS/nixpkgs/pull/70256
  # this will take some minutes to compile ...
  nodejs-11_x = (import (builtins.fetchGit {
    # https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package=nodejs
    name = "nixpkgs-nodejs-11.15.0"; # name in nix store
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "84f318e323989435d5dd54b4038b0af728f20c85";
  }) {}).nodejs-11_x;
*/

  aether-repo = "aether-app";
  aether-version = "2.0.0-dev.15";

  /* build error
  aether-owner = "aethereans";
  aether-rev = "53b6c8b2a9253cbf056ea3ebb077e0e08cbc5b1d";
  aether-sha256 = "1kgkzh7ih2q9dsckdkinh5dbzvr7gdykf8yz6h8pyhvzyjhk1v0r";
  */

  # fix inconsistent vendoring
  # fix some go tests, disable many go tests (FIXME)
  aether-owner = "milahu";
  aether-rev = "74d4a3875486306443d799278942174b23bb9aeb";
  aether-sha256 = "0vbyrk72vs4kk7ajpk7sl6j6vfq474xqrjlwkb8jqm00x03ykk2h";

  aether-path = "github.com/${aether-owner}/${aether-repo}";
  aether-url = "https://${aether-path}";

  aether-gomodules = buildGoModule rec {

    pname = "aether-gomodules";
    version = aether-version;

    src = fetchFromGitHub {
      owner = aether-owner;
      repo = aether-repo;
      rev = aether-rev;
      sha256 = aether-sha256;
    } + "/aether-core"; # the go.mod file is in /aether-core

    vendorSha256 = "042q726cnvz8igjkkw22qh7196wfhpy2k3d0xhmdpjqp6rfryy9m";
    runVend = true; # rewrite vendor folder?

    # fix: mkdir /homeless-shelter: permission denied
    preBuild = ''
      export HOME=/tmp
    '';
  };

  # node-default.nix is generated by running node2nix in aether-core/aether/client
  # error: package.json not found -> aether-core/aether/client/package.json
  #nodeDependencies = (callPackage ./node-default.nix { nodejs = nodejs-11_x; }).shell.nodeDependencies;
in

stdenv.mkDerivation rec {
  pname = "aether-server";
  # server = frontend + backend
  # running the frontend (aether-frontend)
  # automatically starts the backend (aether-backend-linux-x64)
  # the "actual" frontend is called aether-client
  version = aether-version;

  src = fetchFromGitHub {
    owner = aether-owner;
    repo = aether-repo;
    rev = aether-rev;
    sha256 = aether-sha256;
  };

  dontWrapGApps = true;

  buildInputs = [
    #electron
    electron_11
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp ${aether-gomodules}/bin/backend $out/bin/aether-backend-linux-x64 # used by aether-frontend
    cp ${aether-gomodules}/bin/frontend $out/bin/aether-frontend
    runHook postInstall
  '';

  meta = with lib; {
    description = "Peer-to-peer ephemeral public communities";
    homepage = "https://getaether.net/";
    downloadPage = "https://getaether.net/download/";
    license = licenses.agpl3Only;
    maintainers = with maintainers; [ ];
    # other platforms could be supported by building from source
    platforms = [ "x86_64-linux" ];
  };
}
