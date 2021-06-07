#!/usr/bin/env bash

echo "Installing dependencies ..."
sudo apt update
sudo apt install -y curl ca-certificates build-essential git python3 python3-pip less libxext6 libxrender1 libxtst6 libfreetype6 libxi6

echo "Installing rust ..."
su vagrant -c 'curl https://sh.rustup.rs -sSf | sh -s -- -y'

echo "Installing JetBrains CLion ..."
su vagrant -c 'pip3 install projector-installer'
su vagrant -c '/home/vagrant/.local/bin/projector --accept-license autoinstall --ide-name "CLion 2021.1.2" --config-name clion'

echo "Creating systemd service ..."
sudo touch /etc/systemd/system/jetbrains-clion.service

# /home/vagrant/.local/bin/projector run clion
sudo tee -a /etc/systemd/system/jetbrains-clion.service > /dev/null <<EOT
[Unit]
Description=JetBrains CLion
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=vagrant
ExecStart=/home/vagrant/.projector/configs/clion/run.sh

[Install]
WantedBy=multi-user.target
EOT

echo "Enabling and starting systemd service ..."
systemctl enable jetbrains-clion
systemctl start jetbrains-clion

echo "Cleaning up ..."
sudo apt-get autoclean -y
sudo apt-get clean -y
sudo rm -rf /var/lib/apt/lists/* \
    /var/cache/apt/pkgcache.bin \
    /var/cache/apt/srcpkgcache.bin