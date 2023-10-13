# Building the container with tag:
#   docker build -t otf_web:latest .

# Running the container with tag and loading files into container:
#   docker run -v $PWD:/opt/web -it --rm otf_web /usr/bin/zsh 

FROM ubuntu:20.04

LABEL maintainer="Steve0ro"

WORKDIR $HOME

ENV OPT /opt
ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive
ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN mkdir ${OPT}/Tool && \
    mkdir ${OPT}/web && \
    mkdir ${OPT}/wordlist && \
    mkdir ${HOME}/.gf

RUN apt-get update -y && apt-get upgrade -y && apt-get update --fix-missing && apt-get install -y --no-install-recommends \
    gcc iputils-ping zip zsh wget build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev vim \
    libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev tmux git libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    cargo gron hexedit highlight httpie jq libfuse2 libguestfs-tools libpoppler-cpp-dev \
    make libsqlite3-dev libncurses5-dev p7zip-full p7zip-rar \
    php tar unrar unzip && apt-get update --fix-missing && rm -rf /var/lib/apt/lists/* && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    curl https://pyenv.run | bash && echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    apt-get autoclean -y && apt-get autoremove -y 

# Git Repos
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions && \
    git clone https://github.com/1ndianl33t/Gf-Patterns ${HOME}/.gf && \
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search


RUN node_version=$(curl -sn https://nodejs.org/en/download | grep -Eo 'v[0-9]{2}\.[0-9]{2}\.[0-9]{1}\/node-v[0-9]{2}\.[0-9]{2}\.[0-9]-linux-x64.tar.xz' | sort -u) && \
    n2=$(echo $node_version | grep -Eo 'node-v[0-9]{2}\.[0-9]{2}\.[0-9]-linux-x64.tar.xz') && wget https://nodejs.org/dist/$node_version && \
    mkdir -p /usr/local/lib/nodejs &&  tar -xJvf $n2 -C /usr/local/lib/nodejs && \
    go_version=$(curl -sn https://go.dev/dl/ | grep -Eo 'go1\.21+\.[3,9]+\.linux-amd64\.tar\.gz' | sort -u) && wget https://go.dev/dl/$go_version && \
    rm -rf /usr/local/go &&  tar -C /usr/local -xzf $go_version 

COPY src/steve0ro.zsh-theme ${HOME}/.oh-my-zsh/themes/
COPY src/.zshrc ${HOME}
COPY src/.tmux.conf ${HOME}

RUN pyenv update && pyenv install 3.11.3 && pyenv global 3.11.3

RUN go install github.com/ffuf/ffuf/v2@latest && go install -v github.com/OWASP/Amass/v3/...@master && go install github.com/tomnomnom/gf@latest && \
    go install github.com/OJ/gobuster/v3@latest && 