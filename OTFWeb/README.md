# OnTheFly container is a small suite of tools I use on a daily basis. Whether for CTFs, Binary Exploitation, Web-Hacking, etc..

---

## OTF-Web

[Work in prog..]
- gobuster
- ffuf
- wordlists
- proxychains
- chisel

---

# Docker Run Instructions

## Run with Bash
`docker run -it steve0ro/otf_web:latest /bin/bash `

## Run with ZSH no volume mounted
`docker run -it --rm steve0ro/otf_web:latest /usr/bin/zsh `

## Run with ZSH with volume mounted
`docker run -v $PWD:/opt/web -it --rm steve0ro/otf_web:latest /usr/bin/zsh`
  
## Docker Build Instructions
    - Make sure to be in the directory of OTF_web, or whichever you choose.
`docker build -t steve0ro/otf_web:latest .`