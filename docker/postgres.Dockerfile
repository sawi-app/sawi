FROM postgres:alpine

RUN echo -e "wal_level = logical\nmax_wal_senders = 10\nmax_replication_slots = 10\n" >> /var/lib/postgresql/data/postgresql.conf

RUN apk add git make gcc build-base clang15 llvm15
RUN git clone https://github.com/eulerto/wal2json.git
RUN cd wal2json && USE_PGXS=1 make
RUN cd wal2json && USE_PGXS=1 make install

RUN apk del git make gcc build-base clang15 llvm15 && apk cache clean
RUN rm -rf wal2json
