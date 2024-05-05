#!/usr/bin/env bash

set -eo pipefail

NIX_VERSION=2.3.10

NIX_BIN=~/.nix-profile/bin

function isDarwin() {
    [[ "$(uname -s)" =~ Darwin ]] && return

    false
}

if [[ ! -d ~/.nixpkgs ]]; then
    if ! command -v git > /dev/null; then
        echo "Please install git"
        exit 1
    fi

    echo "🔽 Cloning Nix config to ~/.nix-pkgs..."
    git clone https://github.com/milesbxf/nix-config ~/.nixpkgs
fi
echo "✅ Latest Nix config is installed"

if ! command -v "nix" > /dev/null; then
    nix_install_loc=/tmp/install-nix-${NIX_VERSION}
    echo "⚠️ nix not found; installing nix"

    echo "🔑 importing Nix GPG key"
    gpg2 --keyserver hkp://keys.gnupg.net --recv-keys B541D55301270E0BCF15CA5D8170B4726D7198DE
    echo ""

    curl -s -o "${nix_install_loc}" https://releases.nixos.org/nix/nix-${NIX_VERSION}/install
    curl -s -o "${nix_install_loc}.asc" https://releases.nixos.org/nix/nix-${NIX_VERSION}/install.asc

    echo "👨‍🏫 downloaded Nix installer to ${nix_install_loc}"
    echo ""

    gpg2 --verify "${nix_install_loc}".asc
    echo ""
    echo "✅ verified download with GPG key; running install"

    nix_install_args="--no-daemon"

    if isDarwin; then
        nix_install_args="${nix_install_args} --darwin-use-unencrypted-nix-store-volume"
    fi

    sh "${nix_install_loc}" ${nix_install_args}
fi

echo "✅ Nix is installed"

echo "Running initial build"
nix build ".#darwinConfigurations.$(hostname -s).config.system.build.toplevel"
./result/sw/bin/darwin-rebuild switch --flake .