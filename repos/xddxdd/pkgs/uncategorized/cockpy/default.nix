{
  lib,
  sources,
  python3,
  python3Packages,
  makeWrapper,
  ...
} @ args:
with python3Packages; let
  pyenet = buildPythonPackage {
    inherit (sources.cockpy-pyenet) pname version src;

    propagatedBuildInputs = [
      cython
    ];

    doCheck = false;
  };

  pythonEnv = python3.withPackages (ps:
    with ps; [
      betterproto
      bottle
      colorama
      cython
      loguru
      pyenet
      setuptools
    ]);
in
  stdenv.mkDerivation {
    inherit (sources.cockpy) pname version src;

    nativeBuildInputs = [makeWrapper];

    patches = [
      ./remove-logfile.patch
    ];

    installPhase = ''
      mkdir -p $out/bin $out/opt

      cp -r * $out/opt/

      makeWrapper ${pythonEnv}/bin/python $out/bin/cockpy \
        --prefix PYTHONPATH : "$out/opt" \
        --add-flags "-m" \
        --add-flags "cockpy"
    '';

    meta = with lib; {
      description = "public and open source version of the cbt2 ps im working on ";
      homepage = "https://github.com/Hiro420/CockPY";
      license = with licenses; [unfreeRedistributable];
    };
  }
