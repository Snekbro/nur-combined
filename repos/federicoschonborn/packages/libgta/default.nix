{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
, bzip2
, xz
, zlib
, nix-update-script
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libgta";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "marlam";
    repo = "gta-mirror";
    rev = "libgta-${finalAttrs.version}";
    hash = "sha256-6MPQ32RkDBIZg96GWX+IpBpH6ROzXkrccHaMSiy/Bv0=";
  };

  sourceRoot = "source/libgta";

  nativeBuildInputs = [
    autoreconfHook
  ];

  buildInputs = [
    bzip2
    xz
    zlib
  ];

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex" "libgta-(.*)" ]; };

  meta = {
    description = "A library that reads and writes GTA files, with interfaces in C and C++";
    homepage = "https://marlam.de/gta/";
    license = lib.licenses.lgpl21Plus;
    maintainers = with lib.maintainers; [ federicoschonborn ];
  };
})
