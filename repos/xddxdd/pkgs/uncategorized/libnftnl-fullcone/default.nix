{
  libnftnl,
  autoreconfHook,
  fetchurl,
  ...
}:
libnftnl.overrideAttrs (old: {
  nativeBuildInputs = (old.nativeBuildInputs or []) ++ [autoreconfHook];
  patches =
    (old.patches or [])
    ++ [
      (fetchurl {
        url = "https://raw.githubusercontent.com/wongsyrone/lede-1/master/package/libs/libnftnl/patches/999-01-libnftnl-add-fullcone-expression-support.patch";
        sha256 = "sha256-il0TS51eQfzUfU6LzG9mmuFZvv5UpRF0YPY21jlsNQE=";
      })
    ];
})
