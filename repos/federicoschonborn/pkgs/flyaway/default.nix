{ lib
, stdenv
, fetchFromGitLab
, libdecor
, libinput
, libxkbcommon
, meson
, ninja
, pixman
, pkg-config
, systemd
, wayland
, wayland-protocols
, wlroots
, xorg
}:

stdenv.mkDerivation {
  pname = "flyaway";
  version = "unstable-2023-07-04";

  src = fetchFromGitLab {
    owner = "serebit";
    repo = "flyaway";
    rev = "dc2ce34f54fc0485e39783b6e9c28dd624d61544";
    hash = "sha256-SSMe1RdMoAyOzPTQrH5X0P5JZK7FlRxyysmkHkDoFuM=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    libdecor
    libinput
    libxkbcommon
    pixman
    systemd
    wayland
    wayland-protocols
    wlroots
    xorg.libxcb
    xorg.xcbutilwm
  ];

  meta = {
    description = "A test compositor to gain familiarity with Wayland and wlroots";
    homepage = "https://gitlab.com/serebit/flyaway";
    platforms = lib.platforms.linux;
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ federicoschonborn ];
    broken = lib.versionOlder wlroots.version "0.16";
  };
}
