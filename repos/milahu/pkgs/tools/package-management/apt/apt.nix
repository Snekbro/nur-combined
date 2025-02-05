{ lib
, stdenv
, fetchurl
, bzip2
, cmake
, curl
, db
, docbook_xml_dtd_45
, docbook_xsl
, dpkg
, gnutls
, gtest
, libgcrypt
, libseccomp
, libtasn1
, libxslt
, lz4
, perlPackages
, pkg-config
, triehash
, udev
, xxHash
, xz
, zstd
, withDocs ? true , w3m, doxygen
, withNLS ? true , gettext
}:

stdenv.mkDerivation rec {
  pname = "apt";
  version = "2.7.6";

  src = fetchurl {
    url = "mirror://debian/pool/main/a/apt/apt_${version}.tar.xz";
    hash = "sha256-hoP1Tv8L9U5R4CWzSL0HdND9Q3eZYW9IUSlWzxXAX2c=";
  };

  nativeBuildInputs = [
    cmake
    gtest
    libxslt.bin
    pkg-config
    triehash
  ];

  buildInputs = [
    bzip2
    curl
    db
    dpkg
    gnutls
    libgcrypt
    libseccomp
    libtasn1
    lz4
    perlPackages.perl
    udev
    xxHash
    xz
    zstd
  ] ++ lib.optionals withDocs [
    docbook_xml_dtd_45
    doxygen
    perlPackages.Po4a
    w3m
  ] ++ lib.optionals withNLS [
    gettext
  ];

  cmakeFlags = [
    "-DBERKELEY_INCLUDE_DIRS=${db.dev}/include"
    "-DDOCBOOK_XSL=${docbook_xsl}/share/xml/docbook-xsl"
    "-DGNUTLS_INCLUDE_DIR=${gnutls.dev}/include"
    "-DROOT_GROUP=root"
    "-DUSE_NLS=${if withNLS then "ON" else "OFF"}"
    "-DWITH_DOC=${if withDocs then "ON" else "OFF"}"
  ];

  # dont use /nix/store for these paths
  # dont create these paths: /etc/apt/apt.conf.d ...
  # TODO substituteInPlace with regex? or perl regex?
  # TODO allow to pass multiple paths instead of $out/libexec/apt
  # so we can use more handlers than /libexec/apt/methods/http etc
  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace '"''${CMAKE_INSTALL_FULL_LOCALSTATEDIR}/lib/apt"' '"/var/lib/apt"' \
      --replace '"''${CMAKE_INSTALL_FULL_LOCALSTATEDIR}/cache/apt"' '/var/cache/apt' \
      --replace '"''${CMAKE_INSTALL_FULL_LOCALSTATEDIR}/log/apt"' '/var/log/apt' \
      --replace '"''${CMAKE_INSTALL_FULL_SYSCONFDIR}/apt"' '/etc/apt' \
      --replace '"''${CMAKE_INSTALL_FULL_LIBEXECDIR}/apt"' "$out/libexec/apt" \
      --replace $'  ''${CONF_DIR}/apt.conf.d\n' "" \
      --replace $'  ''${CONF_DIR}/auth.conf.d\n' "" \
      --replace $'  ''${CONF_DIR}/preferences.d\n' "" \
      --replace $'  ''${CONF_DIR}/sources.list.d\n' "" \
      --replace $'  ''${CONF_DIR}/trusted.gpg.d\n' "" \
      --replace $'  ''${CACHE_DIR}/archives/partial\n' "" \
      --replace $'  ''${STATE_DIR}/lists/partial\n' "" \
      --replace $'  ''${STATE_DIR}/mirrors/partial\n' "" \
      --replace $'  ''${STATE_DIR}/periodic\n' "" \
      --replace $'  ''${LOG_DIR}\n' "" \
      --replace $'\n# Create our directories.\ninstall_empty_directories(\n)\n' ""

    substituteInPlace apt-pkg/init.cc \
      --replace \
        'Cnf.CndSet("APT::Sandbox::User", "_apt");' \
        'Cnf.CndSet("APT::Sandbox::User", "nobody");'
  '';

  meta = with lib; {
    homepage = "https://salsa.debian.org/apt-team/apt";
    description = "Command-line package management tools used on Debian-based systems";
    changelog = "https://salsa.debian.org/apt-team/apt/-/raw/${version}/debian/changelog";
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ ];
  };
}
