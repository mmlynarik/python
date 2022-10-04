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
In Windows Powershell, run as Administrator:
```powershell
wsl --install --distribution Ubuntu-20.04
```

When the installation is complete, a new WSL bash window will open automatically and will ask for new username and password.

### 6. Download Makefile
Prepare into clipboard proxy https url and paste it into the following `wget` commands as `https_proxy=` parameter:
```bash
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/Makefile -e use_proxy=yes -e https_proxy=
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/install.sh -e use_proxy=yes -e https_proxy=
```

### 6. Install apt packages, set aliases and environment variables
- Copy the content of the install script `https://github.com/mmlynarik/python/blob/master/config/install.sh` into clipboard
- In WSL bash open a new `install.sh` file in nano editor:
```sh
nano install.sh
```
- Paste the content of the clipboard into the `install.sh` file (right-click)
- Fill in proxy server and credentials info into pre-defined variables `HTTP_PROXY` and `HTTPS_PROXY` and save the file. 
- Source the script:
```bash
source install.sh
```

### 7. Install poetry python package and dependency manager
In new bash window run:
```bash
curl -sSL https://install.python-poetry.org | python3.9 -
```

### 8. Configure poetry
In new bash window run:
```bash
poetry config virtualenvs.in-project true
```

### 9. Enhance terminal prompt using `oh-my-posh`
Run outside VPN and proxy setup:
```bash
mkdir ~/.poshthemes/
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo wget https://raw.githubusercontent.com/mmlynarik/python/master/config/paradox.omp.json -O ~/.poshthemes/paradox.omp.json
sudo chmod +x /usr/local/bin/oh-my-posh
echo "eval $(sudo oh-my-posh --init --shell bash --config ~/.poshthemes/paradox.omp.json)" >> ~/.bashrc
```

### 10. CascadyaCove Nerd Font Mono fonts in Windows
```bash
# Download, unzip and install 
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip
# Set them in bash terminal window (right-click on menu bar and select `Properties`)
```

### 11. Install VSCode extension allowing remote development

https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack


### 12. Generate SSH keys
Generate SSH keys for use with code repository system (Gitlab, GitHub, ...) and then copy generated public key to your account on the upstream server from which repos will be cloned.
```bash
ssh-keygen -t rsa -b 4096 -C "mmlynarik@sk.uss.com" -N '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
```

### 13. Configure git
```bash
git config --global user.name "Miroslav Mlynarik"
git config --global user.email "mmlynarik@sk.uss.com"
git config --global remote.origin.prune true
```

### 14. Clone repository
```bash
mkdir python
cd python
git clone git@github.com:reponame.git
```

### 15. Launch VSCode in Ubuntu bash
```bash
code .
```

### 16. Paste `config/settings.json` file to VSCode settings and install Python extension

### 17. Docker setup
If 80:80 port issue occurs when running hello-world docker container, run this in Powershell:
```powershell
netsh http add iplisten ipaddress=::
```
### 18. Create and install python project virtual environment
```bash
python3.8 -m venv .venv
echo "set -a && . ./.env && set +a" >> .venv/bin/activate
. .venv/bin/activate; \
pip install -U pip setuptools wheel; \
poetry install
```

### 19. Install `pre-commit`
```bash
# Turn off proxy and VPN and run in the terminal:
pre-commit install
# If errors occur due to dependency issues, replace problematic library directly in the pre-commit venv repository stored in `~/.cache/pre-commit`
```
