{ mySources
, python3
, lib
}:

with python3.pkgs;

buildPythonPackage rec {
  inherit (mySources.bitbake-language-server) pname version src;
  format = "pyproject";
  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [
    pygls
    platformdirs
    tree-sitter
  ];
  nativeBuildInputs = [
    scikit-build-core
    cmake
    ninja
  ];
  pythonImportsCheck = [
    "bitbake_language_server"
  ];

  meta = with lib; {
    homepage = "https://bitbake-language-server.readthedocs.io";
    description = "bitbake language server";
    license = licenses.gpl3;
    maintainers = with maintainers; [ Freed-Wu ];
    platforms = platforms.unix;
  };
}
