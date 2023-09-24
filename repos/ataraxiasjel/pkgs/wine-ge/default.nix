{ stdenv
, lib
, fetchurl
, nix-update-script
}:
stdenv.mkDerivation rec {
  pname = "wine-ge-custom";
  version = "GE-Proton8-16";

  src = fetchurl {
    url = "https://github.com/GloriousEggroll/wine-ge-custom/releases/download/${version}/wine-lutris-${version}-x86_64.tar.xz";
    hash = "sha256-eIlK/AWYUGQ9nikClhu3Uk2lxe0kPLPyrx3QafFdq5I=";
  };

  buildCommand = ''
    runHook preBuild

    mkdir -p $out
    tar -C $out --strip=1 -x -f $src

    runHook postBuild
  '';

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "Custom build of wine, made to use with lutris. Built with lutris's buildbot.";
    homepage = "https://github.com/GloriousEggroll/wine-ge-custom";
    license = licenses.unlicense;
    platforms = [ "x86_64-linux" ];
    maintainers = with maintainers; [ ataraxiasjel ];
  };
}
