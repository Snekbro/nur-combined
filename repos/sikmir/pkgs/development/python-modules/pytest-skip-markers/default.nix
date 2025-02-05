{ lib, fetchFromGitHub, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "pytest-skip-markers";
  version = "1.5.0";
  pyproject = true;
  disabled = python3Packages.pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "saltstack";
    repo = "pytest-skip-markers";
    rev = version;
    hash = "sha256-P9O1kD7fnZmtdzQObHlHzrBmBFwq/RPzRFhvGScxFNE=";
  };

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  nativeBuildInputs = with python3Packages; [ setuptools-scm setuptools-declarative-requirements ];

  propagatedBuildInputs = with python3Packages; [ distro ];

  doCheck = false;

  meta = with lib; {
    description = "A Pytest plugin which implements a few useful skip markers";
    inherit (src.meta) homepage;
    license = licenses.asl20;
    maintainers = [ maintainers.sikmir ];
  };
}
