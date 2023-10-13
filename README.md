<h1><p style="text-align: center;">OnTheFly (O.T.F)</p></h1>

---

## OTF is a small repo of tools I use on a daily basis. Whether for CTFs, Binary Exploitation, Web-Hacking, etc.. This is my attempt at a lightweight environment where I can pull which ever container, start up and get to work.

---

<h1><p style="text-align: center;">Categories</p></h1>

## OTF-Forensics
- Volatility3
- Image analysis
- DidierStevens
- EVTX/Chainsaw
- Logparsing tools

## OTF-Web
- gobuster
- ffuf
- wordlists
- proxychains
- chisel

## OTF-Pwn (Binary Exploitation)
- pwntools
- pwngdb
- wine
- wine-gdb


## OTF-Net
- tshark
- tcdump
- scapy
- snort


## OTF-Malware
- Radare2 
- DidierStevensSuite
- Sigma
- Yara
- OleTools
- VBE-Decoder

---

# How to run?

## Pull from Docker-Hub
` docker pull steve0ro/otf_<name> `
  - otf_malware
  - otf_pwn
  - otf_web
  - otf_net
  - otf_forensics

### Docker Run Instructions

#### Run with Bash

`docker run -it steve0ro/otf_malware:latest /bin/bash `

#### Run with ZSH no volume mounted

`docker run -it --rm steve0ro/otf_malware:latest /usr/bin/zsh `

#### Run with ZSH with volume mounted

`docker run -v $PWD:/opt/malware -it --rm steve0ro/otf_malware:latest /usr/bin/zsh`

## Docker Build Instructions

- Make sure to be in the directory of OTF_Malware, or whichever you choose.

`docker build -t steve0ro/otf_malware:latest .`

---

# To DO:

- [X] Find a way to slim down the build, current build is >2GB
- [X] Maybe X11 forward GUI apps?
- [X] Build a siem for better log parsing
- [X] create bash scripts for installs on VMs