FROM jetpackio/devbox:latest

# Installing your devbox project
WORKDIR /code
USER root:root
RUN mkdir /code && chown ${DEVBOX_USER}:${DEVBOX_USER} /code
USER ${DEVBOX_USER}:${DEVBOX_USER}
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.json devbox.json
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.lock devbox.lock

RUN devbox run -- echo "Installed Packages."

EXPOSE 8080

COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} blog ./blog
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} process-compose.yml .

CMD ["devbox", "run", "start_server"]
