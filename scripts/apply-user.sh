#!/bin/sh
pushd ~/configs
nix build .#homeManagerConfigurations.lk.activationPackage
./result/activate
popd