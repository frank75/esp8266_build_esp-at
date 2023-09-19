# Espressif ESP8266 - esp-at build and flash using docker container
## _Build esp-at firmware and flash it on ESP8266_
## Table of contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Usage](#usage)
* [Project Status](#project-status)
* [Room for Improvement](#room-for-improvement)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)
* [License](#license)
## General info
This project preparing and creating docker image for building and flashing esp-at on ESP8266 devices
## Technologies Used
Project is created with:
- [Espressif ESP8266]
- [Docker 24.0] 
- [Docker Compose V2]
- [Ubuntu 22.04]
- [Debian 12 slim (bookworm)] - docker base image
- [Python 3]
## Features
## Screenshots
## Setup
To run this project:
#### 1. Install docker image on Linux (for example on Ubuntu 22.04)
#### 2. Get from github files:
- Dockerfile
- compose.yml
#### 3. Run:
```sh
docker compose build --no-cache
```
#### 4. After successfull create docker image connect ESP8266 to USB
#### 5. Create and run docker containter
```sh
docker compose up -d
```
## Usage
#### 1. Connect to docker containter
```bash
docker execute -it esp8266_rtos /bin/bash
```
#### 2.  Setup python virtual environment
```sh
source /root/venv/bin/activate
cd ~/esp/esp-at
```
#### 3. Configure build process
```sh
./buil.py menuconfig
```
For ESP8266 NodeMCU v3 with ESP8266-12s device you choosing:

Platform name:
1. PLATFORM_ESP32
2. **PLATFORM_ESP8266**
3. PLATFORM_ESP32S2
4. PLATFORM_ESP32C3
choose(range[1,4]):

Module name:
1. WROOM-02 (description: TX:15 RX:13)
2. WROOM-5V2L (description: 5V UART level)
3. ESP8266_1MB (description: No OTA)
4. **WROOM-02-N (description: TX:1 RX:3)**
5. WROOM-S2
6. ESP8266_QCLOUD (description: QCLOUD TX:15 RX:13)
choose(range[1,6]):

#### 4. Build firmware
```sh
./build.py build
```
#### 5. Flash firmware
```sh
./build.py flash
```
## Project Status
Project is: **_complete_**

[comment]: <> (## Room for Improvement)

[comment]: <> (## Acknowledgements )

## Contact
Created by: [frank75@interia.pl](mailto:frank75@interia.pl)
## License
MIT
**Free Software, Hell Yeah!**

[Espressif ESP8266]: <https://www.espressif.com/en/products/modules/esp8266>
[Docker 24.0]: <https://www.docker.com>
[Docker Compose V2]: <https://docs.docker.com/compose>
[Ubuntu 22.04]: <https://ubuntu.com>
[Debian 12 slim (bookworm)]: <https://hub.docker.com>
[Python 3]: <https://www.python.org>

