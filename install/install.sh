# Bash script for OTF 
# Need to add more into this..
# Will add more repos and such, of course making this script 'smarter'

#!/bin/bash

# Update and install essential packages
sudo sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get update --fix-missing -y
sudo apt-get install -y --no-install-recommends \
    gcc iputils-ping yara zip zsh binwalk wget build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev vim \
    libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev tmux git libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    exif exiftool wine gron hexedit highlight jq gdb libfuse2 libguestfs-tools libpoppler-cpp-dev ltrace \
    make libsqlite3-dev libncurses5-dev net-tools p7zip-full p7zip-rar tar unrar unzip
sudo apt-get update --fix-missing && sudo rm -rf /var/lib/apt/lists/*

ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

sudo apt-get autoclean -y
sudo apt-get autoremove -y

# Install pyenv and Oh My Zsh
curl https://pyenv.run | bash
echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Git Repos
git clone https://github.com/radareorg/radare2 /opt/Tool/radare2 && /opt/Tool/radare2/sys/./install.sh
git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef /opt/Tool/gdb-peda-pwndbg-gef && cd /opt/Tool/gdb-peda-pwndbg-gef && ./install.sh
git clone https://github.com/volatilityfoundation/volatility3 /opt/Tool/Vol3
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Copy configuration files
cp steve0ro.zsh-theme ~/.oh-my-zsh/themes/
cp .zshrc ~/
cp .tmux.conf ~/
cp requirements.txt ~/

# Install Python and Python packages
pyenv update
pyenv install 3.11.3
pyenv global 3.11.3

pip install --upgrade pip
pip install --use-feature=fast-deps -r requirements.txt
rm -rf requirements.txt