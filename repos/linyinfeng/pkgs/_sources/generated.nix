# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  aws-sigv4-proxy = {
    pname = "aws-sigv4-proxy";
    version = "c1ff099576404c50956ed6c0233919434746bcbf";
    src = fetchgit {
      url = "https://github.com/awslabs/aws-sigv4-proxy.git";
      rev = "c1ff099576404c50956ed6c0233919434746bcbf";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-E3PnQDUdz3HDPSUCMy2/poCGbnINe9s2zUHaAIIjxfw=";
    };
  };
  clash-for-windows = {
    pname = "clash-for-windows";
    version = "0.19.29";
    src = fetchurl {
      url = "https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.19.29/Clash.for.Windows-0.19.29-x64-linux.tar.gz";
      sha256 = "sha256-ICw9ZBGzjF/lPOqTYfTawcTciNGCbNnWR+1jejZR6bQ=";
    };
  };
  clash-for-windows-icon = {
    pname = "clash-for-windows-icon";
    version = "0";
    src = fetchurl {
      url = "https://web.archive.org/web/20211210004725if_/https://docs.cfw.lbyczf.com/favicon.ico";
      sha256 = "sha256-4uLJzumIqF6T1yvrdKciqrSNYpJ1+6ecmonRzOsopP0=";
    };
  };
  clash-premium-aarch64-linux = {
    pname = "clash-premium-aarch64-linux";
    version = "2022.08.26";
    src = fetchurl {
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv8-2022.08.26.gz";
      sha256 = "sha256-w4ZRrHFejXGUgQQ/N46AqVe/8+Bo5y1zRkA9p1OMQF0=";
    };
  };
  clash-premium-i686-linux = {
    pname = "clash-premium-i686-linux";
    version = "2022.08.26";
    src = fetchurl {
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-386-2022.08.26.gz";
      sha256 = "sha256-+wRLqFJIVf6lAkfK7war3xXdIFxbGLP5BnbE9yylrzM=";
    };
  };
  clash-premium-x86_64-darwin = {
    pname = "clash-premium-x86_64-darwin";
    version = "2022.08.26";
    src = fetchurl {
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-darwin-amd64-2022.08.26.gz";
      sha256 = "sha256-2zQ1oeqo5w6lZYVkOcKph9Z9spfvgiImOUjlGYR3p6s=";
    };
  };
  clash-premium-x86_64-linux = {
    pname = "clash-premium-x86_64-linux";
    version = "2022.08.26";
    src = fetchurl {
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2022.08.26.gz";
      sha256 = "sha256-F3Gn2b5zhgd+galkJIt5Hw2fDs9SGKPE7vxi+GRR3h0=";
    };
  };
  commit-notifier = {
    pname = "commit-notifier";
    version = "573c1eb7eabc97aa06e0e9ad85f5148110749876";
    src = fetchgit {
      url = "https://github.com/linyinfeng/commit-notifier.git";
      rev = "573c1eb7eabc97aa06e0e9ad85f5148110749876";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-JiLwijB+Zqe5JgKLncr7r4w1lpDRWWVh9TAl+9nOiCo=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./commit-notifier-573c1eb7eabc97aa06e0e9ad85f5148110749876/Cargo.lock;
      outputHashes = { };
    };
  };
  dot-tar = {
    pname = "dot-tar";
    version = "56769243e896b6894b99c5e5b849b71698a27d1f";
    src = fetchgit {
      url = "https://github.com/linyinfeng/dot-tar.git";
      rev = "56769243e896b6894b99c5e5b849b71698a27d1f";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-iRCs5Js0i3uhG2vrNnYKtdndRorTKjmlaNJA/5kyyaM=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./dot-tar-56769243e896b6894b99c5e5b849b71698a27d1f/Cargo.lock;
      outputHashes = { };
    };
  };
  dpt-rp1-py = {
    pname = "dpt-rp1-py";
    version = "v0.1.16";
    src = fetchFromGitHub ({
      owner = "janten";
      repo = "dpt-rp1-py";
      rev = "v0.1.16";
      fetchSubmodules = false;
      sha256 = "sha256-cq9yHBQyqzlEb1Dvpx90MIixT8PxB8TBKv3+nFYCbn8=";
    });
  };
  icalingua-plus-plus = {
    pname = "icalingua-plus-plus";
    version = "v2.7.1";
    src = fetchurl {
      url = "https://github.com/icalingua-plus-plus/icalingua-plus-plus/releases/download/v2.7.1/app-x86_64.asar";
      sha256 = "sha256-tWYOGjzLbpILzoWL15KJALvpCr71qzerhA2hu9GZp0w=";
    };
  };
  icalingua-plus-plus-aur = {
    pname = "icalingua-plus-plus-aur";
    version = "a0c47807b82216d1a3d41218b7c4935d78b35db2";
    src = fetchgit {
      url = "https://aur.archlinux.org/icalingua++.git";
      rev = "a0c47807b82216d1a3d41218b7c4935d78b35db2";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-ewzIhAvARo1WzULF1WhQNiCgWXC25UHRfGi2AjqV87A=";
    };
  };
  pisces = {
    pname = "pisces";
    version = "e45e0869855d089ba1e628b6248434b2dfa709c4";
    src = fetchgit {
      url = "https://github.com/laughedelic/pisces";
      rev = "e45e0869855d089ba1e628b6248434b2dfa709c4";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-Oou2IeNNAqR00ZT3bss/DbhrJjGeMsn9dBBYhgdafBw=";
    };
  };
  plugin-bang-bang = {
    pname = "plugin-bang-bang";
    version = "f969c618301163273d0a03d002614d9a81952c1e";
    src = fetchgit {
      url = "https://github.com/oh-my-fish/plugin-bang-bang";
      rev = "f969c618301163273d0a03d002614d9a81952c1e";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-A8ydBX4LORk+nutjHurqNNWFmW6LIiBPQcxS3x4nbeQ=";
    };
  };
  plugin-git = {
    pname = "plugin-git";
    version = "cc5999fa296c18105fb62f1637deec1d12454129";
    src = fetchgit {
      url = "https://github.com/jhillyerd/plugin-git";
      rev = "cc5999fa296c18105fb62f1637deec1d12454129";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-NaDZLmktuwlYxxzwDoVKgd8bEY+Wy9b2Qaz0CTf8V/Q=";
    };
  };
  replay-fish = {
    pname = "replay-fish";
    version = "1.2.1";
    src = fetchFromGitHub ({
      owner = "jorgebucaran";
      repo = "replay.fish";
      rev = "1.2.1";
      fetchSubmodules = false;
      sha256 = "sha256-bM6+oAd/HXaVgpJMut8bwqO54Le33hwO9qet9paK1kY=";
    });
  };
  telegram-send = {
    pname = "telegram-send";
    version = "34d7703754d441a6f4c4a7b5b3210759d36078e2";
    src = fetchgit {
      url = "https://github.com/rahiel/telegram-send.git";
      rev = "34d7703754d441a6f4c4a7b5b3210759d36078e2";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-/+hNnUT7kA19wpiHGNPVMQGostjoaDzHd91WYruJq0w=";
    };
  };
  trojan = {
    pname = "trojan";
    version = "v1.16.0";
    src = fetchFromGitHub ({
      owner = "trojan-gfw";
      repo = "trojan";
      rev = "v1.16.0";
      fetchSubmodules = false;
      sha256 = "sha256-fCoZEXQ6SL++QXP6GlNYIyFaVhQ8EWelJ33VbYiHRGw=";
    });
  };
  vlmcsd = {
    pname = "vlmcsd";
    version = "svn1113";
    src = fetchFromGitHub ({
      owner = "Wind4";
      repo = "vlmcsd";
      rev = "svn1113";
      fetchSubmodules = false;
      sha256 = "sha256-OKysOm44T9wrAaopp9HfLlox5InlpV33AHGXRSjhDqc=";
    });
  };
  wemeet = {
    pname = "wemeet";
    version = "3.9.0.1";
    src = fetchurl {
      url = "https://updatecdn.meeting.qq.com/OTRhY2YwZTUtMzE5Ni00NDQyLTg0MTMtOTBjYzQzNzcxYTQz/TencentMeeting_0300000000_3.9.0.1_x86_64_default.publish.deb";
      sha256 = "sha256-g1sYuTP0RU6gUbztP+rKR1i4WTkvjdSPUEIKPEqtmCc=";
    };
  };
  yacd = {
    pname = "yacd";
    version = "v0.3.6";
    src = fetchurl {
      url = "https://github.com/haishanh/yacd/releases/download/v0.3.6/yacd.tar.xz";
      sha256 = "sha256-YIx+IcHubP7mJoxaOVGkwh3EB+6mcEkFjOwpnAsR4vs=";
    };
  };
  zeronsd = {
    pname = "zeronsd";
    version = "v0.5.2";
    src = fetchFromGitHub ({
      owner = "zerotier";
      repo = "zeronsd";
      rev = "v0.5.2";
      fetchSubmodules = false;
      sha256 = "sha256-TL0bgzQgge6j1SpZCdxv/s4pBMSg4/3U5QisjkVE6BE=";
    });
    cargoLock."Cargo.lock" = {
      lockFile = ./zeronsd-v0.5.2/Cargo.lock;
      outputHashes = { };
    };
  };
}
