{ stdenv
, lib
, fetchFromGitHub
, installShellFiles
, pkg-config
, scdoc
, dbus
, nix-update-script
}:

stdenv.mkDerivation rec {
  pname = "mpris-ctl";
  version = "0.9.96";

  src = fetchFromGitHub {
    owner = "mariusor";
    repo = "mpris-ctl";
    rev = "v${version}";
    hash = "sha256-Z8notYN2cUHHPKn5OleoACZ19U7+1HJNy4/jLA29cfM=";
  };

  nativeBuildInputs = [ pkg-config scdoc installShellFiles ];

  buildInputs = [ dbus ];

  buildPhase = ''
    runHook preBuild

    make VERSION="${version}" release

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    scdoc < mpris-ctl.1.scd > mpris-ctl.1
    installManPage mpris-ctl.1
    install -D mpris-ctl $out/bin/mpris-ctl

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "Basic mpris player control for linux command line";
    homepage = "https://github.com/mariusor/mpris-ctl";
    platforms = platforms.linux;
    license = licenses.mit;
    maintainers = with maintainers; [ ataraxiasjel ];
  };
}
