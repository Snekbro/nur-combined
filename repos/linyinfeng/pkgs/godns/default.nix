{ stdenv, lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "godns";
  version = "2.3.4";

  src = fetchFromGitHub {
    owner = "TimothyYe";
    repo = pname;
    rev = "V${version}";
    sha256 = "sha256-AQQQFLeNntpeQquzrZJlxTzJ2L26LCglda5f3v/C0Yo=";
  };

  vendorSha256 = "sha256-R0kUBmpEgA4ZhCEE7TUN6yAS8bBrEF3ADCVG3rIO9h4=";

  doCheck = false;

  buildFlagsArray = [
    "-ldflags="
    "-X main.Version=${version}"
  ];

  meta = with lib; {
    description = "A dynamic DNS client tool supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS & DreamHost, etc, written in Go.";
    homepage = "https://github.com/TimothyYe/godns";
    license = licenses.asl20;
  };
}
