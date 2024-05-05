
#!/usr/bin/env bash

set -eo pipefail

nix build ".#darwinConfigurations.$(hostname -s).config.system.build.toplevel"
./result/sw/bin/darwin-rebuild switch --flake .