# OnTheFly container is a small suite of tools I use on a daily basis. Whether for CTFs, Binary Exploitation, Web-Hacking, etc..

---

## OTF-Pwn (Binary Exploitation)

- pwntools
- pwngdb
- wine
- wine-gdb

---

# Docker Run Instructions

## Run with Bash
`docker run -it steve0ro/otf_pwn:latest /bin/bash `

## Run with ZSH no volume mounted
`docker run -it --rm steve0ro/otf_pwn:latest /usr/bin/zsh `

## Run with ZSH with volume mounted
`docker run -v $PWD:/opt/pwn -it --rm steve0ro/otf_pwn:latest /usr/bin/zsh`
  
## Docker Build Instructions
    - Make sure to be in the directory of OTF_pwn, or whichever you choose.
`docker build -t steve0ro/otf_pwn:latest .`