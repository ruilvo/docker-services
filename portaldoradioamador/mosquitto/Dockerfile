FROM eclipse-mosquitto:2

# From https://github.com/vvatelot/mosquitto-docker-compose/blob/main/Dockerfile
ARG UID
ARG GID
ARG USER

RUN if [ ${USER} != "root" ]; then \
    apk add shadow && \
    groupadd -f -g ${GID} ${USER} && \
    useradd -m -g ${USER} -u ${UID} ${USER}; \
    fi

RUN chown -R ${USER}:${USER} /mosquitto

USER ${USER}
# --------------------------

# Create and delete user so the file is created with the right permissions
RUN mosquitto_passwd -c /mosquitto/config/passwd someuser somepassword
RUN mosquitto_passwd -D /mosquitto/config/passwd someuser
