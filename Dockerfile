FROM ubuntu:20.04
LABEL version="1.0" maintainer="Amirhossein Shekari <amirhoseinshekari@gmail.com>"
WORKDIR /app
ADD Surrogate /app/
COPY requirements.txt /app/

RUN echo "tzdata tzdata/Areas select Europe" | debconf-set-selections && \
    echo "tzdata tzdata/Zones/Europe select Rome" | debconf-set-selections && \
    apt-get update && apt-get install -y wget python3.8 python3-pip git build-essential && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y python3-tk && \
    ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101 Firefox/100.0" \
    https://github.com/NREL/EnergyPlus/releases/download/v9.6.0/EnergyPlus-9.6.0-f420c06a69-Linux-Ubuntu20.04-x86_64.sh && \
    chmod 755 EnergyPlus-9.6.0-f420c06a69-Linux-Ubuntu20.04-x86_64.sh && \
    sh -c 'echo y | ./EnergyPlus-9.6.0-f420c06a69-Linux-Ubuntu20.04-x86_64.sh' && \
    rm -f EnergyPlus-9.6.0-f420c06a69-Linux-Ubuntu20.04-x86_64.sh

RUN pip install --no-cache-dir git+https://github.com/building-energy/epw.git@master && \
    pip install --no-cache-dir notebook jupyter ipywidgets && \
    pip install --no-cache-dir -r requirements.txt && \ 
    rm -rf /root/.cache/pip && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/*
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
EXPOSE 8888
