# tor settings: <https://2019.www.torproject.org/docs/tor-manual.html.en>
{ lib, ... }:
{
  # tor hidden service hostnames aren't deterministic, so persist.
  # might be able to get away with just persisting /var/lib/tor/onion, not sure.
  sane.persist.sys.byStore.plaintext = [
    { user = "tor"; group = "tor"; mode = "0710"; path = "/var/lib/tor"; }
  ];

  # tor: `tor.enable` doesn't start a relay, exit node, proxy, etc. it's minimal.
  # tor.client.enable configures a torsocks proxy, accessible *only* to localhost.
  #   at 127.0.0.1:9050
  services.tor.enable = true;
  services.tor.client.enable = true;

  # in order for services to read /var/lib/tor/onion/*/hostname, they must be able to traverse /var/lib/tor,
  # and /var/lib/tor must have g+x.
  # DataDirectoryGroupReadable causes tor to use g+rx, technically more than we need, but all the files are 600 so it's fine.
  services.tor.settings.DataDirectoryGroupReadable = true;
  # StateDirectoryMode defaults to 0700, and thereby prevents the onion hostnames from being group readable
  systemd.services.tor.serviceConfig.StateDirectoryMode = lib.mkForce "0710";
}
