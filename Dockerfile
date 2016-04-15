FROM postgres:9.4.5

COPY ./scripts/ /scripts
WORKDIR /migrations
RUN chmod +x /scripts/setup_db.sh
