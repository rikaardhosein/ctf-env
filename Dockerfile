from phusion/baseimage:0.9.17

RUN apt-get update && apt-get -y install binutils unzip gcc g++ gdb python2.7 python-dev python-pip git vim libffi-dev build-essential virtualenvwrapper
RUN git clone https://github.com/longld/peda.git ~/peda && echo "source ~/peda/peda.py" >> ~/.gdbinit 
RUN pip install pycrypto angr
RUN apt-get install wget
RUN mkdir -p /root/bin
RUN wget http://www.trapkit.de/tools/checksec.sh && chmod +x checksec.sh
RUN mv checksec.sh /root/bin/checksec.sh
RUN echo "function checksec() { /root/bin/checksec.sh --file \"\$1\";}" >> ~/.bashrc
RUN pip install pwntools
RUN apt-get -y install libssl-dev
RUN cd /root/bin && git clone https://github.com/bwall/HashPump.git && cd HashPump && make && make install
RUN apt-get install -y strace ltrace nmap
RUN apt-get install -y python3 python3-pip
RUN pip install setuptools
RUN git clone https://github.com/ALSchwalm/foresight.git && cd foresight && python3 setup.py install

