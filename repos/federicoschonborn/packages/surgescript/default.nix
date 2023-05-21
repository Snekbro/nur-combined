{ lib
, stdenv
, fetchFromGitHub
, cmake
, ninja
}:

stdenv.mkDerivation rec {
  pname = "surgescript";
  version = "0.5.6.1";

  src = fetchFromGitHub {
    owner = "alemart";
    repo = "surgescript";
    rev = "v${version}";
    hash = "sha256-0mgfam1zJfDGG558Vo1TysE2ehPD30XCP/j3GMnqN9w=";
  };

  nativeBuildInputs = [
    cmake
    ninja
  ];

  meta = with lib; {
    description = "SurgeScript: a scripting language for games";
    homepage = "https://github.com/alemart/surgescript";
    changelog = "https://github.com/alemart/surgescript/blob/${src.rev}/CHANGES.md";
    license = licenses.asl20;
  };
}
