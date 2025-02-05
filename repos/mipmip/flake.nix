{
  inputs = {

    ## MAIN NIXPKGS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11"; # GNOME 43.2

    nixpkgs-2311.url = "github:NixOS/nixpkgs/nixos-23.11"; # GNOME 45.2
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";


    nixpkgs-inkscape13.url = "github:leiserfg/nixpkgs?ref=staging";

    ## HOME MANAGER
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #home-manager-main.url = "github:nix-community/home-manager";

    ## OTHER
    agenix.url = "github:ryantm/agenix";

    peerix = {
      url = "github:cid-chan/peerix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixified-ai = { url = "github:nixified-ai/flake"; };

  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    nixpkgs-2311,
    peerix,
    unstable,
    nixpkgs-inkscape13,
    agenix,
    nixified-ai
  }:

  let

    pkgsForSystem = system: import nixpkgs {
      overlays = [
        (import ./overlays)
      ];
      inherit system;
      config.allowUnfree = true;
    };

    nixpkgs-inkscape13ForSystem = system: import nixpkgs-inkscape13 {
      inherit system;
      config.allowUnfree = true;
    };

    unstableForSystem = system: import unstable {
      inherit system;
      config.allowUnfree = true;
    };

    peerixPubkeys = " peerix-lego1:UEbvvZ0dbQbFqktNWaeo4hyTIBovOb/3Is/AuzBUNJI= peerix-ojs:6QILJzG+gTv8JlT8AT1ObVB3h+AXxWLQEkOI8ACEGm0= peerix-rodin:GKCOspilVSQTzFLxzzrtLtVAkB9X3Rkrw5qku4E8wkk=";

  in {

    homeConfigurations."pim@rodin" = home-manager.lib.homeManagerConfiguration {
      modules = [
        (import ./home/pim/home-machine-rodin.nix)
      ];

      pkgs = pkgsForSystem "x86_64-linux";
      extraSpecialArgs = {
        username = "pim";
        homedir = "/home/pim";
        withLinny = true;
        isDesktop = true;
        tmuxPrefix = "a";
        unstable = unstableForSystem "x86_64-linux";
      };
    };

    homeConfigurations = {
      "pim@adevintamac" = home-manager.lib.homeManagerConfiguration {
        modules = [ (import ./home/pim/home-machine-adevinta.nix) ];
        pkgs = pkgsForSystem "x86_64-darwin";
        extraSpecialArgs = {
          username = "pim.snel";
          homedir = "/Users/pim.snel";
          withLinny = true;
          isDesktop = true;
          tmuxPrefix = "a";
          unstable = unstableForSystem "x86_64-darwin";
        };
      };

      "pim@lego1" = home-manager.lib.homeManagerConfiguration {
        modules = [ (import ./home/pim/home-machine-lego1.nix) ];
        pkgs = pkgsForSystem "x86_64-linux";
        extraSpecialArgs = {
          username = "pim";
          homedir = "/home/pim";
          withLinny = true;
          isDesktop = true;
          tmuxPrefix = "a";
          unstable = unstableForSystem "x86_64-linux";
        };
      };

      "pim@ojs" = home-manager.lib.homeManagerConfiguration {
        modules = [ (import ./home/pim/home-machine-ojs.nix) ];

        pkgs = pkgsForSystem "x86_64-linux";
        extraSpecialArgs = {
          username = "pim";
          homedir = "/home/pim";
          withLinny = true;
          isDesktop = true;
          tmuxPrefix = "a";
          unstable = unstableForSystem "x86_64-linux";
        };
      };
    };

    nixosConfigurations.rodin = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";
      modules =
        let
          system = "x86_64-linux";

          defaults = { pkgs, ... }: {
            _module.args.unstable = unstableForSystem "x86_64-linux";
            _module.args.nixpkgs-inkscape13 = nixpkgs-inkscape13ForSystem "x86_64-linux";
          };

          agenixBin = {
            environment.systemPackages = [ agenix.packages."${system}".default ];
          };

        in [
          ./hosts/rodin/configuration.nix
          defaults
          peerix.nixosModules.peerix {
              services.peerix = {
                enable = true;
                package = peerix.packages.x86_64-linux.peerix;
                openFirewall = true; # UDP/12304
                privateKeyFile = ./hosts/lego1/peerix-private;
                publicKeyFile =  ./hosts/lego1/peerix-public;
                publicKey = peerixPubkeys;
              };
            }

          agenixBin
          agenix.nixosModules.default
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
          }

  ##          {
  ##              imports = [
  ##                nixified-ai.nixosModules.invokeai
  ##              ];
  ##
  ##              environment.systemPackages = [
  ##                nixified-ai.packages.${system}.invokeai-nvidia
  ##              ];
  ##
  ##  #            services.invokeai = {
  ##  #              enable = false;
  ##  #              host = "0.0.0.0";
  ##  #              nsfwChecker = false;
  ##  #              package = nixified-ai.packages.${system}.invokeai-nvidia;
  ##  #            };
  ##
  ##            }


];
      };


      nixosConfigurations.lego1 = nixpkgs.lib.nixosSystem {

        modules =
          let
            system = "x86_64-linux";
            defaults = { pkgs, ... }: {

              _module.args.unstable = unstableForSystem "x86_64-linux";
              _module.args.nixpkgs-inkscape13 = nixpkgs-inkscape13ForSystem "x86_64-linux";
            };
          in [
            defaults
            ./hosts/lego1/configuration.nix
            peerix.nixosModules.peerix {
              services.peerix = {
                enable = true;
                package = peerix.packages.x86_64-linux.peerix;
                openFirewall = true; # UDP/12304
                privateKeyFile = ./hosts/lego1/peerix-private;
                publicKeyFile =  ./hosts/lego1/peerix-public;
                publicKey = peerixPubkeys;
              };
            }

            { environment.systemPackages = [ agenix.packages."${system}".default ]; }
            agenix.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
            }
          ];
        };

        nixosConfigurations.ojs = nixpkgs.lib.nixosSystem {

          modules =
            let
              system = "x86_64-linux";
              defaults = { pkgs, ... }: {
                _module.args.unstable = unstableForSystem "x86_64-linux";
                _module.args.nixpkgs-inkscape13 = nixpkgs-inkscape13ForSystem "x86_64-linux";
              };
            in [
              defaults
              ./hosts/ojs/configuration.nix
              peerix.nixosModules.peerix {
                services.peerix = {
                  enable = true;
                  package = peerix.packages.x86_64-linux.peerix;
                  openFirewall = true; # UDP/12304
                  privateKeyFile = ./hosts/ojs/peerix-private;
                  publicKeyFile =  ./hosts/ojs/peerix-public;
                  publicKey = peerixPubkeys;
                };
              }

              { environment.systemPackages = [ agenix.packages."${system}".default ]; }
              agenix.nixosModules.default

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
              }
            ];
          };

        nixosConfigurations.grannyos = nixpkgs-2311.lib.nixosSystem {
          modules =
            let
              system = "x86_64-linux";
            in
            [
              {
                nixpkgs.config.pkgs = import nixpkgs-2311 { inherit system; };
              }
              ./hosts/grannyos/configuration.nix
            ];
          };

        nixosConfigurations.billquick = nixpkgs.lib.nixosSystem {

          modules =
            let
              defaults = { pkgs, ... }: {
                _module.args.unstable = unstableForSystem "x86_64-linux";
              };
            in [
              defaults
              ./hosts/billquick/configuration.nix
              .home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
              }
            ];

          };
  };

}
