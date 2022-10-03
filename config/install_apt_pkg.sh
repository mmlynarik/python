#! /bin/bash

# APT
sudo apt update
sudo apt -y upgrade

sudo apt install -y python3.9
sudo apt install -y python3.9-venv
sudo apt install -y python3.9-dev
sudo apt install -y python-is-python3
sudo apt install -y --reinstall build-essential
sudo apt install -y libgmp-dev portaudio19-dev libssl-dev python3-dev

# ALIASES & ENV VARIABLES
echo alias cl=clear >> ~/.bashrc
echo alias jl=\"jupyter lab --no-browser --port 8888 --ip=\'127.0.0.1\' --ContentManager.allow_hidden=True --ServerApp.token=\'\' --ServerApp.password=\'\'\" >> ~/.bashrc
echo alias nn=\"nano ~/.bashrc\" >> ~/.bashrc
echo export PATH=\"\$HOME/.poetry/bin:\$PATH\" >> ~/.bashrc
echo export HTTPS_PROXY=http://user:password@host:port >> ~/.bashrc
echo export HTTP_PROXY=http://user:password@host:port >> ~/.bashrc

# POETRY
curl -sSL https://install.python-poetry.org | python3.9 -
poetry config virtualenvs.in-project true
