{ pkgs, ... }: {
  nix.settings.experimental-features = "nix-command flakes";

  users.users.kacperlipka = {
    home = "/Users/kacperlipka";
    shell = pkgs.bashInteractive;
  };

  programs.bash.enable = true;
  environment.shells = [ pkgs.bashInteractive ];

  system.stateVersion = 6;

  home-manager.users.kacperlipka = import ../home/home.nix;
}

