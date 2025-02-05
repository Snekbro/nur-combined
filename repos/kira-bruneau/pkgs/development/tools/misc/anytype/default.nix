{ lib
, buildNpmPackage
, fetchFromGitHub
, anytype-heart
, copyDesktopItems
, makeWrapper
, pkg-config
, libsecret
, electron
, libGL
, makeDesktopItem
, nix-update-script
}:

let
  l10n-anytype-ts = fetchFromGitHub {
    owner = "anyproto";
    repo = "l10n-anytype-ts";
    rev = "4bf75a0ae186bd40f8ba83e42190869bb9f66a4b";
    hash = "sha256-jjq/xtTtnWWqJtchu1NIAeOXwmwisMC3g9YzyjPH7Wo=";
  };
in
buildNpmPackage rec {
  pname = "anytype";
  version = "0.37.3";

  src = fetchFromGitHub {
    owner = "anyproto";
    repo = "anytype-ts";
    rev = "refs/tags/v${version}";
    hash = "sha256-WBwIOstQyMu3If/nxPd8fkPdZmzhmYi7kMZSVpTkogM=";
  };

  patches = [
    ./fix-resolved.patch
  ];

  npmDepsHash = "sha256-9I/a66qd1aP8XdxAHxgy5/UYQRZvVCn/1cAAyWIGats=";

  # https://github.com/anyproto/anytype-ts/blob/v0.37.3/electron/js/util.js#L214-L224
  enabledLangs = [
    "da-DK" "de-DE" "en-US"
    "es-ES" "fr-FR" "hi-IN"
    "id-ID" "it-IT" "nl-NL"
    "no-NO" "pl-PL" "pt-BR"
    "ro-RO" "ru-RU" "tr-TR"
    "uk-UA" "vi-VN" "zh-CN"
    "zh-TW"
  ];

  # middleware: https://github.com/anyproto/anytype-ts/blob/v0.37.3/update-ci.sh
  # langs: https://github.com/anyproto/anytype-ts/blob/v0.37.3/electron/hook/locale.js
  postUnpack = ''
    if [ $(cat "$sourceRoot/middleware.version") != ${lib.escapeShellArg anytype-heart.version} ]; then
      echo 'ERROR: middleware version mismatch'
      exit 1
    fi

    ln -s ${anytype-heart}/libexec/anytype/grpcserver "$sourceRoot/dist/anytypeHelper"
    ln -s ${anytype-heart}/include/anytype/protobuf/* "$sourceRoot/dist/lib"
    ln -s ${anytype-heart}/share/anytype/json/* "$sourceRoot/dist/lib/json/generated"

    for lang in ''${enabledLangs[@]}; do
      ln -s "${l10n-anytype-ts}/locales/$lang.json" "$sourceRoot/dist/lib/json/lang"
    done
  '';

  env = {
    ELECTRON_SKIP_BINARY_DOWNLOAD = 1;
    ELECTRON_SKIP_SENTRY = 1;
    SENTRYCLI_SKIP_DOWNLOAD = 1;
  };

  nativeBuildInputs = [
    copyDesktopItems
    makeWrapper
    pkg-config
  ];

  buildInputs = [
    libsecret
  ];

  postBuild = ''
    npm exec electron-builder -- \
      --dir \
      -c.electronDist=${electron}/libexec/electron \
      -c.electronVersion=${electron.version}
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/anytype"
    cp -r dist/*-unpacked/{locales,resources{,.pak}} "$out/share/anytype"

    makeWrapper ${electron}/bin/electron "$out/bin/anytype" \
      --add-flags "$out/share/anytype/resources/app.asar" \
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}" \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ libGL ]} \
      --inherit-argv0

    for icon in electron/img/icons/*; do
      filename=$(basename "$icon")
      size="''${filename%.*}"
      extension="''${filename##*.}"
      mkdir -p "$out/share/icons/hicolor/$size/apps"
      cp "$icon" "$out/share/icons/hicolor/$size/apps/anytype.$extension"
    done

    runHook postInstall
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "anytype";
      desktopName = "Anytype";
      comment = meta.description;
      icon = "anytype";
      exec = "anytype";
      categories = [ "Utility" ];
    })
  ];

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "Official Anytype client";
    homepage = "https://anytype.io";
    changelog = "https://community.anytype.io/c/news-announcements/release-notes";
    license = licenses.unfree; # Any Source Available License 1.0
    maintainers = with maintainers; [ kira-bruneau ];
    platforms = platforms.linux;
  };
}
