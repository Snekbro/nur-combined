{ stdenv, fetchFromGitHub, gawk, icon-lang ? null }:

let noweb = stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  version = "2.12";
  pname = "noweb";
  tlType = "run";

  src = fetchFromGitHub {
    owner = "nrnrnr";
    repo = "noweb";
    rev = "v${builtins.replaceStrings ["."] ["_"] version}";
    sha256 = "1160i2ghgzqvnb44kgwd6s3p4jnk9668rmc15jlcwl7pdf3xqm95";
  };

  outputs = [ "out" "tex" ];

  nativeBuildInputs = stdenv.lib.optionals (icon-lang != null) [ icon-lang ];

  preBuild = ''
    mkdir -p "$out/lib/noweb"
    cd src
  '';

  makeFlags = stdenv.lib.optionals (icon-lang != null) [
    "LIBSRC=icon"
    "ICONC=icont"
  ];

  installFlags = [
    "BIN=$(out)/bin"
    "ELISP=$(out)/share/emacs/site-lisp"
    "LIB=$(out)/lib/noweb"
    "MAN=$(out)/share/man"
    "TEXINPUTS=$(tex)/tex/latex/noweb"
  ];

  preInstall = ''
    mkdir -p "$tex/tex/latex/noweb"
  '';

  postInstall = ''
    substituteInPlace "$out/bin/cpif" --replace "PATH=/bin:/usr/bin" ""

    for f in $out/bin/no{index,roff,roots,untangle,web} \
             $out/lib/noweb/to{ascii,html,roff,tex} \
             $out/lib/noweb/{bt,empty}defn \
             $out/lib/noweb/{noidx,unmarkup}; do
        # NOTE: substituteInPlace breaks Icon binaries, so make sure the script
        #       uses (n)awk before calling.
        if [ grep nawk "$f"]; then
            substituteInPlace "$f" --replace "nawk" "${gawk}/bin/awk"
        fi
    done

    ln -s "$tex" "$out/share/texmf"
  '';

  patches = [ ./no-FAQ.patch ];

  meta = with stdenv.lib; {
    description = "A simple, extensible literate-programming tool";
    homepage = https://www.cs.tufts.edu/~nr/noweb;
    license = licenses.bsd2;
    maintainers = with maintainers; [ yurrriq ];
    platforms = with platforms; linux ++ darwin;
  };
}; in noweb // { pkgs = [ noweb.tex ]; }
