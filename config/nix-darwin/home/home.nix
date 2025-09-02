{ config, pkgs, ... }: {
  home.homeDirectory = "/Users/kacperlipka";
  home.stateVersion = "24.05";

  # Packages are installed per user
  home.packages = with pkgs; [
    fd
    neovim
    fzf
    nodejs_24
    ripgrep
    lazygit
    kubectl
    argocd
    kubernetes-helm
    tmux
    starship
    docker
    terraform
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''eval "$(starship init bash)"'';
    shellAliases = {
      ll = "ls -lh";
      la = "ls -lha";
      g = "git";
      k = "kubectl";
    };
  };

  programs.starship.enable = true;

  programs.git = {
    enable = true;
    userName = "Kacper Lipka";
    userEmail = "kacper@example.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}

