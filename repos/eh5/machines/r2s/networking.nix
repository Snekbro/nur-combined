{ config, pkgs, lib, ... }:
{
  boot.kernelModules = [ "tcp_bbr" ];
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "cake";
    "net.core.somaxconn" = 8192;
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_keepalive_time" = 60;
    "net.ipv4.tcp_keepalive_intvl" = 10;
    "net.ipv4.tcp_keepalive_probes" = 6;
    "net.ipv4.tcp_mtu_probing" = true;

    # tcp pending
    "net.ipv4.tcp_max_syn_backlog" = 8192;
    "net.ipv4.tcp_max_tw_buckets" = 2000000;
    "net.ipv4.tcp_tw_reuse" = true;
    "net.ipv4.tcp_fin_timeout" = 10;
    "net.ipv4.tcp_slow_start_after_idle" = false;

    # net mem
    "net.core.rmem_default" = 1048576;
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_default" = 1048576;
    "net.core.wmem_max" = 16777216;
    "net.core.optmem_max" = 65536;
    "net.ipv4.tcp_rmem" = "4096 1048576 2097152";
    "net.ipv4.tcp_wmem" = "4096 65536 16777216";
    "net.ipv4.udp_rmem_min" = 8192;
    "net.ipv4.udp_wmem_min" = 8192;

    "net.ipv4.ip_forward" = true;
    "net.ipv6.conf.all.forwarding" = true;
    "net.ipv6.conf.default.forwarding" = true;
    "net.ipv4.conf.all.rp_filter" = false;
    "net.ipv4.conf.default.rp_filter" = false;
  };

  # required to set hostname, see <https://github.com/systemd/systemd/issues/16656>
  security.polkit.enable = true;

  networking.useNetworkd = false;
  networking.useDHCP = false;
  networking.dhcpcd.enable = false;
  networking.firewall.enable = false;

  systemd.network.enable = true;

  systemd.network.links."10-intern0" = {
    matchConfig.Path = "platform-ff540000.ethernet";
    linkConfig = {
      Name = "intern0";
      MACAddress = "fe:1b:f3:16:82:a6";
    };
  };

  systemd.network.links."10-extern0" = {
    matchConfig.Path = "platform-xhci-hcd.0.auto-usb-0:1:1.0";
    linkConfig = {
      Name = "extern0";
      MACAddress = "ea:ce:b4:a1:ce:94";
    };
  };

  systemd.network.networks."11-intern0" = {
    name = "intern0";
    networkConfig = {
      Address = "192.168.1.1/24";
      ConfigureWithoutCarrier = true;
      # DHCPServer = true;
      IPv6SendRA = true;
      DHCPPrefixDelegation = true;
    };
    # dhcpServerConfig = {
    #   PoolOffset = 2;
    #   DefaultLeaseTimeSec = "12h";
    #   MaxLeaseTimeSec = "24h";
    #   UplinkInterface = "extern0";
    #   DNS = [ "_server_address" ];
    # };
    dhcpPrefixDelegationConfig = {
      UplinkInterface = "extern0";
      Token = "static:::1";
    };
    ipv6SendRAConfig = {
      EmitDNS = true;
      DNS = [ "_link_local" ];
    };
    linkConfig.ActivationPolicy = "always-up";
  };

  systemd.network.networks."11-extern0" = {
    name = "extern0";
    networkConfig = {
      Address = "192.168.4.16/24";
      ConfigureWithoutCarrier = true;
      DHCP = "yes";
    };
    dhcpV4Config = {
      SendHostname = true;
    };
    dhcpV6Config = {
      WithoutRA = "solicit";
      PrefixDelegationHint = "::/64";
      # use SLAAC addresses only
      UseAddress = false;
    };
    linkConfig.ActivationPolicy = "always-up";
  };

  ## Uncoment after https://github.com/SagerNet/sing-tun/pull/16 being merged
  #
  # systemd.network.netdevs."tun0" = {
  #   netdevConfig = {
  #     Name = "tun0";
  #     Kind = "tun";
  #   };
  # };
  systemd.network.networks."tun0" = {
    matchConfig.Name = "tun0";
    networkConfig = {
      Address = "198.18.0.1/15";
      ConfigureWithoutCarrier = true;
    };
    routes = [{
      routeConfig = {
        Destination = "0.0.0.0/0";
        Metric = 1;
        Table = 200;
      };
    }];
    routingPolicyRules = [{
      routingPolicyRuleConfig = {
        FirewallMark = 10;
        Table = 200;
      };
    }];
  };
}
