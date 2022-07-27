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

### 4. Download and install Linux kernel update package:
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi


### 5. Download Ubuntu via web request
In Windows Powershell, run as Administrator:
```powershell
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
Add-AppxPackage Ubuntu.appx
```

### 6. Install Ubuntu 
Click Ubuntu icon from Windows Start menu and let it configure itself

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
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3.9 -
poetry config virtualenvs.in-project true
```

### 9. Set up aliases and environment variables
```bash
echo export PATH=\"\$HOME/.poetry/bin:\$PATH\" >> ~/.bashrc
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
# copy SSH public key to your github account
```

### 14. Set up git name and email 
```bash
git config --global user.name "Name Surname"
git config --global user.email "name.surname@gmail.com"
```

### 15. Clone repository (if necessary, set up proxy first)
```bash
mkdir python
cd python
git clone git@github.com:mmlynarik/name-matching.git
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
pip install -U pip setuptools
poetry install
```
