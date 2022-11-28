{ lib, stdenv, fetchgit }:

stdenv.mkDerivation (finalAttrs: {
  pname = "scroll";
  version = "0.1";

  src = fetchgit {
    url = "git://git.suckless.org/scroll";
    rev = finalAttrs.version;
    hash = "sha256-dr1s1K13BigfGSFvfBuOOy+yhuAcN1fb/4AEZPj9C48=";
  };

  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Scrollbackbuffer program for st";
    homepage = "https://tools.suckless.org/scroll/";
    license = licenses.isc;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.unix;
  };
})
