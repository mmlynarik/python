Set up WSL, Ubuntu, Python, Poetry, VS Code, SSH keys, Git, repo, venv and Django app
------------

### 1. Install apps in Windows
```
Mozzila
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


### 5. In Windows-side installation of VSCode install extension allowing remote development

https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack

### 6. Download and install Ubuntu
In Windows Powershell, run as Administrator:
```powershell
wsl --install --distribution Ubuntu-20.04
```
When the installation is complete, a new WSL bash window will open automatically and will ask for username and password.

### 7. Set proxy server environment variables for current shell session
```bash
export HTTP_PROXY=
export HTTPS_PROXY=
```

### 8. Download install script
```bash
wget https://raw.githubusercontent.com/mmlynarik/python/master/config/install.sh -e use_proxy=yes -e https_proxy=$HTTP_PROXY
```

### 9. Download files, install apt packages, set aliases and environment variables
```bash
source install.sh
```

### 10. Enhance terminal prompt using `oh-my-posh`
```bash
make posh
```

### 11. CascadyaCove Nerd Font Mono fonts in Windows
Download, unzip and install fonts in Windows and then set them in bash terminal window (right-click on menu bar and select `Properties`)
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip


### 12. Generate SSH keys
Generate SSH keys and then copy generated public key to your account on the upstream code repository server.
```bash
make ssh
```

### 13. Configure git
```bash
make git
```

### 14. Install and configure poetry python package and dependency manager
```bash
make poetry
```

### 15. Clone repository and launch VS Code in WSL
```bash
make repo
```

### 16. Create python project virtual environment and install dependencies
```bash
make venv
```
### 17. Install VSCode Python extension and select venv interpreter 

### 18. Initialize django app
```bash
make app
```

### 19. Launch django app in two terminals
```bash
make django
make dramatiqr
```

### 20. Docker setup
If 80:80 port issue occurs when running hello-world docker container, run this in Powershell:
```powershell
netsh http add iplisten ipaddress=::
```

### 21. Install pre-commit
Turn off proxy and VPN and run in the terminal. If errors occur due to dependency issues, replace problematic library directly in the pre-commit venv repository stored in `~/.cache/pre-commit`
```bash
pre-commit install
```

### 22. Tensorflow GPU support
- Download and install in **Windows** appropriate NVIDIA Driver for your GPU: https://www.nvidia.com/download/index.aspx
- Download and install in **WSL** CUDA toolkit: https://developer.nvidia.com/cuda-downloads
  ```bash
  wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_XX.X.X_YYY.YY.YY_linux.run
  sudo sh cuda_XX.X.X_YYY.YY.YY_linux.run
  ```

- Download and install in **WSL** cuDNN toolkit as Debian local repository installation package:
https://developer.nvidia.com/rdp/cudnn-download 
  ```bash
  sudo cp /var/cudnn-local-repo-*/cudnn-local-*-keyring.gpg /usr/share/keyrings/
  sudo dpkg -i cudnn-local-repo-ubuntuYYYY-X.X.X.X_X.X-X_amd64
  sudo apt-get install libcudnnX
   ```
