FROM postgres:alpine

RUN apk add --no-cache git make gcc build-base clang15 llvm15
RUN git clone https://github.com/eulerto/wal2json.git
RUN cd wal2json && USE_PGXS=1 make
RUN cd wal2json && USE_PGXS=1 make install

RUN apk del git make gcc build-base clang15 llvm15 && apk cache clean
RUN rm -rf wal2json
