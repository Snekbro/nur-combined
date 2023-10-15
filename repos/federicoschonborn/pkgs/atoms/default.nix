{ lib
, python3Packages
, fetchFromGitHub
, desktop-file-utils
, atoms-core
, gettext
, glib
, gtk4
, meson
, ninja
, pkg-config
, vte-gtk4
, wrapGAppsHook4
}:

python3Packages.buildPythonApplication rec {
  pname = "atoms";
  version = "1.1.2";

  format = "other";

  src = fetchFromGitHub {
    owner = "AtomsDevs";
    repo = "Atoms";
    rev = version;
    hash = "sha256-FRXHhCSstJzGnqxvSQwZojiF8sSiR8lgGX3oOS03JDs=";
  };

  nativeBuildInputs = [
    desktop-file-utils
    gettext
    glib # glib-compile-schemas
    gtk4 # gtk4-update-icon-cache
    meson
    ninja
    pkg-config
    wrapGAppsHook4
  ];

  propagatedBuildInputs = [
    atoms-core
  ] ++ (with python3Packages; [
    pygobject3
    requests
    orjson
  ]);

  dontWrapGApps = true;
  preFixup = ''
    makeWrapperArgs+=(
      "''${gappsWrapperArgs[@]}"
      --prefix GI_TYPELIB_PATH : "${lib.makeSearchPath "lib/girepository-1.0" [vte-gtk4]}"
    )
  '';

  meta = {
    description = "Easily manage Linux Chroot(s) and Containers with Atoms";
    homepage = "https://github.com/AtomsDevs/Atoms";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ federicoschonborn ];
  };
}
