{ unstable, config, wireless-regdb_ }:

self: super: with super.lib;
rec {
  dtrx = super.dtrx.override {
    unzipSupport = true;
    unrarSupport = true;
  };
  lmms = super.lmms.overrideAttrs (oldAttrs: optionalAttrs (config.jack or false) {
    cmakeFlags = oldAttrs.cmakeFlags ++ [ "-DWANT_WEAKJACK=OFF" ];
  });
  qutebrowser = super.qutebrowser.overrideAttrs (oldAttrs: {
    postFixup = ''
      ${oldAttrs.postFixup}
      wrapProgram $out/bin/qutebrowser \
        --prefix PATH : "${super.lib.makeBinPath [ super.mpv ]}"
    '';
  });
  wireless-regdb = if config.hardware.wifi.enable then wireless-regdb_ else super.wireless-regdb;
  crda = if config.hardware.wifi.enable then (super.crda.override {
    inherit wireless-regdb;
  }).overrideAttrs (oldAttrs: rec {
    makeFlags = oldAttrs.makeFlags ++ [
      "PUBKEY_DIR=${wireless-regdb}/lib/crda/pubkeys"
    ];
  }) else super.crda;
}
