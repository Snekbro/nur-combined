# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  bling = {
    pname = "bling";
    version = "677917056d118d02feaa5c21ecf5a50375ef123d";
    src = fetchFromGitHub {
      owner = "blingcorp";
      repo = "bling";
      rev = "677917056d118d02feaa5c21ecf5a50375ef123d";
      fetchSubmodules = false;
      sha256 = "sha256-V3ZAWhDH2b1n3G3ZMpH1k9yZFQm1wsAfAX4+eKciOKk=";
    };
    date = "2023-03-07";
  };
  cardinal = {
    pname = "cardinal";
    version = "e2ed1e02d252759aa1949bc4fe4ed3e99ef409b8";
    src = fetchFromGitHub {
      owner = "DISTRHO";
      repo = "Cardinal";
      rev = "e2ed1e02d252759aa1949bc4fe4ed3e99ef409b8";
      fetchSubmodules = true;
      sha256 = "sha256-4oZVQrrobQiOX71Yr+0ZZRfElerPumo/rkRek7gVx88=";
    };
    date = "2023-03-19";
  };
  carla = {
    pname = "carla";
    version = "6cdd0e71a33bd22aacbe5890f17dcdf14606bd68";
    src = fetchFromGitHub {
      owner = "falkTX";
      repo = "Carla";
      rev = "6cdd0e71a33bd22aacbe5890f17dcdf14606bd68";
      fetchSubmodules = false;
      sha256 = "sha256-GpvgehXdqrroRwJ+3YJ4ZMIeIMUWdE/RV2+CPw55+yM=";
    };
    date = "2023-03-19";
  };
  dmenu-flexipatch = {
    pname = "dmenu-flexipatch";
    version = "05f5efc5e544fdb8e7744eb79a6a5d6f882b4d4c";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dmenu-flexipatch";
      rev = "05f5efc5e544fdb8e7744eb79a6a5d6f882b4d4c";
      fetchSubmodules = false;
      sha256 = "sha256-6hGunum5+IBSpxJPvEOAgNmCkDNbm3R++RSTg8TL8Vo=";
    };
    date = "2022-10-26";
  };
  dpf-plugins = {
    pname = "dpf-plugins";
    version = "v1.6";
    src = fetchFromGitHub {
      owner = "DISTRHO";
      repo = "DPF-Plugins";
      rev = "v1.6";
      fetchSubmodules = false;
      sha256 = "sha256-sdsOfEsLHiAZxq8lGVWOTi+0p2FBeeLzbX3OOTgj7QQ=";
    };
  };
  dwm-flexipatch = {
    pname = "dwm-flexipatch";
    version = "fcbe686ff250849b00da2479baf71dedc3cb0f07";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dwm-flexipatch";
      rev = "fcbe686ff250849b00da2479baf71dedc3cb0f07";
      fetchSubmodules = false;
      sha256 = "sha256-VH3+FO2SKTdjnf0InJUBLsEJj+WiZa0Stjl+MlpFKjQ=";
    };
    date = "2023-02-18";
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
    version = "b6f33ff1d741597c74923bb7253d72db5cab89f3";
    src = fetchFromGitHub {
      owner = "DISTRHO";
      repo = "Ildaeil";
      rev = "b6f33ff1d741597c74923bb7253d72db5cab89f3";
      fetchSubmodules = true;
      sha256 = "sha256-CJUQhveFml21cXDxfTNhPk5p7P7CYUwf5gI9PpZ0M7s=";
    };
    date = "2023-03-05";
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
    version = "97772cb718b2102047b2e0078564afe1c58cef0b";
    src = fetchFromGitHub {
      owner = "kmonad";
      repo = "kmonad";
      rev = "97772cb718b2102047b2e0078564afe1c58cef0b";
      fetchSubmodules = false;
      sha256 = "sha256-puBjZbIB9+D+jKraSay/uofDJTaBI9bGLF6Bxg9YIJw=";
    };
    date = "2023-03-25";
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
  raze = {
    pname = "raze";
    version = "1.6.2";
    src = fetchFromGitHub {
      owner = "ZDoom";
      repo = "Raze";
      rev = "1.6.2";
      fetchSubmodules = false;
      sha256 = "sha256-5EXU7mXhg9gvNvz13OCvzJHMb4VArYQj/6rTmzDK6uY=";
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
    version = "a8e2af0d923e7b6f7b19e8fa516bcd0670dfae84";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "st-flexipatch";
      rev = "a8e2af0d923e7b6f7b19e8fa516bcd0670dfae84";
      fetchSubmodules = false;
      sha256 = "sha256-cYaHI19ctmfPSNr4UgT7p1GSEVMKZUlHJ4Gn33A0KR8=";
    };
    date = "2023-01-09";
  };
  taffybar = {
    pname = "taffybar";
    version = "5d1685f87ecbf283119110d002813d82f74342ea";
    src = fetchFromGitHub {
      owner = "taffybar";
      repo = "taffybar";
      rev = "5d1685f87ecbf283119110d002813d82f74342ea";
      fetchSubmodules = false;
      sha256 = "sha256-etRsa9KqU4xNLJ6DYWh6/vKtc9tAX7yGpQbc0SROeo8=";
    };
    date = "2023-03-11";
  };
  tailwindcss-intellisense = {
    pname = "tailwindcss-intellisense";
    version = "89dd1044190e1b713c8108d50d0a2fe99a0f8760";
    src = fetchFromGitHub {
      owner = "tailwindlabs";
      repo = "tailwindcss-intellisense";
      rev = "89dd1044190e1b713c8108d50d0a2fe99a0f8760";
      fetchSubmodules = false;
      sha256 = "sha256-QlFW3IP9TpfzM9oSmIgwm9U3YTEfruhythu9tFHthTQ=";
    };
    date = "2023-03-20";
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
    version = "262d4a1522c38be0588746e874159da5c7bb457d";
    src = fetchFromGitHub {
      owner = "drobilla";
      repo = "zix";
      rev = "262d4a1522c38be0588746e874159da5c7bb457d";
      fetchSubmodules = false;
      sha256 = "sha256-3vuefgnirM4ksK3j9sjBHgOmx0JpL+6tCPb69/7jI00=";
    };
    date = "2023-02-13";
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
    version = "c8e28cee5a746d5d24bb05f9c7e06ba608202861";
    src = fetchgit {
      url = "https://git.sr.ht/~alextee/zrythm";
      rev = "c8e28cee5a746d5d24bb05f9c7e06ba608202861";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-20nrVNrnkQjqWf/LCuxjKvE2dp6WZIaY4CFIpKsKBBg=";
    };
    date = "2023-03-21";
  };
}
