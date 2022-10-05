#! /bin/bash

# WGET PROXY
echo use_proxy=on >> ~/.wgetrc
echo http_proxy=${HTTP_PROXY} >> ~/.wgetrc
echo https_proxy=${HTTP_PROXY} >> ~/.wgetrc

# DOWNLOAD FILES
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/Makefile
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/setup.cfg
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/pyproject.toml
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/poetry.lock
wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basic-linuxx64.zip

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
sudo apt install -y unzip
sudo apt install -y --reinstall build-essential
sudo apt install -y libgmp-dev portaudio19-dev libssl-dev python3-dev

# ORACLE CLIENT
sudo mkdir -p /opt/oracle
sudo unzip instantclient-basic-linuxx64.zip -d /opt/oracle/
rm -f instantclient-basic-linuxx64.zip

# ALIASES & ENV VARIABLES
echo alias cl=clear >> ~/.bashrc
echo alias jl=\"jupyter lab --no-browser --port 8888 --ip=\'127.0.0.1\' --ContentManager.allow_hidden=True --ServerApp.token=\'\' --ServerApp.password=\'\'\" >> ~/.bashrc
echo alias nn=\"nano ~/.bashrc\" >> ~/.bashrc
echo export PATH=\"\$HOME/.poetry/bin:\$PATH\" >> ~/.bashrc
echo export HTTPS_PROXY=${HTTP_PROXY} >> ~/.bashrc
echo export HTTP_PROXY=${HTTP_PROXY} >> ~/.bashrc
echo export LD_LIBRARY_PATH=/opt/oracle/instantclient_21_6:$LD_LIBRARY_PATH >> ~/.bashrc
