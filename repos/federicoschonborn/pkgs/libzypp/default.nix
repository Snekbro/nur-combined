{ lib
, stdenv
, fetchFromGitHub
, asciidoctor
, boost
, cmake
, ninja
, curl
, doxygen
, fcgi
, gettext
, gpgme
, graphviz
, libproxy
, libsigcxx
, libsolv
, libxml2
, nginx
, pcre2
, pkg-config
, protobuf
, readline
, rpm
, systemd
, yaml-cpp
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libzypp";
  version = "17.31.22";

  src = fetchFromGitHub {
    owner = "openSUSE";
    repo = "libzypp";
    rev = finalAttrs.version;
    hash = "sha256-jVS4dagkRfppQnlRjtBO90ybNVxgVW9fbevQf2ShLAU=";
  };

  patches = [
    ./libdir.patch
  ];

  nativeBuildInputs = [
    asciidoctor
    cmake
    doxygen
    gettext
    graphviz
    ninja
    nginx # asciidoctor requires this ???
    pkg-config
  ];

  buildInputs = [
    boost
    curl
    fcgi # for nginx
    gpgme
    libproxy
    libsigcxx
    libsolv
    libxml2
    pcre2
    protobuf
    readline
    rpm
    systemd
    yaml-cpp
  ];

  cmakeFlags = [
    "-DCMAKE_MODULE_PATH=${libsolv}/share/cmake/Modules"
  ];

  meta = {
    description = "ZYpp Package Management library";
    homepage = "https://github.com/openSUSE/libzypp";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ federicoschonborn ];
  };
})
