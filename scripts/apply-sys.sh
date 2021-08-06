#!/bin/sh
pushd ~/configs
sudo nixos-rebuild switch -I nixos-config=./nix/configurations.nix
popd