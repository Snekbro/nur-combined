# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  cabal-docspec = {
    pname = "cabal-docspec";
    version = "0.0.0.20230517";
    src = fetchurl {
      url = "https://github.com/phadej/cabal-extras/releases/download/cabal-docspec-0.0.0.20230517/cabal-docspec-0.0.0.20230517-x86_64-linux.xz";
      sha256 = "sha256-OzG75GOtTWcau8ED20lihWLsSKZgTKsngge1tqzSHtc=";
    };
  };
  cabal-docspec-man = {
    pname = "cabal-docspec-man";
    version = "0.0.0.20230517";
    src = fetchurl {
      url = "https://raw.githubusercontent.com/phadej/cabal-extras/cabal-docspec-0.0.0.20230517/cabal-docspec/cabal-docspec.1";
      sha256 = "sha256-tyVrIqUx6XrCAqXGLeOfsbdny5ue8tY30vyGrArdl7w=";
    };
  };
  cabal-plan = {
    pname = "cabal-plan";
    version = "0.7.3.0";
    src = fetchurl {
      url = "https://github.com/haskell-hvr/cabal-plan/releases/download/v0.7.3.0/cabal-plan-0.7.3.0-x86_64-linux.xz";
      sha256 = "sha256-9izLKXFWel9jjyAFrTFz26FGk6RRVMFQhkXFIolxTLI=";
    };
  };
  fourmolu = {
    pname = "fourmolu";
    version = "0.14.0.0";
    src = fetchurl {
      url = "https://github.com/fourmolu/fourmolu/releases/download/v0.14.0.0/fourmolu-0.14.0.0-linux-x86_64";
      sha256 = "sha256-/iBsu+8yNJmO6nibXmG5lsLNI81dla8xKSS/uttsq0U=";
    };
  };
  hellsmack = {
    pname = "hellsmack";
    version = "0.1.2.6";
    src = fetchurl {
      url = "https://github.com/amesgen/hellsmack/releases/download/v0.1.2.6/hellsmack-Linux.zip";
      sha256 = "sha256-Bykic44/DRWKqzdgTyMGYI5luQzr3zt9UlYxGIstRj8=";
    };
  };
  hlint = {
    pname = "hlint";
    version = "3.6.1";
    src = fetchurl {
      url = "https://github.com/ndmitchell/hlint/releases/download/v3.6.1/hlint-3.6.1-x86_64-linux.tar.gz";
      sha256 = "sha256-yjiYhjsMIH7i8Kc86zbqwa8E20FR/JcH6O76mII0p6c=";
    };
  };
  ormolu = {
    pname = "ormolu";
    version = "0.7.2.0";
    src = fetchurl {
      url = "https://github.com/tweag/ormolu/releases/download/0.7.2.0/ormolu-Linux.zip";
      sha256 = "sha256-r4i4wE96OmiJmgeq/a0q/1Z6DHFDtNWL8EM6oP5tVZc=";
    };
  };
}
