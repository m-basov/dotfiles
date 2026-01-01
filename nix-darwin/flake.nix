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
        [ pkgs.ast-grep
          pkgs.direnv
          pkgs.fd
          pkgs.fzf
          pkgs.git
          pkgs.inconsolata
          pkgs.oh-my-posh
          pkgs.ripgrep
          pkgs.stow
          pkgs.zinit
          # go
          pkgs.go
          pkgs.gopls
          # rust
          pkgs.rustc
          pkgs.rustfmt
          pkgs.cargo
          pkgs.rust-analyzer
          # zig
          pkgs.zig
          pkgs.zls
          # nvim
          pkgs.neovim
          pkgs.lua-language-server
          pkgs.stylua
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
          eval "$(direnv hook zsh)"
        '';
        variables = {
          EDITOR = "nvim";
        };
      };

      fonts.packages = [
        pkgs.inconsolata
      ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
        ];
        casks = [
          "alfred"
          "ungoogled-chromium"
          "discord"
          "ghostty"
          "obsidian"
          "orcaslicer"
          "proton-drive"
          "proton-mail-bridge"
          "proton-pass"
          "signal"
          "qobuz"
          "vlc"
        ];
        masApps = {
          "Proton Pass for Safari" = 6502835663;
          "uBlock Origin Lite" = 6745342698;
          "Xcode" = 497799835;
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
