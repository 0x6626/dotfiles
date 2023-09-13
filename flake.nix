{
  inputs.neovim-flake.url = "github:jordanisaacs/neovim-flake";

  outputs = {
    nixpkgs,
    neovim-flake,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;

    # https://jordanisaacs.github.io/neovim-flake/options.html

    ui = {
      config.vim.theme.name = "dracula-nvim";
      config.vim.theme.enable = true;
    };

    nix = {
      config.vim.languages.nix.enable = true;
      config.vim.languages.nix.extraDiagnostics.enable = true;
      config.vim.languages.nix.format.enable = true;
      config.vim.languages.nix.lsp.enable = true;
      config.vim.languages.nix.treesitter.enable = true;
    };

    go = {
      config.vim.languages.go.enable = true;
      #      config.vim.languages.go.extraDiagnostics.enable = true;
      #      config.vim.languages.go.format.enable = true;
      config.vim.languages.go.lsp.enable = true;
      config.vim.languages.go.treesitter.enable = true;
    };

    lsp = {
      vim.lsp.formatOnSave = true;
    };

    myNeovim = neovim-flake.lib.neovimConfiguration {
      modules = [
        ui
        nix
        go
        lsp
      ];
      inherit pkgs;
    };
  in {
    packages.${system}.neovim = myNeovim;
  };
}
