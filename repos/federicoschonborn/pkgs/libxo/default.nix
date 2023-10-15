{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
, libtool
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libxo";
  version = "1.6.0";

  src = fetchFromGitHub {
    owner = "Juniper";
    repo = "libxo";
    rev = finalAttrs.version;
    hash = "sha256-iTB/zADckrLe6pfNa76CDYf6iozI+WUScd/IQlvFhnE=";
  };

  patches = [
    ./remove-sysctl-include.patch
  ];

  nativeBuildInputs = [
    autoreconfHook
  ];

  makeFlags = [
    "LIBTOOL=${libtool}/bin/libtool"
  ];

  meta = {
    description = "Library for emitting text, XML, JSON, or HTML output";
    homepage = "https://github.com/Juniper/libxo";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ federicoschonborn ];
  };
})
