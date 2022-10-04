#! /bin/bash

# DOWNLOAD FILES
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/Makefile -e use_proxy=yes -e https_proxy=$HTTP_PROXY
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/setup.cfg -e use_proxy=yes -e https_proxy=$HTTP_PROXY
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/pyproject.toml -e use_proxy=yes -e https_proxy=$HTTP_PROXY

# APT PROXY
echo Acquire::http::Proxy \"${HTTP_PROXY}\"\; | sudo tee -a /etc/apt/apt.conf.d/proxy.conf
echo Acquire::https::Proxy \"${HTTPS_PROXY}\"\; | sudo tee -a /etc/apt/apt.conf.d/proxy.conf

# APT
sudo apt update
sudo apt -y upgrade
sudo apt install -y python3.8
sudo apt install -y python3.8-venv
sudo apt install -y python3.8-dev
sudo apt install -y python-is-python3
sudo apt install -y redis
sudo apt install -y --reinstall build-essential
sudo apt install -y libgmp-dev portaudio19-dev libssl-dev python3-dev

# ALIASES & ENV VARIABLES
echo alias cl=clear >> ~/.bashrc
echo alias jl=\"jupyter lab --no-browser --port 8888 --ip=\'127.0.0.1\' --ContentManager.allow_hidden=True --ServerApp.token=\'\' --ServerApp.password=\'\'\" >> ~/.bashrc
echo alias nn=\"nano ~/.bashrc\" >> ~/.bashrc
echo export PATH=\"\$HOME/.poetry/bin:\$PATH\" >> ~/.bashrc
echo export HTTPS_PROXY=${HTTP_PROXY} >> ~/.bashrc
echo export HTTP_PROXY=${HTTP_PROXY} >> ~/.bashrc
