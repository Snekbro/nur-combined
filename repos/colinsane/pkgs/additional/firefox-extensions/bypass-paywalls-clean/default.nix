{ lib
, fetchFromGitLab
, gitUpdater
, stdenv
, zip
}:

stdenv.mkDerivation rec {
  pname = "bypass-paywalls-clean";
  version = "3.4.7.0";
  src = fetchFromGitLab {
    owner = "magnolia1234";
    repo = "bypass-paywalls-firefox-clean";
    rev = "v${version}";
    hash = "sha256-kMIddSSarlwqBI0y4YVcXaBelSRjQ9EJSrH0kXISyu0=";
  };

  patches = [
    ./0001-dont-show-options.patch
    # ./0002-disable-auto-update.patch
    ./0003-disable-metrics.patch
  ];
  # N.B.: disabling all `fetch` breaks the manual "check for updates" button,
  # but that's not necessary because `nix run '.#update.pkgs.firefox-extensions'` is so trivial.
  # still, re-enable the 'disable-auto-update' patch above for a higher-maintenance solution
  # which avoids breaking manual updates
  postPatch = ''
    substituteAllInPlace background.js \
    --replace 'ext_api.runtime.openOptionsPage()' 'true' \
    --replace ' fetch(' ' false && fetch('
  '';

  nativeBuildInputs = [ zip ];

  installPhase = ''
    zip -r $out ./*
  '';

  passthru = {
    extid = "magnolia@12.34";
    updateScript = gitUpdater {
      rev-prefix = "v";
    };
  };

  meta = {
    homepage = "https://gitlab.com/magnolia1234/bypass-paywalls-firefox-clean";
    description = "Add-on allows you to read articles from (supported) sites that implement a paywall.";
    license = with lib.licenses; [ mit ];
    maintainer = with lib.maintainers; [ colinsane ];
  };
}
