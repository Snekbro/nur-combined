{ lib, stdenv, buildGoModule, fetchFromSourcehut, scdoc }:

buildGoModule rec {
  pname = "gemini-ipfs-gateway";
  version = "2023-10-19";

  src = fetchFromSourcehut {
    owner = "~hsanjuan";
    repo = "gemini-ipfs-gateway";
    rev = "f32f60780077627c552394cab92763779575e55c";
    hash = "sha256-44CLnlmfQQqw73Oy+GQ9525HZv+hx6IM/DrBgtEaaVg=";
  };

  vendorHash = "sha256-Y7Hm5QbUMz+T68wlTlx5zMjJIQXOe2zhYQZc41Dwjb8=";

  meta = with lib; {
    description = "IPFS access over the Gemini protocol";
    inherit (src.meta) homepage;
    license = licenses.agpl3Only;
    maintainers = [ maintainers.sikmir ];
  };
}
