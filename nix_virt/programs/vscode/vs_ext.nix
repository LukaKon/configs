{config, pkgs, lib, ...}:

let
  extensions = (with pkgs.vscode-extensions; [
      bbenoist.Nix
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
            name = "cpptools";
            publisher = "ms-vscode";
            version = "1.1.3";
            sha256 = "02kx7yv3n22cja8pxnj0i03c4jx4v55iykcgbwxh37vknv8zv376";
        }];
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
      vscodeExtensions = extensions;
    };
in
  environment.systemPackages = [
    vscode-with-extensions
  ];