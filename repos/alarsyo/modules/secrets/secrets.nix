let
  alarsyo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH3rrF3VSWI4n4cpguvlmLAaU3uftuX4AVV/39S/8GO9 alarsyo@thinkpad";
  users = [alarsyo];

  boreal = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAagal1aqZh52wEmgsw7fkCzO41o4Cx+nV4wJGZuX1RP root@boreal";
  hades = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMxw8CtKUPAiPdKDEnuS7UyRrZN5BkUwsy5UPVF8V+lt root@hades";
  hephaestus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA7Cp+n5+huof68QlAoJV8bVf5h5p9kEZFAVpltWopdL root@hephaestus";
  thanatos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8JEAWk/8iSl8fN6/f76JkmVFwtyixTpLol4zSVsnVw root@thanatos";

  machines = [boreal hades hephaestus thanatos];

  all = users ++ machines;
in {
  "gandi/api-key.age".publicKeys = [alarsyo hades];

  "lohr/shared-secret.age".publicKeys = [alarsyo hades];

  "matrix-synapse/secret-config.age".publicKeys = [alarsyo hades];

  "microbin/secret-config.age".publicKeys = [alarsyo hades];

  "miniflux/admin-credentials.age".publicKeys = [alarsyo hades];

  "nextcloud/admin-pass.age".publicKeys = [alarsyo hades];

  "paperless/admin-password.age".publicKeys = [alarsyo hades];
  "paperless/secret-key.age".publicKeys = [alarsyo hades];

  "pleroma/pleroma-config.age".publicKeys = [alarsyo hades];

  "restic-backup/boreal-password.age".publicKeys = [alarsyo boreal];
  "restic-backup/boreal-credentials.age".publicKeys = [alarsyo boreal];
  "restic-backup/hades-password.age".publicKeys = [alarsyo hades];
  "restic-backup/hades-credentials.age".publicKeys = [alarsyo hades];
  "restic-backup/hephaestus-password.age".publicKeys = [alarsyo hephaestus];
  "restic-backup/hephaestus-credentials.age".publicKeys = [alarsyo hephaestus];

  "users/root-hashed-password.age".publicKeys = machines ++ [alarsyo];
  "users/alarsyo-hashed-password.age".publicKeys = machines ++ [alarsyo];
}
