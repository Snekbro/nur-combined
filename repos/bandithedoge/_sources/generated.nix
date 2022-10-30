# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
}: {
  bling = {
    pname = "bling";
    version = "70c894e58bb88dea55e9799ad373fdaea309da9e";
    src = fetchFromGitHub {
      owner = "blingcorp";
      repo = "bling";
      rev = "70c894e58bb88dea55e9799ad373fdaea309da9e";
      fetchSubmodules = false;
      sha256 = "sha256-sUUMgdAmXAB/2ocwoo2OTZlWRbSRLdKi1oZB20qRNWU=";
    };
    date = "2022-07-23";
  };
  cardinal = {
    pname = "cardinal";
    version = "c368317009567ca4c1d1d50081524632605011ce";
    src = fetchFromGitHub {
      owner = "DISTRHO";
      repo = "Cardinal";
      rev = "c368317009567ca4c1d1d50081524632605011ce";
      fetchSubmodules = true;
      sha256 = "sha256-LVqu9iasHYsJqUopHqj0KmfX0gY996OLwin88x+n6No=";
    };
    date = "2022-10-28";
  };
  carla = {
    pname = "carla";
    version = "3c10dcee953fb2af12eebac5578bc64f266ee0ec";
    src = fetchFromGitHub {
      owner = "falkTX";
      repo = "Carla";
      rev = "3c10dcee953fb2af12eebac5578bc64f266ee0ec";
      fetchSubmodules = false;
      sha256 = "sha256-kvIFMOOVMhxRoAEqEVDuhqibMtVVknBOxclEffKX2TE=";
    };
    date = "2022-10-24";
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
  dwm-flexipatch = {
    pname = "dwm-flexipatch";
    version = "e6a74ad3ea480ff7262af104db440d6bda0ab5ab";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dwm-flexipatch";
      rev = "e6a74ad3ea480ff7262af104db440d6bda0ab5ab";
      fetchSubmodules = false;
      sha256 = "sha256-6ZiOIRDP5BuF+gLoxenGhtVDk4hWZcJDYfgnxhG8YiQ=";
    };
    date = "2022-10-16";
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
    version = "e9c7693f387835bdf2d1ada85c2ba0b813686ebb";
    src = fetchFromGitHub {
      owner = "luakit";
      repo = "luakit";
      rev = "e9c7693f387835bdf2d1ada85c2ba0b813686ebb";
      fetchSubmodules = false;
      sha256 = "sha256-rN9yBWCBzLp6l2x0DMXL4VBfaHbMXJAEnzC8Cp5Y5ew=";
    };
    date = "2022-10-05";
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
    version = "1.5.0";
    src = fetchFromGitHub {
      owner = "ZDoom";
      repo = "Raze";
      rev = "1.5.0";
      fetchSubmodules = false;
      sha256 = "sha256-b7RFC90v5Kj2rTWdil2A8OLF6wicA08X87uS6nb4l5c=";
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
    version = "e6a2fb489c192e2cd9439691014f48779d4966ad";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "st-flexipatch";
      rev = "e6a2fb489c192e2cd9439691014f48779d4966ad";
      fetchSubmodules = false;
      sha256 = "sha256-DCsuRbJJbU2Ii4vnOyd1o21VqiXvo2Dz7PKOsDizvCc=";
    };
    date = "2022-10-25";
  };
  taffybar = {
    pname = "taffybar";
    version = "8050417e576e6b5b6825132577a9d046efdd6b04";
    src = fetchFromGitHub {
      owner = "taffybar";
      repo = "taffybar";
      rev = "8050417e576e6b5b6825132577a9d046efdd6b04";
      fetchSubmodules = false;
      sha256 = "sha256-ekXdAPf37WKejPeINjYCx6z74UCbVi8rCRLQnq113HM=";
    };
    date = "2022-10-26";
  };
  tailwindcss-intellisense = {
    pname = "tailwindcss-intellisense";
    version = "13e4ccee2d97e8e4a34b3e59b77f2780844f4737";
    src = fetchFromGitHub {
      owner = "tailwindlabs";
      repo = "tailwindcss-intellisense";
      rev = "13e4ccee2d97e8e4a34b3e59b77f2780844f4737";
      fetchSubmodules = false;
      sha256 = "sha256-H5aEbNxJN46fuv3XuqaYqMwtYtsBjZsrjiRmZ0QLRiQ=";
    };
    date = "2022-10-21";
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
    version = "67613373ec117e648d4554458cf2e9d54b9eba00";
    src = fetchFromGitHub {
      owner = "drobilla";
      repo = "zix";
      rev = "67613373ec117e648d4554458cf2e9d54b9eba00";
      fetchSubmodules = false;
      sha256 = "sha256-qoUYG6Dybg6PPx4Mm+qqENP0D41L8+UyjBFHRYxrm2g=";
    };
    date = "2022-10-26";
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
    version = "948b08f7bf021ba24921ee44e132876fa53fd7c4";
    src = fetchgit {
      url = "https://git.sr.ht/~alextee/zrythm";
      rev = "948b08f7bf021ba24921ee44e132876fa53fd7c4";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-+JJ6DfAU6B7KuF9IBb/KAyljzo+SBwNG0VZ3vocAv1I=";
    };
    date = "2022-10-29";
  };
}
