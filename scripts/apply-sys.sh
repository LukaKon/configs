#!/bin/sh
pushd ~/configs
sudo nixos-rebuild switch --flake .#
popd