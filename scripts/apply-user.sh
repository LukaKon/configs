#!/bin/sh
pushd ~/configs
home-manager switch -f ./users/lk/home.nix
popd