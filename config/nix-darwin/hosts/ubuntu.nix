{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.kacperlipka = {
    isNormalUser = true;
    home = "/home/kacperlipka";
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.bashInteractive;
  };

  services.openssh.enable = true;

  system.stateVersion = "24.05";

  home-manager.users.kacperlipka = import ../home/home.nix;
}

