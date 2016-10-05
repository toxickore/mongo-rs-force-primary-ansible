FROM mongo
RUN mkdir /data/arb
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 27017
ENTRYPOINT ["/entrypoint.sh"]
