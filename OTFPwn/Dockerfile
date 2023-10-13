# Building the container with tag:
#   docker build -t otf_pwn:latest .

# Running the container with tag and loading files into container:
#   docker run -v $PWD:/opt/pwn -it --rm otf_pwn /usr/bin/zsh 

FROM ubuntu:20.04

LABEL maintainer="Steve0ro"

WORKDIR $HOME

ENV OPT /opt
ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive
ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN mkdir ${OPT}/Tool && \
    mkdir ${OPT}/pwn

RUN apt-get update -y && apt-get upgrade -y && apt-get update --fix-missing && apt-get install -y --no-install-recommends \
    gcc iputils-ping yara zip zsh binwalk wget build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev vim \
    libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev tmux git libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    exif exiftool wine gron hexedit highlight jq gdb libfuse2 libguestfs-tools libpoppler-cpp-dev ltrace \
    make libsqlite3-dev libncurses5-dev vim net-tools p7zip-full p7zip-rar tar unrar unzip && \
    apt-get update --fix-missing && rm -rf /var/lib/apt/lists/* && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    curl https://pyenv.run | bash && echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    apt-get autoclean -y && apt-get autoremove -y 

# Git Repos
RUN git clone https://github.com/radareorg/radare2 ${OPT}/Tool/radare2 && ${OPT}/Tool/radare2/sys/./install.sh && \
    git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef ${OPT}/Tool/gdb-peda-pwndbg-gef && \
    cd ${OPT}/Tool/gdb-peda-pwndbg-gef && ./install.sh && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions && \
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
   
COPY src/steve0ro.zsh-theme ${HOME}/.oh-my-zsh/themes/
COPY src/.zshrc ${HOME}
COPY src/.tmux.conf ${HOME}
COPY src/requirements.txt ${HOME}

RUN pyenv update && pyenv install 3.11.3 && pyenv global 3.11.3 && \
    pip install --upgrade pip && pip install --use-feature=fast-deps -r ${HOME}/requirements.txt && \
    rm -rf ${HOME}/requirements.txt