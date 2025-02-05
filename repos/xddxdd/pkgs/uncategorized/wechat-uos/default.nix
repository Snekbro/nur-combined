{
  sources,
  stdenv,
  buildFHSUserEnvBubblewrap,
  writeShellScript,
  electron_19,
  lib,
  scrot,
  ...
} @ args:
################################################################################
# Mostly based on wechat-uos package from AUR:
# https://aur.archlinux.org/packages/wechat-uos
################################################################################
let
  license = stdenv.mkDerivation rec {
    pname = "wechat-uos-license";
    version = "0.0.1";
    src = ./license.tar.gz;

    installPhase = ''
      mkdir -p $out
      cp -r etc var $out/
    '';
  };

  resource = stdenv.mkDerivation rec {
    inherit (sources.wechat-uos) pname version src;

    unpackPhase = ''
      ar x ${src}
    '';

    installPhase = ''
      mkdir -p $out
      tar xf data.tar.xz -C $out
      mv $out/usr/* $out/
      mv $out/opt/apps/com.tencent.weixin/files/weixin/resources/app $out/lib/wechat-uos
      chmod 0644 $out/lib/license/libuosdevicea.so
      rm -rf $out/opt $out/usr

      # use system scrot
      pushd $out/lib/wechat-uos/packages/main/dist/
      sed -i 's|__dirname,"bin","scrot"|"${scrot}/bin/"|g' index.js
      popd
    '';
  };

  startScript = writeShellScript "wechat-uos" ''
    wechat_pid=`pidof wechat-uos`
    if test $wechat_pid; then
        kill -9 $wechat_pid
    fi

    ${electron_19}/bin/electron \
      ${resource}/lib/wechat-uos
  '';

  fhs = buildFHSUserEnvBubblewrap {
    name = "wechat-uos";
    targetPkgs = pkgs:
      with pkgs; [
        license
        openssl_1_1
        resource
      ];
    runScript = startScript;
    unsharePid = false;
  };
in
  stdenv.mkDerivation {
    inherit (sources.wechat-uos) pname version;

    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out/bin $out/share/applications
      ln -s ${fhs}/bin/wechat-uos $out/bin/wechat-uos
      ln -s ${./wechat-uos.desktop} $out/share/applications/wechat-uos.desktop
      ln -s ${resource}/share/icons $out/share/icons
    '';

    meta = with lib; {
      description = "WeChat desktop (System Electron) (Packaging script adapted from https://aur.archlinux.org/packages/wechat-uos)";
      homepage = "https://weixin.qq.com/";
      platforms = ["x86_64-linux"];
      license = licenses.unfreeRedistributable;
    };
  }
