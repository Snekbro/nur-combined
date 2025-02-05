{ autoPatchelfHook, buildFHSEnvChroot ? false, buildFHSUserEnv ? false, dpkg
, fetchurl, lib, stdenv, sysctl, iptables, iproute2, procps, cacert, libxml2
, libidn2, zlib, wireguard-tools }:

let
  pname = "nordvpn";
  version = "3.16.2";
  LuisChDev = {
    name = "Luis Chavarriaga";
    email = "luischa123@gmail.com";
    github = "LuisChDev";
    githubId = 24978009;
  };
  buildEnv = if builtins.typeOf buildFHSEnvChroot == "set" then
    buildFHSEnvChroot
  else
    buildFHSUserEnv;

  nordVPNBase = stdenv.mkDerivation {
    inherit pname version;

    src = fetchurl {
      url =
        "https://repo.nord-help.com/deb/nordvpn/debian/pool/main/nordvpn_${version}_amd64.deb";
      hash = "sha256-6aAslJ2xwj+khF6HOMtkF0iclrUzhBV64xrHgs5Nc2s=";
    };

    buildInputs = [ libxml2 libidn2 ];
    nativeBuildInputs = [ dpkg autoPatchelfHook stdenv.cc.cc.lib ];

    dontConfigure = true;
    dontBuild = true;

    unpackPhase = ''
      runHook preUnpack
      dpkg --extract $src .
      runHook postUnpack
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      mv usr/* $out/
      mv var/ $out/
      mv etc/ $out/
      runHook postInstall
    '';
  };

  nordVPNfhs = buildEnv {
    name = "nordvpnd";
    runScript = "nordvpnd";

    # hardcoded path to /sbin/ip
    targetPkgs = pkgs:
      with pkgs; [
        nordVPNBase
        sysctl
        iptables
        iproute2
        procps
        cacert
        libxml2
        libidn2
        zlib
        wireguard-tools
      ];
  };

in stdenv.mkDerivation {
  inherit pname version;

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin $out/share
    ln -s ${nordVPNBase}/bin/nordvpn $out/bin
    ln -s ${nordVPNfhs}/bin/nordvpnd $out/bin
    ln -s ${nordVPNBase}/share* $out/share
    ln -s ${nordVPNBase}/var $out/
    runHook postInstall
  '';

  meta = with lib; {
    description = "CLI client for NordVPN";
    homepage = "https://www.nord-help.com";
    license = licenses.unfree;
    maintainers = with maintainers; [ LuisChDev ];
    platforms = [ "x86_64-linux" ];
  };
}
