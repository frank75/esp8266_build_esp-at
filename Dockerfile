FROM debian:12-slim
SHELL ["/bin/bash", "-c"]
RUN apt-get update -y
RUN apt-get upgrade -y
# docs.espressif.com: Standard Setup of Toolchain for Linux
RUN apt-get install gcc git wget make cmake libncurses-dev flex bison gperf python3 python3-serial -y
# Python virtual environment and install esptool
RUN apt-get install python3-venv python3-pip -y
RUN cd /root && python3 -m venv venv 
RUN source /root/venv/bin/activate && pip install --upgrade pip
RUN source /root/venv/bin/activate && pip install esptool
# docs.espressif.com: Toolchain Setup
COPY xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz /root
RUN mkdir -p ~/esp && cd /root/esp && tar -xzf ../xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz
ENV PATH=$PATH:/root/esp/xtensa-lx106-elf/bin
ENV alias get_lx106='export PATH=$PATH:$HOME/esp/xtensa-lx106-elf/bin'
# docs.espressif.com/projects/esp-at: Get ESP-AT 
RUN cd ~/esp && git clone --recursive https://github.com/espressif/esp-at.git
RUN cd ~/esp/esp-at && git checkout release/v2.2.0.0_esp8266
RUN source /root/venv/bin/activate && pip install -r /root/esp/esp-at/requirements.txt
RUN source /root/venv/bin/activate && pip install pyyaml xlrd
# Get ESP8266_RTOS_SDK.git
RUN cd ~/esp && git clone --recursive https://github.com/espressif/ESP8266_RTOS_SDK.git
RUN cd ~/esp && mv -f ESP8266_RTOS_SDK esp-at/esp-idf
# docs.espressif.com: Install the Required Python Packages
RUN source /root/venv/bin/activate && pip install -r ~/esp/esp-at/esp-idf/requirements.txt
# Link /usr/bin/python -> /usr/bin/python
RUN ln -s /usr/bin/python3 /usr/bin/python
# Install tools
RUN apt-get install vim -y
RUN apt-get install minicom -y

