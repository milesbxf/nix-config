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

if ! command -v "${NIX_BIN}/nix-build" > /dev/null; then
    nix_install_loc=/tmp/install-nix-${NIX_VERSION}
    echo "⚠️ nix-build not found; installing nix"

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
source ~/.nix-profile/etc/profile.d/nix.sh

if isDarwin; then

    if [[ ! -s ~/.nixpkgs/darwin-configuration.nix ]]; then
        echo "⚠️  ~/.nixpkgs/darwin-configuration.nix doesn't exist. Please define a new machine configuration there and rerun the installer"
        exit 1
    fi

    if ! nix-channel --list | grep home-manager > /dev/null; then
        echo "⚠️  home-manager not in list of channels; adding"
        nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
        nix-channel --update
    fi

    if ! command -v darwin-rebuild > /dev/null; then
        echo "⚠️  darwin-rebuild not found; installing nix-darwin"

        nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -o /tmp/nix-darwin-result -A installer
        /tmp/nix-darwin-result/bin/darwin-installer
    fi

    echo "✅ nix-darwin is installed"
fi


