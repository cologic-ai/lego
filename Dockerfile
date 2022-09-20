FROM goacme/lego
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
