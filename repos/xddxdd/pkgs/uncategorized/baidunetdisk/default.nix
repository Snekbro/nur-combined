{
  sources,
  stdenv,
  makeWrapper,
  lib,
  electron_11,
  # BaiduNetdisk dependencies
  libappindicator,
  libdbusmenu,
  libglvnd,
  ...
} @ args:
################################################################################
# Mostly based on baidnetdisk-electron package from AUR:
# https://aur.archlinux.org/packages/baidunetdisk-electron
################################################################################
let
  libraries = [
    stdenv.cc.cc.lib
    libappindicator
    libdbusmenu
    libglvnd
  ];

  dist = stdenv.mkDerivation rec {
    inherit (sources.baidunetdisk) pname version src;

    dontFixup = true;

    unpackPhase = ''
      ar x ${src}
      tar xf data.tar.xz
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp -r opt/baidunetdisk/* $out

      pushd $out
      rm -rf \
        baidunetdisk \
        baidunetdisk.desktop \
        baiduNetdiskContext.conf \
        baidunetdiskv.desktop \
        bin \
        binswiftshader \
        chrome_100_percent.pak \
        chrome_200_percent.pak \
        chrome-sandbox \
        icudtl.dat \
        libEGL.so \
        libffmpeg.so \
        libGLESv2.so \
        libvk_swiftshader.so \
        libvulkan.so \
        LICENSE.* \
        locales \
        resources.pak \
        resources/8bb88996964c4e3202fecaaa5605af03 \
        resources/default.db \
        resources/dir.icns \
        resources/resource.db \
        snapshot_blob.bin \
        v8_context_snapshot.bin \
        vk_swiftshader_icd.json
      popd
    '';
  };
in
  stdenv.mkDerivation {
    pname = "baidunetdisk";
    version = "4.17.7";
    phases = ["installPhase"];

    nativeBuildInputs = [makeWrapper];
    installPhase = ''
      mkdir -p $out/bin
      makeWrapper ${electron_11}/bin/electron $out/bin/baidunetdisk \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath libraries}:${dist}" \
        --add-flags "${dist}/resources/app.asar"

      mkdir -p $out/share/applications
      ln -s ${./baidunetdisk.desktop} $out/share/applications/baidunetdisk.desktop

      mkdir -p $out/share/icons/hicolor/scalable/apps
      ln -s ${dist}/baidunetdisk.svg $out/share/icons/hicolor/scalable/apps/baidunetdisk.svg
    '';

    meta = with lib; {
      description = "Baidu Netdisk";
      homepage = "https://pan.baidu.com/";
      platforms = ["x86_64-linux"];
      license = licenses.unfreeRedistributable;
    };
  }
