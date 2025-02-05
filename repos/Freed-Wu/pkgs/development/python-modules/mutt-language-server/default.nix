{ mySources
, python3
, lib
}:

with python3.pkgs;

buildPythonPackage rec {
  inherit (mySources.mutt-language-server) pname version src;
  format = "pyproject";
  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [
    pygls
    platformdirs
  ];
  nativeBuildInputs = [
    setuptools-generate
    setuptools-scm
  ];
  pythonImportsCheck = [
    "mutt_language_server"
  ];

  meta = with lib; {
    homepage = "https://mutt-language-server.readthedocs.io";
    description = "mutt/neomutt's language server";
    license = licenses.gpl3;
    maintainers = with maintainers; [ Freed-Wu ];
    platforms = platforms.unix;
  };
}
