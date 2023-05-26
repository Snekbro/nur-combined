# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  basiliskii-bin = {
    pname = "basiliskii-bin";
    version = "2023-05-11";
    src = fetchurl {
      url = "https://github.com/Korkman/macemu-appimage-builder/releases/download/2023-05-11/BasiliskII-x86_64.AppImage";
      sha256 = "sha256-8FuEXcfPMxmqhFgnCzkPT0ItpgDqHHBHJnEP2ihMNRk=";
    };
  };
  bling = {
    pname = "bling";
    version = "401985a327797cf146d95789f83421beeda8a27e";
    src = fetchFromGitHub {
      owner = "blingcorp";
      repo = "bling";
      rev = "401985a327797cf146d95789f83421beeda8a27e";
      fetchSubmodules = false;
      sha256 = "sha256-emJz0RuySe4ysIcgFQyABajsH642336asOiVpf3MLqA=";
    };
    date = "2023-05-22";
  };
  cardinal = {
    pname = "cardinal";
    version = "4edf85ab928f0c7ee0ce6cb31751807cf83d9cd9";
    src = fetchFromGitHub {
      owner = "DISTRHO";
      repo = "Cardinal";
      rev = "4edf85ab928f0c7ee0ce6cb31751807cf83d9cd9";
      fetchSubmodules = true;
      sha256 = "sha256-jbN412ZM+6EhoY3dgL4h14Iu8u3AtWC9EJRzotGsGIo=";
    };
    date = "2023-05-23";
  };
  carla = {
    pname = "carla";
    version = "1a75fc6b19c34ee5834440573df8a5844bb2cf12";
    src = fetchFromGitHub {
      owner = "falkTX";
      repo = "Carla";
      rev = "1a75fc6b19c34ee5834440573df8a5844bb2cf12";
      fetchSubmodules = false;
      sha256 = "sha256-NtzcYBPf5CVo0Axen1F5rApaoco2c/9OenzUmauRLss=";
    };
    date = "2023-05-26";
  };
  dmenu-flexipatch = {
    pname = "dmenu-flexipatch";
    version = "9e721014cd90dd6782a088f4d8f96706711774ac";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dmenu-flexipatch";
      rev = "9e721014cd90dd6782a088f4d8f96706711774ac";
      fetchSubmodules = false;
      sha256 = "sha256-1GOCVdlx40B9u5q28SWWdEMvygUBynrM93Wmpj3/mWQ=";
    };
    date = "2023-05-17";
  };
  dpf-plugins = {
    pname = "dpf-plugins";
    version = "v1.7";
    src = fetchFromGitHub {
      owner = "DISTRHO";
      repo = "DPF-Plugins";
      rev = "v1.7";
      fetchSubmodules = false;
      sha256 = "sha256-768DlGZrD2vNoHAuVh3SxQHCIT4l44qORGWajo4bTiA=";
    };
  };
  dwm-flexipatch = {
    pname = "dwm-flexipatch";
    version = "3881ad4ad14576417cbca3cff4ab852b323089f5";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dwm-flexipatch";
      rev = "3881ad4ad14576417cbca3cff4ab852b323089f5";
      fetchSubmodules = false;
      sha256 = "sha256-+SxIYu9iha0WFRv9xY0N/7eD0UIoasiq1xW3kVF85c8=";
    };
    date = "2023-05-24";
  };
  fennel-language-server = {
    pname = "fennel-language-server";
    version = "d0c65db2ef43fd56390db14c422983040b41dd9c";
    src = fetchFromGitHub {
      owner = "rydesun";
      repo = "fennel-language-server";
      rev = "d0c65db2ef43fd56390db14c422983040b41dd9c";
      fetchSubmodules = false;
      sha256 = "sha256-KU2MPmgHOS/WesBzCmEoHHXHoDWCyqjy49tmMmZw5BQ=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./fennel-language-server-d0c65db2ef43fd56390db14c422983040b41dd9c/Cargo.lock;
      outputHashes = {
      };
    };
    date = "2023-03-01";
  };
  ildaeil = {
    pname = "ildaeil";
    version = "0f6f75ff78fb90e85020b1a2f525458b0e2511b7";
    src = fetchFromGitHub {
      owner = "DISTRHO";
      repo = "Ildaeil";
      rev = "0f6f75ff78fb90e85020b1a2f525458b0e2511b7";
      fetchSubmodules = true;
      sha256 = "sha256-ezc3a289zaLgFpM+hUej9a+ittDW9r443J3vteFIh3s=";
    };
    date = "2023-05-21";
  };
  keepmenu = {
    pname = "keepmenu";
    version = "1.3.1";
    src = fetchFromGitHub {
      owner = "firecat53";
      repo = "keepmenu";
      rev = "1.3.1";
      fetchSubmodules = false;
      sha256 = "sha256-1s+vl5j0oPERUvJCKFTvLubCF8Nhx7OtkPjpWmpEG/o=";
    };
  };
  kiwmi = {
    pname = "kiwmi";
    version = "17814972abe6a8811a586fa87c99a2b16a86075f";
    src = fetchFromGitHub {
      owner = "buffet";
      repo = "kiwmi";
      rev = "17814972abe6a8811a586fa87c99a2b16a86075f";
      fetchSubmodules = false;
      sha256 = "sha256-n9PA6cyEjSlnDcRrqIkO83UaCE/hovbi/oZon1B+nuw=";
    };
    date = "2022-07-30";
  };
  kmonad = {
    pname = "kmonad";
    version = "3aa2f52536de853efbcb0f6e790c97a3734687ec";
    src = fetchFromGitHub {
      owner = "kmonad";
      repo = "kmonad";
      rev = "3aa2f52536de853efbcb0f6e790c97a3734687ec";
      fetchSubmodules = false;
      sha256 = "sha256-gFiQ62jbBfumg0IR4oXR/DRVunOxMd4lJ5+g+qjz7wA=";
    };
    date = "2023-04-26";
  };
  lua-dbus = {
    pname = "lua-dbus";
    version = "cdef26d09aa61d7f1f175675040383f6ae0becbb";
    src = fetchFromGitHub {
      owner = "dodo";
      repo = "lua-dbus";
      rev = "cdef26d09aa61d7f1f175675040383f6ae0becbb";
      fetchSubmodules = false;
      sha256 = "sha256-S+W6QTqv4kdyR86GCyDLnkml10dO4ZVNXEd3/7vDFGE=";
    };
    date = "2015-04-22";
  };
  lua-dbus_proxy = {
    pname = "lua-dbus_proxy";
    version = "v0.10.3";
    src = fetchFromGitHub {
      owner = "stefano-m";
      repo = "lua-dbus_proxy";
      rev = "v0.10.3";
      fetchSubmodules = false;
      sha256 = "sha256-Yd8TN/vKiqX7NOZyy8OwOnreWS5gdyVMTAjFqoAuces=";
    };
  };
  luakit = {
    pname = "luakit";
    version = "858dc946b01487e6ba2475cb7a9bede34c17d134";
    src = fetchFromGitHub {
      owner = "luakit";
      repo = "luakit";
      rev = "858dc946b01487e6ba2475cb7a9bede34c17d134";
      fetchSubmodules = false;
      sha256 = "sha256-TKQvnavoofGtBo2aBJtZVZjrmm5Ln7vOgW9bAXjcpRM=";
    };
    date = "2023-01-29";
  };
  lv2vst = {
    pname = "lv2vst";
    version = "30a669a021812da05258519cef9d4202f5ce26c3";
    src = fetchFromGitHub {
      owner = "x42";
      repo = "lv2vst";
      rev = "30a669a021812da05258519cef9d4202f5ce26c3";
      fetchSubmodules = false;
      sha256 = "sha256-WFVscNivFrsADl7w5pSYx9g+UzK2XUBF7x0Iqg8WKiQ=";
    };
    date = "2020-06-07";
  };
  macemu = {
    pname = "macemu";
    version = "c4c153c49c6487c2fca3d009b2d9466eda71c5ef";
    src = fetchFromGitHub {
      owner = "kanjitalk755";
      repo = "macemu";
      rev = "c4c153c49c6487c2fca3d009b2d9466eda71c5ef";
      fetchSubmodules = false;
      sha256 = "sha256-fCoyQzw+uBT+NnUeRXaXQsh0MDBRMYL+GvDwl5JB9pw=";
    };
    date = "2023-05-16";
  };
  raze = {
    pname = "raze";
    version = "1.7.1";
    src = fetchFromGitHub {
      owner = "ZDoom";
      repo = "Raze";
      rev = "1.7.1";
      fetchSubmodules = false;
      sha256 = "sha256-8e8F18kYLmEvQF0ZSpgih8hMYfcaZ0otrh26rkju9b4=";
    };
  };
  sheepshaver-bin = {
    pname = "sheepshaver-bin";
    version = "2023-05-11";
    src = fetchurl {
      url = "https://github.com/Korkman/macemu-appimage-builder/releases/download/2023-05-11/SheepShaver-x86_64.AppImage";
      sha256 = "sha256-0sNY1yu5jJEcm+yK2yaUQ9mPyWnSvdVjDSolGZ93cjU=";
    };
  };
  slock-flexipatch = {
    pname = "slock-flexipatch";
    version = "780a7887a3b976a48786f991d55fc8a474e76a25";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "slock-flexipatch";
      rev = "780a7887a3b976a48786f991d55fc8a474e76a25";
      fetchSubmodules = false;
      sha256 = "sha256-3jzEXIaH6qZkbvumlYqPSW1kDjg8obDMVoj6y3Vhe4I=";
    };
    date = "2022-10-06";
  };
  st-flexipatch = {
    pname = "st-flexipatch";
    version = "1343b29ee5e8a9d67607a4616f74386a2951e276";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "st-flexipatch";
      rev = "1343b29ee5e8a9d67607a4616f74386a2951e276";
      fetchSubmodules = false;
      sha256 = "sha256-cZcoBkgcG+MXVSmjupdmhEQv7j54rANbmMso6XnatEw=";
    };
    date = "2023-04-07";
  };
  taffybar = {
    pname = "taffybar";
    version = "fe00eb2d8cf53b1eb329b86be92d890e3ac8e234";
    src = fetchFromGitHub {
      owner = "taffybar";
      repo = "taffybar";
      rev = "fe00eb2d8cf53b1eb329b86be92d890e3ac8e234";
      fetchSubmodules = false;
      sha256 = "sha256-sP7ExY/6KwtfjETK12KoCZnN1tL8RxoETNqgLWjYTUA=";
    };
    date = "2023-05-21";
  };
  tailwindcss-intellisense = {
    pname = "tailwindcss-intellisense";
    version = "53b81ca46001486d1622d7a71828460af2160f2c";
    src = fetchFromGitHub {
      owner = "tailwindlabs";
      repo = "tailwindcss-intellisense";
      rev = "53b81ca46001486d1622d7a71828460af2160f2c";
      fetchSubmodules = false;
      sha256 = "sha256-QSxe47cTm53donBP3jI+7sh/YbY63qAynJa9ybA+5zg=";
    };
    date = "2023-05-25";
  };
  xmonad-entryhelper = {
    pname = "xmonad-entryhelper";
    version = "ee2d0c14f9258503d7bd62907aa731dd64fa34d0";
    src = fetchFromGitHub {
      owner = "Javran";
      repo = "xmonad-entryhelper";
      rev = "ee2d0c14f9258503d7bd62907aa731dd64fa34d0";
      fetchSubmodules = false;
      sha256 = "sha256-CGaibR0Yejng9IQInm92Zx0pEZS29tJjWvPgaiWgUNQ=";
    };
    date = "2022-05-18";
  };
  zix = {
    pname = "zix";
    version = "a13ae5ad9dc70075740f11139f1db96cc79faa59";
    src = fetchFromGitHub {
      owner = "drobilla";
      repo = "zix";
      rev = "a13ae5ad9dc70075740f11139f1db96cc79faa59";
      fetchSubmodules = false;
      sha256 = "sha256-1L8efvVohGRkAwn8xVuzffYRcB7rkjCB+7i08ClaXto=";
    };
    date = "2023-05-15";
  };
  zmusic = {
    pname = "zmusic";
    version = "1.1.3";
    src = fetchFromGitHub {
      owner = "ZDoom";
      repo = "ZMusic";
      rev = "1.1.3";
      fetchSubmodules = false;
      sha256 = "sha256-wrNWfTIbNU/S2qFObUSkb6qyaceh+Y7Loxqudl86+W4=";
    };
  };
  zrythm = {
    pname = "zrythm";
    version = "5ea4e3c382a714793bb36087104b4951fd081f0d";
    src = fetchgit {
      url = "https://git.sr.ht/~alextee/zrythm";
      rev = "5ea4e3c382a714793bb36087104b4951fd081f0d";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-p0aejv7sufYvnkLupFV89DSsmrUiqdmKeEyP0sOLqUs=";
    };
    date = "2023-05-19";
  };
}
