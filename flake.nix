{
  description = "Nix flake to manage my personal configuration";

  inputs = {
    # Nix packages
    nixos.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-fork.url = "github:totoroot/nixpkgs/master";

    # Nix hardware tweaks
    nixos-hardware.url = "github:nixos/nixos-hardware";


    # User space configuration, dotfile and package management
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    # Nix User Repository packages
    # Add "nur.nixosModules.nur" to the host modules
    nur.url = "github:nix-community/NUR";

    # Official Hyprland flake
    # Add "hyprland.nixosModules.default" to the host modules
    hyprland = {
      url = "github:vaxerski/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Development environments in seconds
    devenv.url = "github:cachix/devenv/latest";

    # Graphical App Store for Nix/NixOS
    nix-software-center.url = "github:vlinkz/nix-software-center";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
