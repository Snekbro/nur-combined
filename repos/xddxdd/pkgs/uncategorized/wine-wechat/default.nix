{
  sources,
  stdenv,
  fetchurl,
  lib,
  p7zip,
  wine64,
  winetricks,
  writeShellScript,
  ...
}:
################################################################################
# Some assets are copied from AUR:
# https://aur.archlinux.org/packages/deepin-wine-wechat
#
# Known issues:
# - In-app browser doesn't work.
################################################################################
let
  wineGecko = stdenv.mkDerivation rec {
    pname = "wine-gecko";
    version = "2.47.4";
    src = fetchurl {
      url = "http://dl.winehq.org/wine/wine-gecko/${version}/wine-gecko-${version}-x86_64.tar.xz";
      sha256 = "0518m084f9bdl836gs3d8qm8jx65j2y1w35zi9x8s1bxadzgr27x";
    };
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out
      tar xf ${src} -C $out
    '';
  };

  wechatWine = wine64.overrideAttrs (old: {
    patches =
      (old.patches or [])
      ++ [
        ./wine-wechat.patch
      ];

    postInstall =
      (old.postInstall or "")
      + ''
        rm -rf $out/share/wine/gecko
        ln -sf ${wineGecko} $out/share/wine/gecko
      '';
  });

  wechatFiles = stdenv.mkDerivation {
    pname = "wechat";
    inherit (sources.wine-wechat-x64) version src;

    nativeBuildInputs = [p7zip];

    unpackPhase = ''
      ls -alh $src
      7z x $src
      rm -rf \$*
    '';

    installPhase = ''
      mkdir $out
      cp -r * $out/
    '';
  };

  startWechat = writeShellScript "wine-wechat" ''
    export WINE="${wechatWine}/bin/wine64"
    export WINEARCH="win64"
    export WINEPREFIX="$HOME/.local/share/wine-wechat"
    export WINEDLLOVERRIDES="winemenubuilder.exe=d"
    export PATH="${wechatWine}/bin:$PATH"
    export LANG="zh_CN.UTF-8"

    winetricks() {
      grep $1 $WINEPREFIX/winetricks.log >/dev/null || ${winetricks}/bin/winetricks $1
    }

    ${wechatWine}/bin/wineboot
    winetricks msls31
    winetricks riched20

    ${wechatWine}/bin/wine64 regedit.exe ${./fonts.reg}
    ${wechatWine}/bin/wine64 ${wechatFiles}/WeChat.exe
    ${wechatWine}/bin/wineserver -k
  '';

  startWinecfg = writeShellScript "wine-wechat-cfg" ''
    export WINE="${wechatWine}/bin/wine64"
    export WINEARCH="win64"
    export WINEPREFIX="$HOME/.local/share/wine-wechat"
    export WINEDLLOVERRIDES="winemenubuilder.exe=d"
    export PATH="${wechatWine}/bin:$PATH"
    export LANG="zh_CN.UTF-8"

    winetricks() {
      grep $1 $WINEPREFIX/winetricks.log >/dev/null || ${winetricks}/bin/winetricks $1
    }

    ${wechatWine}/bin/wineboot
    winetricks msls31
    winetricks riched20

    ${wechatWine}/bin/wine64 regedit.exe ${./fonts.reg}
    ${wechatWine}/bin/wine64 winecfg.exe
    ${wechatWine}/bin/wineserver -k
  '';
in
  stdenv.mkDerivation {
    pname = "wine-wechat";
    inherit (sources.wine-wechat-x64) version;
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out/bin
      cp -r ${startWechat} $out/bin/wine-wechat
      cp -r ${startWinecfg} $out/bin/wine-wechat-cfg
      cp -r ${./share} $out/share
    '';

    meta = with lib; {
      description = "Wine WeChat x64 (Packaging script adapted from https://aur.archlinux.org/packages/deepin-wine-wechat)";
      homepage = "https://weixin.qq.com/";
      platforms = ["x86_64-linux"];
      license = licenses.unfreeRedistributable;
    };
  }
