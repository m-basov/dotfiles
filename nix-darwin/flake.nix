{
  description = "macos dev setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;
      # Other system settings
      system.primaryUser = "mbasov";
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.neovim
          pkgs.stow
          pkgs.fzf
          pkgs.oh-my-posh
          pkgs.git
          pkgs.nodejs_24
          pkgs.inconsolata
          pkgs.nerd-fonts.inconsolata
          pkgs.zinit
          pkgs.ripgrep
          pkgs.fd
          pkgs.lazygit
          pkgs.ast-grep
          # nvim
          pkgs.lua-language-server
          pkgs.stylua
          pkgs.typescript
          pkgs.vtsls
          pkgs.eslint_d
          pkgs.prettierd
        ];

      programs.zsh = {
        enable = true;
        promptInit = "";
        enableGlobalCompInit = false;
        enableBashCompletion = false;
        interactiveShellInit = ''
          source "${pkgs.zinit}/share/zinit/zinit.zsh"
          eval "$(/opt/homebrew/bin/brew shellenv)"
          eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
          eval "$(fzf --zsh)"
        '';
        variables = {
          EDITOR = "nvim";
        };
      };

      fonts.packages = [
        pkgs.inconsolata
        pkgs.nerd-fonts.inconsolata
      ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
        ];
        casks = [
          "1password"
          "alfred"
          "ghostty"
          "orcaslicer"
          "sublime-text"
          "vlc"
        ];
        masApps = {
          "Magnet" = 441258766;
        };
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Mykolas-MacBook-Pro
    darwinConfigurations."Mykolas-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
