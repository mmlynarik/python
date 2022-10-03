Set up WSL, Ubuntu, Python, Poetry, VSCode, Docker and Git
------------

### 1. Install apps in Windows
```
Mozzila
Git
VSCode
Docker Desktop
Notepad++
```

### 2. Enable WSL and VMP features on Windows
In Windows Powershell, run as Administrator and then **restart Windows**: 
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### 3. Set WSL2 as default
In Windows Powershell, run as Administrator:
```powershell
wsl --set-default-version 2
```

### 4. Update WSL Linux kernel:
Download outside VPN and then install in Windows Powershell as Administrator the following package.

https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi


### 5. Download and install Ubuntu
In Windows Powershell, outside VPN, run as Administrator:
```powershell
wsl --install --distribution Ubuntu-20.04
```

### 6. Set up proxy settings for apt and pip 
Run these commands:
```bash
cd /etc/apt/apt.conf.d
sudo nano proxy.conf

# Paste the following config into proxy.conf
Acquire::http::Proxy "http://user:password@host:port/";
Acquire::https::Proxy "https://user:password@host:port/";
```

Then for pip and curl:
```bash
echo export HTTP_PROXY=http://user:password@host:port >> ~/.bashrc
echo export HTTPS_PROXY=https://user:password@host:port >> ~/.bashrc
echo export http_proxy=http://user:password@host:port >> ~/.bashrc
echo export https_proxy=https://user:password@host:port >> ~/.bashrc
```

### 7. Install packages in Ubuntu
In Ubuntu shell, run these commands to install Python 3.9, generate SSH keys for GitHub, clone repository and set up VSCode remote server:
```bash
sudo apt update
sudo apt -y upgrade

sudo apt install -y python3.9
sudo apt install -y python3.9-venv
sudo apt install -y python3.9-dev
sudo apt install -y python-is-python3
sudo apt install -y --reinstall build-essential
sudo apt install -y libgmp-dev portaudio19-dev libssl-dev python3-dev
```

### 8. Install poetry package manager
```bash
curl -sSL https://install.python-poetry.org | python3.9 -
echo export PATH=\"\$HOME/.poetry/bin:\$PATH\" >> ~/.bashrc
poetry config virtualenvs.in-project true
```

### 9. Set up aliases and environment variables
```bash
echo alias cl=clear >> ~/.bashrc
echo alias jl=\"jupyter lab --no-browser --port 8888 --ip=\'127.0.0.1\' --ContentManager.allow_hidden=True --ServerApp.token=\'\' --ServerApp.password=\'\'\" >> ~/.bashrc
```

### 10. Enhance CLI colors using `oh-my-posh`:
```bash
mkdir ~/.poshthemes/
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo wget https://raw.githubusercontent.com/mmlynarik/python/master/config/paradox.omp.json -O ~/.poshthemes/paradox.omp.json
sudo chmod +x /usr/local/bin/oh-my-posh
echo eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/paradox.omp.json)" >> ~/.bashrc
```

### 11. CascadyaCove Nerd Font Mono fonts in Windows
```bash
# Download, unzip and install 
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip
# Set them in bash terminal window (right-click on menu bar and select `Properties`)
```

### 12. Install VSCode extension allowing remote development
```
https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack
```

### 13. Generate SSH keys for use with Github
```bash
ssh-keygen -t rsa -b 4096 -C "name.surname@gmail.com"
# copy SSH public key to your account on the upstream (remote) server
```

### 14. Set up git configuration
```bash
git config --global user.name "Name Surname"
git config --global user.email "name.surname@gmail.com"
git config --global remote.origin.prune true
```

### 15. Clone repository (if necessary, set up proxy first)
```bash
mkdir python
cd python
git clone git@github.com:reponame.git
```

### 16. Launch VSCode in Ubuntu bash
```bash
code .
```

### 17. Paste `config/settings.json` file to VSCode settings 

### 18. Docker setup
If 80:80 port issue occurs when running hello-world docker container, run this in Powershell:
```powershell
netsh http add iplisten ipaddress=::
```
### 19. Create and install python project virtual environment
```bash
python3.9 -m venv .venv
echo "set -a && . .env && set +a" >> .venv/bin/activate
source .venv/bin/activate
pip install -U pip setuptools wheel
poetry install
```

### 20. Install `pre-commit`
```bash
# Turn off proxy and VPN and run in the terminal:
pre-commit install
# If errors occur due to dependency issues, replace problematic library directly in the pre-commit venv repository stored in `~/.cache/pre-commit`
```
