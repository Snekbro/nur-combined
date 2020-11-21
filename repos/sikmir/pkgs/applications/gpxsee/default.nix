{ stdenv
, mkDerivation
, lib
, qmake
, qtbase
, qttools
, qttranslations
, sources
, substituteAll
, withI18n ? true
}:

mkDerivation rec {
  pname = "gpxsee-unstable";
  version = lib.substring 0 10 sources.gpxsee.date;

  src = sources.gpxsee;

  patches = (substituteAll {
    # See https://github.com/NixOS/nixpkgs/issues/86054
    src = ./fix-qttranslations-path.patch;
    inherit qttranslations;
  });

  postPatch = ''
    sed -i "s/\(VERSION = \).*/\1${version}/" gpxsee.pro
  '';

  nativeBuildInputs = [ qmake ] ++ (lib.optional withI18n qttools);
  buildInputs = [ qtbase ];

  preConfigure = lib.optionalString withI18n ''
    lrelease gpxsee.pro
  '';

  postInstall = lib.optionalString stdenv.isDarwin ''
    mkdir -p $out/Applications
    mv GPXSee.app $out/Applications
    wrapQtApp $out/Applications/GPXSee.app/Contents/MacOS/GPXSee
    mkdir -p $out/bin
    ln -s $out/Applications/GPXSee.app/Contents/MacOS/GPXSee $out/bin/gpxsee
  '';

  meta = with lib; {
    inherit (sources.gpxsee) description homepage changelog;
    license = licenses.gpl3Only;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.unix;
  };
}
