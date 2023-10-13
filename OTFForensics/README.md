# OnTheFly container is a small suite of tools I use on a daily basis. Whether for CTFs, Binary Exploitation, Web-Hacking, etc..

---

## OTF-Forensics

- stego
- Image analysis
- Could use SIEM to clean data?
- Container-1 could be a SIEM
- Container-2 is where logs are loaded, but then sent to SIEM(Container-1)
- DiederStevens
- EricZimmerman
- Logparsing tools

---

# Docker Run Instructions

## Run with Bash
`docker run -it steve0ro/otf_forensics:latest /bin/bash `

## Run with ZSH no volume mounted
`docker run -it --rm steve0ro/otf_forensics:latest /usr/bin/zsh `

## Run with ZSH with volume mounted
`docker run -v $PWD:/opt/forensics -it --rm steve0ro/otf_forensics:latest /usr/bin/zsh`
  
## Docker Build Instructions
    - Make sure to be in the directory of OTF_forensics, or whichever you choose.
`docker build -t steve0ro/otf_forensics:latest .`