# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  dmenu-flexipatch = {
    pname = "dmenu-flexipatch";
    version = "0d6d5ac5cc81016b0cd3588b94aa76623dec84de";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dmenu-flexipatch";
      rev = "0d6d5ac5cc81016b0cd3588b94aa76623dec84de";
      fetchSubmodules = false;
      sha256 = "sha256-RvP4vm+7ALYJsz95iuR5sLbxYwqO2Lq+YsmVh8w9R2s=";
    };
    date = "2023-12-13";
  };
  dwm-flexipatch = {
    pname = "dwm-flexipatch";
    version = "5a0c5e617f4854e5fb64884d15d6f584c8f72b81";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dwm-flexipatch";
      rev = "5a0c5e617f4854e5fb64884d15d6f584c8f72b81";
      fetchSubmodules = false;
      sha256 = "sha256-dFiGhkTVoktI4XqwhHEHnFVnDGbyhSvJ6QWZWTjROu4=";
    };
    date = "2023-12-22";
  };
  slock-flexipatch = {
    pname = "slock-flexipatch";
    version = "316de8856f9f25685f6f1c4e94dbf76e4f64c06b";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "slock-flexipatch";
      rev = "316de8856f9f25685f6f1c4e94dbf76e4f64c06b";
      fetchSubmodules = false;
      sha256 = "sha256-jsAfkd2Xtzp4zKwY0bExPhVtcs+OeBdGJA29SPC04jk=";
    };
    date = "2023-10-06";
  };
  st-flexipatch = {
    pname = "st-flexipatch";
    version = "76cb5801f6b94a56dc144fe8d00b9282fa32a43e";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "st-flexipatch";
      rev = "76cb5801f6b94a56dc144fe8d00b9282fa32a43e";
      fetchSubmodules = false;
      sha256 = "sha256-SpWszzuw5WkAAYdL1hSGG0ymWZcHZuqNoKDYjSSvjEs=";
    };
    date = "2023-12-12";
  };
}
