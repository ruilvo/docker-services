FROM eclipse-mosquitto:2

# Create and delete user so the file is created with the right permissions
RUN mosquitto_passwd -c /mosquitto/config/passwd someuser somepassword
RUN mosquitto_passwd -D /mosquitto/config/passwd someuser
