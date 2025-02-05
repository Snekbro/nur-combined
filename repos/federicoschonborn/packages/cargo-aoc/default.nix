{ lib
, rustPlatform
, fetchFromGitHub
, openssl
, pkg-config
, nix-update-script
}:

rustPlatform.buildRustPackage rec {
  pname = "cargo-aoc";
  version = "0.3.7";

  src = fetchFromGitHub {
    owner = "gobanos";
    repo = "cargo-aoc";
    rev = version;
    hash = "sha256-k9Lm91+Bk6EC8+KfEXhSs4ki385prZ6Vbs6W+18aZSI=";
  };

  cargoHash = "sha256-DKP9YMbVojK7w5pkX/gok4PG6WUjhqUdvTwSir05d0s=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    mainProgram = "cargo-aoc";
    description = "Cargo Advent of Code Helper";
    longDescription = ''
      cargo-aoc is a simple CLI tool that aims to be a helper for the Advent of Code.

      Implement your solution. Let us handle the rest.
    '';
    homepage = "https://github.com/gobanos/cargo-aoc";
    license = with lib.licenses; [ asl20 mit ];
    maintainers = with lib.maintainers; [ federicoschonborn ];
  };
}
