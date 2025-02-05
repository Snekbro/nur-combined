# Lan Tian's NUR Packages

![Build and populate cache](https://github.com/xddxdd/nur-packages/workflows/Build%20and%20populate%20cache/badge.svg)

[![Cachix Cache](https://img.shields.io/badge/cachix-xddxdd-blue.svg)](https://xddxdd.cachix.org)

[![built with garnix](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2Fxddxdd%2Fnur-packages)](https://garnix.io)

## Warning

This NUR contains packages customized for my own use. These packages reside in `lantianCustomized`, `lantianLinuxXanmod` and `lantianPersonal` categories. I do not ensure that they stay backwards compatible or functionally stable, nor do I accept any requests to tailor them for public use.

Packages in all other categories are for public use. I will try my best to minimize changes/customizations on them, and accept issues and pull requests for them.

## How to use

```nix
# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nur-xddxdd = {
      url = "github:xddxdd/nur-packages";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Add packages from this repo
        inputs.nur-xddxdd.nixosModules.setupOverlay

        # Setup QEMU userspace emulation that works with Docker
        inputs.nur-xddxdd.nixosModules.qemu-user-static-binfmt

        # Binary cache (optional)
        ({ ... }: {
          nix.settings.substituters = [ "https://xddxdd.cachix.org" ];
          nix.settings.trusted-public-keys = [ "xddxdd.cachix.org-1:ay1HJyNDYmlSwj5NXQG065C8LfoqqKaTNCyzeixGjf8=" ];
        })
      ];
    };
  };
}
```

## Binary Cache

This NUR has a binary cache. Use the following settings to access it:

```nix
{
  nix.settings.substituters = [ "https://xddxdd.cachix.org" ];
  nix.settings.trusted-public-keys = [ "xddxdd.cachix.org-1:ay1HJyNDYmlSwj5NXQG065C8LfoqqKaTNCyzeixGjf8=" ];
}
```

Or, use variables from this repository in case I change them:

```nix
{
  nix.settings.substituters = [ nur.repos.xddxdd._meta.url ];
  nix.settings.trusted-public-keys = [ nur.repos.xddxdd._meta.publicKey ];
}
```

## Packages

<details>
<summary>Package set: (Uncategorized) (92 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `amule-dlp` | [amule-dlp](https://github.com/amule-project/amule) | 7b3a07ab554d95267cca0c4a819b26d8474d6b3b | Peer-to-peer client for the eD2K and Kademlia networks |
|  | `asterisk-g72x` | [asterisk-g72x](https://github.com/arkadijs/asterisk-g72x) | 3855cec2ef2667f3e9224006dbaf179575752218 | G.729 and G.723.1 codecs for Asterisk (Only G.729 is enabled) |
|  | `baidunetdisk` | [baidunetdisk](https://pan.baidu.com/) | 4.17.7 | Baidu Netdisk |
|  | `baidupcs-go` | [baidupcs-go](https://github.com/qjfoidnh/BaiduPCS-Go) | v3.9.5 | iikira/BaiduPCS-Go 原版基础上集成了分享链接/秒传链接转存功能 |
|  | `bepasty` | [bepasty](https://bepasty-server.readthedocs.org/) | 1.2.0 | universal pastebin server |
|  | `bilibili` | [bilibili](https://app.bilibili.com/) | 1.13.0-2 | Bilibili desktop client |
|  | `bird-lg-go` | [bird-lg-go](https://github.com/xddxdd/bird-lg-go) | v1.3.5 | BIRD looking glass in Go, for better maintainability, easier deployment & smaller memory footprint |
|  | `bird-lgproxy-go` | [bird-lgproxy-go](https://github.com/xddxdd/bird-lg-go) | v1.3.5 | BIRD looking glass in Go, for better maintainability, easier deployment & smaller memory footprint |
|  | `boringssl-oqs` | [boringssl-oqs](https://openquantumsafe.org) | 8d99c122d2e5e3152de31a37ccda260b78f55d5c | Fork of BoringSSL that includes prototype quantum-resistant key exchange and authentication in the TLS handshake based on liboqs |
|  | `calibre-cops` | [calibre-cops](http://blog.slucas.fr/en/oss/calibre-opds-php-server) | 1.1.3 | Calibre OPDS (and HTML) PHP Server : web-based light alternative to Calibre content server / Calibre2OPDS to serve ebooks (epub, mobi, pdf, ...) |
|  | `chmlib-utils` | [chmlib](http://www.jedrea.com/chmlib) | 0.40a | A library for dealing with Microsoft ITSS/CHM format files |
|  | `chromium-oqs-bin` | [chromium-oqs-bin](https://github.com/open-quantum-safe/oqs-demos) | 0.7.2 | Chromium with Open Quantum Safe patches |
|  | `cloudpan189-go` | [cloudpan189-go](https://github.com/tickstep/cloudpan189-go) | v0.1.3 | 天翼云盘命令行客户端(CLI)，基于GO语言实现 |
|  | `cockpy` | [cockpy](https://github.com/Hiro420/CockPY) | 00fa2f220fd5e22c14a88b5f6000487b49b071f1 | public and open source version of the cbt2 ps im working on  |
|  | `deepspeech-gpu` | [deepspeech-gpu](https://github.com/mozilla/DeepSpeech) | 0.9.3 | Speech-to-text engine which can run in real time on devices ranging from a Raspberry Pi 4 to high power GPU servers. |
|  | `deepspeech-wrappers` | [deepspeech](https://github.com/mozilla/DeepSpeech) | 0.9.3 | Speech-to-text engine which can run in real time on devices ranging from a Raspberry Pi 4 to high power GPU servers. |
|  | `dingtalk` | [dingtalk](https://www.dingtalk.com/) | 7.0.50.30831 | 钉钉 |
|  | `dn42-pingfinder` | [dn42-pingfinder](https://git.dn42.dev/dn42/pingfinder/src/branch/master/clients) | 1.0.0 | DN42 Pingfinder |
|  | `douban-openapi-server` | [douban-openapi-server](https://github.com/caryyu/douban-openapi-server) | c7e2a0f59ba5cfb2d10a31013547686a4afab99d | A Douban API server that provides an unofficial APIs for media information gathering |
|  | `drone-file-secret` | [drone-file-secret](https://github.com/xddxdd/drone-file-secret) | b69ba503becb41c72a1b724f38a26e7f2c34b110 | A secret provider for Drone CI. It simply reads secrets from a given folder, suitable for private use Drone CI instances where running a Vault instance can be undesirable. |
|  | `drone-vault` | [drone-vault](https://docs.drone.io/configure/secrets/external/vault/) | v1.3.0 | Drone plugin for integrating with the Vault secrets manager |
|  | `etherguard` | [etherguard](https://github.com/KusakabeShi/EtherGuard-VPN) | a96db9e8cf68da687c5e26696df9778162d42ad2 | Layer2 version of wireguard with Floyd Warshall implement in go |
|  | `fastapi-dls` | [fastapi-dls](https://gitea.publichub.eu/oscar.krause/fastapi-dls) | 65de4d0534f0da3528588843347a82649d2df8d1 | Minimal Delegated License Service (DLS) |
|  | `fcitx5-breeze` | [fcitx5-breeze](https://github.com/scratch-er/fcitx5-breeze) | 2.0.0 | Fcitx5 theme to match KDE's Breeze style |
|  | `flaresolverr` | [flaresolverr](https://github.com/FlareSolverr/FlareSolverr) | v3.3.12 | Proxy server to bypass Cloudflare protection |
|  | `flasgger` | [flasgger](http://flasgger.pythonanywhere.com/) | 0.9.5 | Easy OpenAPI specs and Swagger UI for your Flask API |
|  | `ftp-proxy` | [ftp-proxy](http://www.ftpproxy.org/) | 1.2.3 | ftp.proxy - FTP Proxy Server |
|  | `genshin-checkin-helper` | [genshin-checkin-helper](https://gitlab.com/y1ndan/genshin-checkin-helper) | b9e36543bfe5b042e015463e5d0398cd234cba90 | More than check-in for Genshin Impact. |
|  | `genshinhelper2` | [genshinhelper2](https://gitlab.com/y1ndan/genshinhelper2) | 1382b89d0ee1f5dfcbe1425398fb4cfc260ddcdd | A Python library for miHoYo bbs and HoYoLAB Community. |
|  | `glauth` | [glauth](https://github.com/glauth/glauth) | v2.3.0 | A lightweight LDAP server for development, home use, or CI |
|  | `google-earth-pro` | [google-earth-pro](https://www.google.com/earth/) | 7.3.6.9345 | A world sphere viewer |
|  | `gopherus` | [gopherus](http://gopherus.sourceforge.net/) | 1.2.1 | Gopherus is a free, multiplatform, console-mode gopher client that provides a classic text interface to the gopherspace. |
|  | `grasscutter` | [grasscutter](https://github.com/Grasscutters/Grasscutter) | 1.7.4 | A server software reimplementation for a certain anime game. |
|  | `hanyi-wenhei` | [hanyi-wenhei](https://github.com/SpeedyOrc-C/Hoyo-Glyphs) | 1.0 | 汉仪文黑字体 |
|  | `hath` | [hath](https://e-hentai.org/) | 1.6.1 | Hentai@Home |
|  | `hesuvi-hrir` | [hesuvi-hrir](https://sourceforge.net/projects/hesuvi/) | 2.0.0.1 | Headphone Surround Virtualizations for Equalizer APO |
|  | `hoyo-glyphs` | [hoyo-glyphs](https://github.com/SpeedyOrc-C/Hoyo-Glyphs) | 9914343c51384e45496522074c6cc6b15394543c | Constructed scripts by Hoyoverse 米哈游的架空文字  |
|  | `kaixinsong-fonts` | [kaixinsong-fonts](http://www.guoxuedashi.net/zidian/bujian/KaiXinSong.php) | 3.0 | KaiXinSong |
|  | `kata-image` | [kata-image](https://github.com/kata-containers/kata-containers) | 3.2.0 | Kata Containers is an open source project and community working to build a standard implementation of lightweight Virtual Machines (VMs) that feel and perform like containers, but provide the workload isolation and security advantages of VMs. (Packaging script adapted from https://github.com/TUM-DSE/doctor-cluster-config/blob/0c40be8dd86282122f8f04df738c409ef5e3da1c/pkgs/kata-images/default.nix) |
|  | `kata-runtime` | [kata-runtime](https://github.com/kata-containers/kata-containers) | 3.2.0 | Kata Containers is an open source project and community working to build a standard implementation of lightweight Virtual Machines (VMs) that feel and perform like containers, but provide the workload isolation and security advantages of VMs. (Packaging script adapted from https://github.com/TUM-DSE/doctor-cluster-config/blob/0c40be8dd86282122f8f04df738c409ef5e3da1c/pkgs/kata-runtime/default.nix) |
|  | `konnect` | [konnect](https://github.com/Kopano-dev/konnect) | v0.34.0 | Kopano Konnect implements an OpenID provider (OP) with integrated web login and consent forms. |
|  | `ldap-auth-proxy` | [ldap-auth-proxy](https://github.com/pinepain/ldap-auth-proxy) | 66a8236af574f554478fe376051b95f61235efc9 | A simple drop-in HTTP proxy for transparent LDAP authentication which is also a HTTP auth backend. |
|  | `libnftnl-fullcone` | [libnftnl](https://netfilter.org/projects/libnftnl/) | 1.2.6 | A userspace library providing a low-level netlink API to the in-kernel nf_tables subsystem |
|  | `liboqs` | [liboqs](https://openquantumsafe.org) | b19697422f433b85c8e46573078226a0956d37ae | C library for prototyping and experimenting with quantum-resistant cryptography |
|  | `libqcef` | [libqcef](https://github.com/martyr-deepin/libqcef) | ff3448cb3f86f42946d4c9eb01ccaa994f174fe0 | Qt5 binding of CEF |
|  | `netboot-xyz` | [netboot-xyz](https://netboot.xyz/) | 2.0.76 | Your favorite operating systems in one place. A network-based bootable operating system installer based on iPXE. |
|  | `netease-cloud-music` | [netease-cloud-music](https://music.163.com) | 1.2.1 | NetEase Cloud Music Linux Client (package script adapted from NixOS-CN and Freed-Wu) |
|  | `netns-exec` | [netns-exec](https://github.com/pekman/netns-exec) | aa346fd058d47b238ae1b86250f414bcab2e7927 | Run command in Linux network namespace as normal user |
|  | `nftables-fullcone` | [nftables](https://netfilter.org/projects/nftables/) | 1.0.9 | The project that aims to replace the existing {ip,ip6,arp,eb}tables framework |
|  | `noise-suppression-for-voice` | [noise-suppression-for-voice](https://github.com/werman/noise-suppression-for-voice) | v1.03 | Noise suppression plugin based on Xiph's RNNoise |
|  | `nullfs` | [nullfs](https://github.com/xrgtn/nullfs) | 0884f87ec01faaee219f59742c14ed3c3945f5c0 | FUSE nullfs drivers |
|  | `nvlax` | [nvlax](https://github.com/illnyang/nvlax) | b3699ad40c4dfbb9d46c53325d63ae8bf4a94d7f | Future-proof NvENC & NvFBC patcher |
|  | `nvlax-530` | [nvlax](https://github.com/illnyang/nvlax) | b3699ad40c4dfbb9d46c53325d63ae8bf4a94d7f | Future-proof NvENC & NvFBC patcher (for NVIDIA driver >= 530) |
|  | `oci-arm-host-capacity` | [oci-arm-host-capacity](https://github.com/hitrov/oci-arm-host-capacity) | 369de7b2851f1b22db34f95ba02001d5c9f839c7 | This script allows to bypass Oracle Cloud Infrastructure 'Out of host capacity' error immediately when additional OCI capacity will appear in your Home Region / Availability domain. |
|  | `onepush` | [onepush](https://gitlab.com/y1ndan/onepush) | 8b09e62330ad74ba3221bfc2b080d1732a1dcc55 | A Python library to send notifications to your iPhone, Discord, Telegram, WeChat, QQ and DingTalk. |
|  | `openssl-oqs` | [openssl-oqs](https://www.openssl.org/) | 1.1.1 | A cryptographic library that implements the SSL and TLS protocols |
|  | `openssl-oqs-provider` | [openssl-oqs-provider](https://openquantumsafe.org) | 8f6937c85b10a2057261daf7a3a91832bff9712a | OpenSSL 3 provider containing post-quantum algorithms |
|  | `osdlyrics` | [osdlyrics](https://github.com/osdlyrics/osdlyrics) | 0.5.15 | Standalone lyrics fetcher/displayer (windowed and OSD mode). |
|  | `payload-dumper-go` | [payload-dumper-go](https://github.com/ssut/payload-dumper-go) | 1.2.2 | An android OTA payload dumper written in Go |
|  | `phpmyadmin` | [phpmyadmin](https://www.phpmyadmin.net/) | 5.2.1 | A web interface for MySQL and MariaDB |
|  | `phppgadmin` | [phppgadmin](https://github.com/phppgadmin/phppgadmin) | v7.14.7-mod | The premier web-based administration tool for PostgreSQL |
|  | `pterodactyl-wings` | [pterodactyl-wings](https://pterodactyl.io) | v1.11.8 | The server control plane for Pterodactyl Panel. |
|  | `qbittorrent-enhanced-edition` | [qbittorrent-enhanced-edition](https://www.qbittorrent.org) | release-4.6.2.10 | Featureful free software BitTorrent client |
|  | `qbittorrent-enhanced-edition-nox` | [qbittorrent-enhanced-edition](https://www.qbittorrent.org) | release-4.6.2.10 | Featureful free software BitTorrent client |
|  | `qemu-user-static` | [qemu-user-static](http://www.qemu.org/) | 8.2.0+ds-3 | A generic and open source machine emulator and virtualizer |
|  | `qq` | [qq](https://im.qq.com/linuxqq/index.html) | 3.2.3-20201 | QQ for Linux |
|  | `qqmusic` | [qqmusic](https://y.qq.com/) | 1.1.5 | Tencent QQ Music (Packaging script adapted from https://aur.archlinux.org/packages/qqmusic-bin) |
|  | `rime-aurora-pinyin` | [rime-aurora-pinyin](https://github.com/hosxy/rime-aurora-pinyin) | 122b46976401995cbafcfc748806985ff3a437a4 | 【极光拼音】输入方案 |
|  | `rime-dict` | [rime-dict](https://github.com/Iorest/rime-dict) | 325ecbda51cd93e07e2fe02e37e5f14d94a4a541 | RIME 词库增强 |
|  | `rime-ice` | [rime-ice](https://dvel.me/posts/rime-ice/) | 2a3a2f807623e468d1ae449f5a5dffa699e62815 | Rime 配置：雾凇拼音 | 长期维护的简体词库  |
|  | `rime-moegirl` | [rime-moegirl](https://github.com/outloudvi/mw2fcitx/releases) | 20231114 | Releases for dict of zh.moegirl.org.cn |
|  | `rime-zhwiki` | [rime-zhwiki](https://github.com/felixonmars/fcitx5-pinyin-zhwiki) | 20231205 | Fcitx 5 Pinyin Dictionary from zh.wikipedia.org |
|  | `route-chain` | [route-chain](https://github.com/xddxdd/route-chain) | 8922b56c70f92f29a9bbd72a4e8a13fd8b8c4197 | A small app to generate a long path in traceroute. |
|  | `sam-toki-mouse-cursors` | [sam-toki-mouse-cursors](https://github.com/SamToki/IconDesign---Sam-Toki-Mouse-Cursors) | v6.04 | Original mouse cursors (pointers) for Windows, with minimalistic design. |
|  | `sgx-software-enable` | [sgx-software-enable](https://github.com/intel/sgx-software-enable) | 7977d6dd373f3a14a615ee9be6f24ecd37c0b43d | This application will enable Intel SGX on Linux systems where the BIOS supports Intel SGX, but does not provide an explicit option to enable it. These systems can only enable Intel SGX via the "software enable" procedure. |
|  | `smartrent_py` | [smartrent_py](https://github.com/ZacheryThomas/smartrent.py) | 0.4.0 | Api for SmartRent locks, thermostats, moisture sensors and switches |
|  | `soggy` | [soggy](https://github.com/LDAsuku/soggy) | 2736cb094a51d186dabf2204a7599e9b8118f8dd | Experimental server emulator for a game I forgot its name |
|  | `space-cadet-pinball-full-tilt` | [SpaceCadetPinball](https://github.com/k4zmu2a/SpaceCadetPinball) | 2.0.1 | Reverse engineering of 3D Pinball for Windows – Space Cadet, a game bundled with Windows (With Full Tilt Pinball data) |
|  | `svp` | [svp](https://www.svp-team.com/wiki/SVP:Linux) | 4.5.210-2 | SmoothVideo Project 4 (SVP4) (MUST USE `packages.svp.mpv` IF YOU WANT TO LAUNCH MPV EXTERNALLY) (Packaging script adapted from https://aur.archlinux.org/packages/svp) |
|  | `svp-mpv` | [mpv-with-scripts-0.36.0](https://mpv.io) |  | General-purpose media player, fork of MPlayer and mplayer2 |
|  | `tachidesk-server` | [tachidesk-server](https://github.com/Suwayomi/Tachidesk-Server) | 0.6.2-r1074 | A rewrite of Tachiyomi for the Desktop |
|  | `undetected-chromedriver` | [undetected-chromedriver](https://github.com/ultrafunkamsterdam/undetected-chromedriver) | 783b8393157b578e19e85b04d300fe06efeef653 | Custom Selenium Chromedriver | Zero-Config | Passes ALL bot mitigation systems (like Distil / Imperva/ Datadadome / CloudFlare IUAM) |
|  | `undetected-chromedriver-bin` | [undetected-chromedriver-bin](https://chromedriver.chromium.org/) | 120.0.6099.109 | Chromedriver with undetected-chromedriver patch |
|  | `vivado-2022_2` | [vivado](https://www.xilinx.com/products/design-tools/vivado.html) | 2022.2 | Xilinx Vivado WebPack Edition (Packaging script adapted from https://github.com/lschuermann/nur-packages/blob/master/pkgs/vivado/vivado-2022_2.nix) |
| `Broken` | `vs-rife` | [vs-rife](https://github.com/HolyWu/vs-rife) | v4.2.0 | Real-Time Intermediate Flow Estimation for Video Frame Interpolation for VapourSynth |
|  | `wechat-uos` | [wechat-uos](https://weixin.qq.com/) | 2.1.5 | WeChat desktop (System Electron) (Packaging script adapted from https://aur.archlinux.org/packages/wechat-uos) |
|  | `wechat-uos-bin` | [wechat-uos-bin](https://weixin.qq.com/) | 2.1.5 | WeChat desktop (Official binary) (Packaging script adapted from https://aur.archlinux.org/packages/wechat-uos) |
|  | `win2xcur` | [win2xcur](https://github.com/quantum5/win2xcur) | v0.1.2 | win2xcur is a tool that converts cursors from Windows format (*.cur, *.ani) to Xcursor format. It also contains x2wincur which does the opposite. |
|  | `wine-wechat` | [wine-wechat](https://weixin.qq.com/) | 3.9.8.25 | Wine WeChat x64 (Packaging script adapted from https://aur.archlinux.org/packages/deepin-wine-wechat) |
|  | `wine-wechat-x86` | [wine-wechat-x86](https://weixin.qq.com/) | 3.9.8.24 | Wine WeChat x86 (Packaging script adapted from https://aur.archlinux.org/packages/deepin-wine-wechat) |
|  | `xstatic-asciinema-player` | [xstatic-asciinema-player](https://github.com/asciinema/asciinema-player) | 2.6.1.1 | asciinema-player packaged for setuptools (easy_install) / pip. |
|  | `xstatic-font-awesome` | [xstatic-font-awesome](https://github.com/FortAwesome/Font-Awesome) | 4.7.0.0 | Font Awesome packaged for setuptools (easy_install) / pip. |
</details>


<details>
<summary>Package set: asteriskDigiumCodecs (36 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `asteriskDigiumCodecs.11.silk` | [asterisk-11-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 11 silk Codec by Digium |
|  | `asteriskDigiumCodecs.11.siren14` | [asterisk-11-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 11 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.11.siren7` | [asterisk-11-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 11 siren7 Codec by Digium |
|  | `asteriskDigiumCodecs.12.silk` | [asterisk-12-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 12 silk Codec by Digium |
|  | `asteriskDigiumCodecs.13.opus` | [asterisk-13-codec-opus](https://downloads.digium.com/pub/telephony/codec_opus/) | 1.3.0 | Asterisk 13 opus Codec by Digium |
|  | `asteriskDigiumCodecs.13.silk` | [asterisk-13-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 13 silk Codec by Digium |
|  | `asteriskDigiumCodecs.13.siren14` | [asterisk-13-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 13 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.13.siren7` | [asterisk-13-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 13 siren7 Codec by Digium |
|  | `asteriskDigiumCodecs.14.opus` | [asterisk-14-codec-opus](https://downloads.digium.com/pub/telephony/codec_opus/) | 1.3.0 | Asterisk 14 opus Codec by Digium |
|  | `asteriskDigiumCodecs.14.silk` | [asterisk-14-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 14 silk Codec by Digium |
|  | `asteriskDigiumCodecs.14.siren14` | [asterisk-14-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 14 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.14.siren7` | [asterisk-14-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 14 siren7 Codec by Digium |
|  | `asteriskDigiumCodecs.15.opus` | [asterisk-15-codec-opus](https://downloads.digium.com/pub/telephony/codec_opus/) | 1.3.0 | Asterisk 15 opus Codec by Digium |
|  | `asteriskDigiumCodecs.15.silk` | [asterisk-15-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 15 silk Codec by Digium |
|  | `asteriskDigiumCodecs.15.siren14` | [asterisk-15-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 15 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.15.siren7` | [asterisk-15-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 15 siren7 Codec by Digium |
|  | `asteriskDigiumCodecs.16.opus` | [asterisk-16-codec-opus](https://downloads.digium.com/pub/telephony/codec_opus/) | 1.3.0 | Asterisk 16 opus Codec by Digium |
|  | `asteriskDigiumCodecs.16.silk` | [asterisk-16-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 16 silk Codec by Digium |
|  | `asteriskDigiumCodecs.16.siren14` | [asterisk-16-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 16 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.16.siren7` | [asterisk-16-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 16 siren7 Codec by Digium |
|  | `asteriskDigiumCodecs.17.opus` | [asterisk-17-codec-opus](https://downloads.digium.com/pub/telephony/codec_opus/) | 1.3.0 | Asterisk 17 opus Codec by Digium |
|  | `asteriskDigiumCodecs.17.silk` | [asterisk-17-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 17 silk Codec by Digium |
|  | `asteriskDigiumCodecs.17.siren14` | [asterisk-17-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 17 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.17.siren7` | [asterisk-17-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 17 siren7 Codec by Digium |
|  | `asteriskDigiumCodecs.18.opus` | [asterisk-18-codec-opus](https://downloads.digium.com/pub/telephony/codec_opus/) | 1.3.0 | Asterisk 18 opus Codec by Digium |
|  | `asteriskDigiumCodecs.18.silk` | [asterisk-18-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 18 silk Codec by Digium |
|  | `asteriskDigiumCodecs.18.siren14` | [asterisk-18-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 18 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.18.siren7` | [asterisk-18-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 18 siren7 Codec by Digium |
|  | `asteriskDigiumCodecs.19.opus` | [asterisk-19-codec-opus](https://downloads.digium.com/pub/telephony/codec_opus/) | 1.3.0 | Asterisk 19 opus Codec by Digium |
|  | `asteriskDigiumCodecs.19.silk` | [asterisk-19-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 19 silk Codec by Digium |
|  | `asteriskDigiumCodecs.19.siren14` | [asterisk-19-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 19 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.19.siren7` | [asterisk-19-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 19 siren7 Codec by Digium |
|  | `asteriskDigiumCodecs.20.opus` | [asterisk-20-codec-opus](https://downloads.digium.com/pub/telephony/codec_opus/) | 1.3.0 | Asterisk 20 opus Codec by Digium |
|  | `asteriskDigiumCodecs.20.silk` | [asterisk-20-codec-silk](https://downloads.digium.com/pub/telephony/codec_silk/) | 1.0.3 | Asterisk 20 silk Codec by Digium |
|  | `asteriskDigiumCodecs.20.siren14` | [asterisk-20-codec-siren14](https://downloads.digium.com/pub/telephony/codec_siren14/) | 1.0.7 | Asterisk 20 siren14 Codec by Digium |
|  | `asteriskDigiumCodecs.20.siren7` | [asterisk-20-codec-siren7](https://downloads.digium.com/pub/telephony/codec_siren7/) | 1.0.7 | Asterisk 20 siren7 Codec by Digium |
</details>

<details>
<summary>Package set: lantianCustomized (11 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `lantianCustomized.asterisk` | [asterisk](https://www.asterisk.org/) | 20.5.1 | Asterisk with Lan Tian modifications |
|  | `lantianCustomized.attic-telnyx-compatible` | [attic-telnyx-compatible](https://github.com/zhaofengli/attic) | e6bedf1869f382cfc51b69848d6e09d51585ead6 | Attic (Nix binary cache) patched for Telnyx Cloud Storage compatibility |
|  | `lantianCustomized.coredns` | [coredns-lantian](https://github.com/xddxdd/coredns) | a411a29f831648afa98aa79b164e790add2d6f14 | CoreDNS with Lan Tian's modifications |
|  | `lantianCustomized.librime-with-plugins` | [librime](https://rime.im/) | 1.9.0 | Librime with plugins (librime-charcode, librime-lua, librime-octagram, librime-proto) |
|  | `lantianCustomized.linux-xanmod-lantian` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianCustomized.linux-xanmod-lantian-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianCustomized.linux-xanmod-lantian-unstable` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianCustomized.linux-xanmod-lantian-unstable-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianCustomized.nbfc-linux` | [nbfc-linux-lantian](https://github.com/xddxdd/nbfc-linux) | 32a49117ca3ff17d7681713a8dc8812323142dcb | NoteBook FanControl ported to Linux (with Lan Tian's modifications) |
|  | `lantianCustomized.nginx` | [nginx-lantian](https://openresty.org) | 1.21.4.3 | OpenResty with Lan Tian modifications |
|  | `lantianCustomized.transmission-with-webui` | [transmission](http://www.transmissionbt.com/) | 3.00 | A fast, easy and free BitTorrent client |
</details>

<details>
<summary>Package set: lantianLinuxXanmod (60 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `lantianLinuxXanmod.generic` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.generic-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.latest-generic` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.latest-generic-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.latest-x86_64-v1` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.latest-x86_64-v1-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.latest-x86_64-v2` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.latest-x86_64-v2-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.latest-x86_64-v3` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.latest-x86_64-v3-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.latest-x86_64-v4` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.latest-x86_64-v4-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.lts-generic` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.lts-generic-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.lts-x86_64-v1` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.lts-x86_64-v1-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.lts-x86_64-v2` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.lts-x86_64-v2-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.lts-x86_64-v3` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.lts-x86_64-v3-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.lts-x86_64-v4` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.lts-x86_64-v4-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_0-generic` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_0-generic-lto` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_0-x86_64-v1` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_0-x86_64-v1-lto` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_0-x86_64-v2` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_0-x86_64-v2-lto` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_0-x86_64-v3` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_0-x86_64-v3-lto` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_0-x86_64-v4` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_0-x86_64-v4-lto` | [linux](https://www.kernel.org/) | 6.0.12-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_1-generic` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_1-generic-lto` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_1-x86_64-v1` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_1-x86_64-v1-lto` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_1-x86_64-v2` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_1-x86_64-v2-lto` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_1-x86_64-v3` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_1-x86_64-v3-lto` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_1-x86_64-v4` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_1-x86_64-v4-lto` | [linux](https://www.kernel.org/) | 6.1.70-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_6-generic` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_6-generic-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_6-x86_64-v1` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_6-x86_64-v1-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_6-x86_64-v2` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_6-x86_64-v2-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_6-x86_64-v3` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_6-x86_64-v3-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.v6_6-x86_64-v4` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.v6_6-x86_64-v4-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.x86_64-v1` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.x86_64-v1-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.x86_64-v2` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.x86_64-v2-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.x86_64-v3` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.x86_64-v3-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
|  | `lantianLinuxXanmod.x86_64-v4` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications |
|  | `lantianLinuxXanmod.x86_64-v4-lto` | [linux](https://www.kernel.org/) | 6.6.9-xanmod1 | Linux Xanmod Kernel with Lan Tian Modifications and Clang+ThinLTO |
</details>

<details>
<summary>Package set: lantianLinuxXanmodPackages (0 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |

</details>

<details>
<summary>Package set: lantianPersonal (1 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `lantianPersonal.libltnginx` | libltnginx | 96698a667740ac45ca4571a04a6cfe39caf926c0 |  |
</details>

<details>
<summary>Package set: nvidia-grid (98 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `nvidia-grid.grid.10_0` | [nvidia-x11-440.43-6.1.69](https://www.nvidia.com/object/unix.html) | 440.43 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.10_1` | [nvidia-x11-440.56-6.1.69](https://www.nvidia.com/object/unix.html) | 440.56 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.10_2` | [nvidia-x11-440.87-6.1.69](https://www.nvidia.com/object/unix.html) | 440.87 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.10_3` | [nvidia-x11-440.107-6.1.69](https://www.nvidia.com/object/unix.html) | 440.107 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.10_4` | [nvidia-x11-440.118.02-6.1.69](https://www.nvidia.com/object/unix.html) | 440.118.02 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_0` | [nvidia-x11-450.51.05-6.1.69](https://www.nvidia.com/object/unix.html) | 450.51.05 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_1` | [nvidia-x11-450.80.02-6.1.69](https://www.nvidia.com/object/unix.html) | 450.80.02 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_10` | [nvidia-x11-450.216.04-6.1.69](https://www.nvidia.com/object/unix.html) | 450.216.04 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_11` | [nvidia-x11-450.216.04-6.1.69](https://www.nvidia.com/object/unix.html) | 450.216.04 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_2` | [nvidia-x11-450.89-6.1.69](https://www.nvidia.com/object/unix.html) | 450.89 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_3` | [nvidia-x11-450.102.04-6.1.69](https://www.nvidia.com/object/unix.html) | 450.102.04 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_4` | [nvidia-x11-418.211.00-6.1.69](https://www.nvidia.com/object/unix.html) | 418.211.00 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_5` | [nvidia-x11-450.142.00-6.1.69](https://www.nvidia.com/object/unix.html) | 450.142.00 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_6` | [nvidia-x11-450.156.00-6.1.69](https://www.nvidia.com/object/unix.html) | 450.156.00 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_7` | [nvidia-x11-450.172.01-6.1.69](https://www.nvidia.com/object/unix.html) | 450.172.01 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_8` | [nvidia-x11-450.191.01-6.1.69](https://www.nvidia.com/object/unix.html) | 450.191.01 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.11_9` | [nvidia-x11-450.203.02-6.1.69](https://www.nvidia.com/object/unix.html) | 450.203.02 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.12_0` | [nvidia-x11-460.32.03-6.1.69](https://www.nvidia.com/object/unix.html) | 460.32.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.12_1` | [nvidia-x11-460.32.03-6.1.69](https://www.nvidia.com/object/unix.html) | 460.32.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.12_2` | [nvidia-x11-460.73.01-6.1.69](https://www.nvidia.com/object/unix.html) | 460.73.01 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.12_3` | [nvidia-x11-460.91.03-6.1.69](https://www.nvidia.com/object/unix.html) | 460.91.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.12_4` | [nvidia-x11-460.106.00-6.1.69](https://www.nvidia.com/object/unix.html) | 460.106.00 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.13_0` | [nvidia-x11-470.63.01-6.1.69](https://www.nvidia.com/object/unix.html) | 470.63.01 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.13_1` | [nvidia-x11-470.82.01-6.1.69](https://www.nvidia.com/object/unix.html) | 470.82.01 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.13_2` | [nvidia-x11-470.103.01-6.1.69](https://www.nvidia.com/object/unix.html) | 470.103.01 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.13_3` | [nvidia-x11-470.129.06-6.1.69](https://www.nvidia.com/object/unix.html) | 470.129.06 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.13_4` | [nvidia-x11-470.141.03-6.1.69](https://www.nvidia.com/object/unix.html) | 470.141.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.13_5` | [nvidia-x11-470.161.03-6.1.69](https://www.nvidia.com/object/unix.html) | 470.161.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.13_6` | [nvidia-x11-470.161.03-6.1.69](https://www.nvidia.com/object/unix.html) | 470.161.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.14_0` | [nvidia-x11-510.47.03-6.1.69](https://www.nvidia.com/object/unix.html) | 510.47.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.14_1` | [nvidia-x11-510.73.08-6.1.69](https://www.nvidia.com/object/unix.html) | 510.73.08 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.14_2` | [nvidia-x11-510.85.02-6.1.69](https://www.nvidia.com/object/unix.html) | 510.85.02 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.14_3` | [nvidia-x11-510.108.03-6.1.69](https://www.nvidia.com/object/unix.html) | 510.108.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.14_4` | [nvidia-x11-510.108.03-6.1.69](https://www.nvidia.com/object/unix.html) | 510.108.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.15_0` | [nvidia-x11-525.60.13-6.1.69](https://www.nvidia.com/object/unix.html) | 525.60.13 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.15_1` | [nvidia-x11-525.85.05-6.1.69](https://www.nvidia.com/object/unix.html) | 525.85.05 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.15_2` | [nvidia-x11-525.105.17-6.1.69](https://www.nvidia.com/object/unix.html) | 525.105.17 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.15_3` | [nvidia-x11-525.125.06-6.1.69](https://www.nvidia.com/object/unix.html) | 525.125.06 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.16_0` | [nvidia-x11-535.54.03-6.1.69](https://www.nvidia.com/object/unix.html) | 535.54.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.16_1` | [nvidia-x11-535.104.05-6.1.69](https://www.nvidia.com/object/unix.html) | 535.104.05 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.16_2` | [nvidia-x11-535.129.03-6.1.69](https://www.nvidia.com/object/unix.html) | 535.129.03 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.8_3` | [nvidia-x11-418.130-6.1.69](https://www.nvidia.com/object/unix.html) | 418.130 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.8_4` | [nvidia-x11-418.149-6.1.69](https://www.nvidia.com/object/unix.html) | 418.149 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.8_5` | [nvidia-x11-418.165.01-6.1.69](https://www.nvidia.com/object/unix.html) | 418.165.01 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.8_6` | [nvidia-x11-418.181.07-6.1.69](https://www.nvidia.com/object/unix.html) | 418.181.07 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.8_7` | [nvidia-x11-418.197.02-6.1.69](https://www.nvidia.com/object/unix.html) | 418.197.02 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.8_8` | [nvidia-x11-418.211.00-6.1.69](https://www.nvidia.com/object/unix.html) | 418.211.00 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.9_3` | [nvidia-x11-430.83-6.1.69](https://www.nvidia.com/object/unix.html) | 430.83 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.grid.9_4` | [nvidia-x11-430.99-6.1.69](https://www.nvidia.com/object/unix.html) | 430.99 | NVIDIA vGPU guest driver (GRID driver, experimental package) |
|  | `nvidia-grid.vgpu.10_0` | [nvidia-x11-440.43-6.1.69](https://www.nvidia.com/object/unix.html) | 440.43 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.10_1` | [nvidia-x11-440.53-6.1.69](https://www.nvidia.com/object/unix.html) | 440.53 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.10_2` | [nvidia-x11-440.87-6.1.69](https://www.nvidia.com/object/unix.html) | 440.87 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.10_3` | [nvidia-x11-440.107-6.1.69](https://www.nvidia.com/object/unix.html) | 440.107 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.10_4` | [nvidia-x11-440.121-6.1.69](https://www.nvidia.com/object/unix.html) | 440.121 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_0` | [nvidia-x11-450.55-6.1.69](https://www.nvidia.com/object/unix.html) | 450.55 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_1` | [nvidia-x11-450.80-6.1.69](https://www.nvidia.com/object/unix.html) | 450.80 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_10` | [nvidia-x11-450.216.04-6.1.69](https://www.nvidia.com/object/unix.html) | 450.216.04 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_11` | [nvidia-x11-450.216.04-6.1.69](https://www.nvidia.com/object/unix.html) | 450.216.04 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_2` | [nvidia-x11-450.89-6.1.69](https://www.nvidia.com/object/unix.html) | 450.89 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_3` | [nvidia-x11-450.102-6.1.69](https://www.nvidia.com/object/unix.html) | 450.102 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_4` | [nvidia-x11-418.213-6.1.69](https://www.nvidia.com/object/unix.html) | 418.213 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_5` | [nvidia-x11-450.142-6.1.69](https://www.nvidia.com/object/unix.html) | 450.142 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_6` | [nvidia-x11-450.156-6.1.69](https://www.nvidia.com/object/unix.html) | 450.156 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_7` | [nvidia-x11-450.172-6.1.69](https://www.nvidia.com/object/unix.html) | 450.172 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_8` | [nvidia-x11-450.191-6.1.69](https://www.nvidia.com/object/unix.html) | 450.191 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.11_9` | [nvidia-x11-450.203-6.1.69](https://www.nvidia.com/object/unix.html) | 450.203 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.12_0` | [nvidia-x11-460.32.04-6.1.69](https://www.nvidia.com/object/unix.html) | 460.32.04 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.12_1` | [nvidia-x11-460.32.04-6.1.69](https://www.nvidia.com/object/unix.html) | 460.32.04 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.12_2` | [nvidia-x11-460.73.02-6.1.69](https://www.nvidia.com/object/unix.html) | 460.73.02 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.12_3` | [nvidia-x11-460.91.03-6.1.69](https://www.nvidia.com/object/unix.html) | 460.91.03 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.12_4` | [nvidia-x11-460.107-6.1.69](https://www.nvidia.com/object/unix.html) | 460.107 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.13_0` | [nvidia-x11-470.63-6.1.69](https://www.nvidia.com/object/unix.html) | 470.63 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.13_1` | [nvidia-x11-470.82-6.1.69](https://www.nvidia.com/object/unix.html) | 470.82 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.13_2` | [nvidia-x11-470.103.02-6.1.69](https://www.nvidia.com/object/unix.html) | 470.103.02 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.13_3` | [nvidia-x11-470.129.04-6.1.69](https://www.nvidia.com/object/unix.html) | 470.129.04 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.13_4` | [nvidia-x11-470.141.05-6.1.69](https://www.nvidia.com/object/unix.html) | 470.141.05 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.13_5` | [nvidia-x11-470.161.02-6.1.69](https://www.nvidia.com/object/unix.html) | 470.161.02 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.13_6` | [nvidia-x11-470.161.02-6.1.69](https://www.nvidia.com/object/unix.html) | 470.161.02 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.14_0` | [nvidia-x11-510.47.03-6.1.69](https://www.nvidia.com/object/unix.html) | 510.47.03 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.14_1` | [nvidia-x11-510.73.06-6.1.69](https://www.nvidia.com/object/unix.html) | 510.73.06 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.14_2` | [nvidia-x11-510.85.03-6.1.69](https://www.nvidia.com/object/unix.html) | 510.85.03 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.14_3` | [nvidia-x11-510.108.03-6.1.69](https://www.nvidia.com/object/unix.html) | 510.108.03 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.14_4` | [nvidia-x11-510.108.03-6.1.69](https://www.nvidia.com/object/unix.html) | 510.108.03 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.15_0` | [nvidia-x11-525.60.12-6.1.69](https://www.nvidia.com/object/unix.html) | 525.60.12 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.15_1` | [nvidia-x11-525.85.07-6.1.69](https://www.nvidia.com/object/unix.html) | 525.85.07 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.15_2` | [nvidia-x11-525.105.14-6.1.69](https://www.nvidia.com/object/unix.html) | 525.105.14 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.15_3` | [nvidia-x11-525.125.03-6.1.69](https://www.nvidia.com/object/unix.html) | 525.125.03 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.16_0` | [nvidia-x11-535.54.06-6.1.69](https://www.nvidia.com/object/unix.html) | 535.54.06 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.16_1` | [nvidia-x11-535.104.06-6.1.69](https://www.nvidia.com/object/unix.html) | 535.104.06 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.16_2` | [nvidia-x11-535.129.03-6.1.69](https://www.nvidia.com/object/unix.html) | 535.129.03 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.8_3` | [nvidia-x11-418.130-6.1.69](https://www.nvidia.com/object/unix.html) | 418.130 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.8_4` | [nvidia-x11-418.149-6.1.69](https://www.nvidia.com/object/unix.html) | 418.149 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.8_5` | [nvidia-x11-418.165.01-6.1.69](https://www.nvidia.com/object/unix.html) | 418.165.01 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.8_6` | [nvidia-x11-418.181-6.1.69](https://www.nvidia.com/object/unix.html) | 418.181 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.8_7` | [nvidia-x11-418.196-6.1.69](https://www.nvidia.com/object/unix.html) | 418.196 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.8_8` | [nvidia-x11-418.213-6.1.69](https://www.nvidia.com/object/unix.html) | 418.213 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.9_3` | [nvidia-x11-430.83-6.1.69](https://www.nvidia.com/object/unix.html) | 430.83 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
|  | `nvidia-grid.vgpu.9_4` | [nvidia-x11-430.99-6.1.69](https://www.nvidia.com/object/unix.html) | 430.99 | NVIDIA vGPU host driver (vGPU-KVM driver, experimental package) |
</details>

<details>
<summary>Package set: openj9-ibm-semeru (100 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `openj9-ibm-semeru.jdk-bin-11` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.21.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_12_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.12.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_13_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.13.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_14_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.14.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_14_1` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.14.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_15_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.15.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_16_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.16.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_16_1` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.16.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_17_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.17.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_18_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.18.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_19_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.19.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_20_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.20.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_20_1` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.20.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-11_0_21_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.21.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-16` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 16.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-16_0_2_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 16.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.9.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_1_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.1.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_2_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_3_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.3.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_4_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.4.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_4_1` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.4.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_5_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.5.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_6_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.6.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_7_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.7.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_8_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.8.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_8_1` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.8.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-17_0_9_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.9.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-18` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.2.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-18_0_1_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.1.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-18_0_1_1` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.1.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-18_0_2_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-18_0_2_1` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.2.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-19` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 19.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-19_0_2_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 19.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-20` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 20.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-20_0_1_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 20.0.1.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-20_0_2_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 20.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.392.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_302_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.302.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_312_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.312.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_322_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.322.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_332_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.332.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_345_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.345.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_345_1` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.345.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_352_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.352.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_362_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.362.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_372_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.372.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_382_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.382.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jdk-bin-8_0_392_0` | [openj9-ibm-semeru-jdk-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.392.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.21.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_12_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.12.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_13_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.13.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_14_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.14.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_14_1` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.14.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_15_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.15.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_16_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.16.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_16_1` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.16.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_17_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.17.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_18_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.18.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_19_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.19.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_20_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.20.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_20_1` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.20.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-11_0_21_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 11.0.21.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-16` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 16.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-16_0_2_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 16.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.9.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_1_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.1.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_2_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_3_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.3.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_4_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.4.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_4_1` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.4.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_5_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.5.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_6_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.6.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_7_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.7.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_8_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.8.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_8_1` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.8.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-17_0_9_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 17.0.9.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-18` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.2.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-18_0_1_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.1.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-18_0_1_1` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.1.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-18_0_2_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-18_0_2_1` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 18.0.2.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-19` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 19.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-19_0_2_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 19.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-20` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 20.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-20_0_1_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 20.0.1.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-20_0_2_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 20.0.2.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.392.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_302_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.302.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_312_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.312.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_322_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.322.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_332_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.332.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_345_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.345.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_345_1` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.345.1 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_352_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.352.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_362_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.362.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_372_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.372.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_382_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.382.0 | OpenJ9 binaries built by IBM Semeru |
|  | `openj9-ibm-semeru.jre-bin-8_0_392_0` | [openj9-ibm-semeru-jre-bin](https://developer.ibm.com/languages/java/semeru-runtimes/) | 8.0.392.0 | OpenJ9 binaries built by IBM Semeru |
</details>

<details>
<summary>Package set: openjdk-adoptium (86 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `openjdk-adoptium.jdk-bin-11` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.21_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_12_7` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.12_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_13_8` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.13_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_14_1_1` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.14.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_14_9` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.14_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_15_10` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.15_10_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_16_1_1` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.16.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_16_8` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.16_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_17_8` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.17_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_18_10` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.18_10_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_19_7` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.19_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_20_1_1` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.20.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_20_8` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.20_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-11_0_21_9` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 11.0.21_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-16` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 16.0.2_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-16_0_2_7` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 16.0.2_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_1_12` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.1_12_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_2_8` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.2_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_3_7` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.3_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_4_1_1` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.4.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_4_8` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.4_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_5_8` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.5_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_6_10` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.6_10_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_7_7` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.7_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_8_1_1` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.8.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_8_7` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.8_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_0_9_9` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17.0.9_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-17_35` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 17_35_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-18` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 18.0.2.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-18_0_1_10` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 18.0.1_10_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-18_0_2_1_1` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 18.0.2.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-18_0_2_9` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 18.0.2_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-18_36` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 18_36_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u392-b08_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u302_b08` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u302-b08 | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u312_b07` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u312-b07 | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u322_b06` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u322-b06_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u332_b09` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u332-b09_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u342_b07` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u342-b07_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u345_b01` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u345-b01_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u352_b08` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u352-b08_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u362_b09` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u362-b09_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u372_b07` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u372-b07_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u382_b05` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u382-b05_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jdk-bin-8u392_b08` | [openjdk-adoptium-jdk-bin](https://adoptium.net/) | 8u392-b08_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.21_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_12_7` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.12_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_13_8` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.13_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_14_1_1` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.14.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_14_9` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.14_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_15_10` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.15_10_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_16_1_1` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.16.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_16_8` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.16_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_17_8` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.17_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_18_10` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.18_10_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_19_7` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.19_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_20_1_1` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.20.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_20_8` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.20_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-11_0_21_9` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 11.0.21_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_1_12` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.1_12_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_2_8` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.2_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_3_7` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.3_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_4_1_1` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.4.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_4_8` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.4_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_5_8` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.5_8_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_6_10` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.6_10_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_7_7` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.7_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_8_1_1` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.8.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_8_7` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.8_7_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-17_0_9_9` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 17.0.9_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-18` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 18.0.2.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-18_0_1_10` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 18.0.1_10_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-18_0_2_1_1` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 18.0.2.1_1_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-18_0_2_9` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 18.0.2_9_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u392-b08_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u302_b08` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u302-b08 | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u312_b07` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u312-b07 | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u322_b06` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u322-b06_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u332_b09` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u332-b09_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u342_b07` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u342-b07_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u345_b01` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u345-b01_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u352_b08` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u352-b08_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u362_b09` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u362-b09_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u372_b07` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u372-b07_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u382_b05` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u382-b05_adopt | OpenJDK binaries built by Eclipse Adoptium |
|  | `openjdk-adoptium.jre-bin-8u392_b08` | [openjdk-adoptium-jre-bin](https://adoptium.net/) | 8u392-b08_adopt | OpenJDK binaries built by Eclipse Adoptium |
</details>

<details>
<summary>Package set: plangothic-fonts (2 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `plangothic-fonts.allideo` | [plangothic-fonts-allideo](https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic) | V1.8.5752 | Plangothic Project |
|  | `plangothic-fonts.fallback` | [plangothic-fonts-fallback](https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic) | V1.8.5752 | Plangothic Project |
</details>

<details>
<summary>Package set: th-fonts (10 packages)</summary>

| State | Path | Name | Version | Description |
| ----- | ---- | ---- | ------- | ----------- |
|  | `th-fonts.feon` | [TH-Feon](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Feon font |
|  | `th-fonts.hak` | [TH-Hak](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Hak font |
|  | `th-fonts.joeng` | [TH-Joeng](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Joeng font |
|  | `th-fonts.khaai-p` | [TH-Khaai-P](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Khaai-P font |
|  | `th-fonts.khaai-t` | [TH-Khaai-T](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Khaai-T font |
|  | `th-fonts.ming` | [TH-Ming](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Ming font |
|  | `th-fonts.sung-p` | [TH-Sung-P](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Sung-P font |
|  | `th-fonts.sung-t` | [TH-Sung-T](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Sung-T font |
|  | `th-fonts.sy` | [TH-Sy](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Sy font |
|  | `th-fonts.tshyn` | [TH-Tshyn](http://cheonhyeong.com/Simplified/download.html) | 3.0.0 | TH-Tshyn font |
</details>

