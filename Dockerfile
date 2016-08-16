FROM node

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libkrb5-dev \
    pkg-config \
    unzip

RUN cd /tmp && git clone git://github.com/jedisct1/libsodium.git && cd libsodium && git checkout stable && ./autogen.sh && ./configure && make check && make install && ldconfig
RUN cd /tmp && git clone --depth 1 git://github.com/zeromq/libzmq.git && cd libzmq && ./autogen.sh && ./configure && make && make install && ldconfig
RUN rm /tmp/* -rf

CMD [ "node" ]
