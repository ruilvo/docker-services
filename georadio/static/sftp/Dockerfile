FROM atmoz/sftp:latest

# Set environment variables for SFTP user and password
ARG SFTP_USER
ARG SFTP_PASS

# Create the SFTP user with the specified password
RUN useradd --disabled-password --gecos "" $SFTP_USER
RUN echo "$SFTP_USER:$SFTP_PASS" | chpasswd
RUN mkdir -p /home/$SFTP_USER/uploads
RUN chown -R $SFTP_USER:$SFTP_USER /home/$SFTP_USER/uploads

# Expose the SFTP port
EXPOSE 22

CMD ["run", "--foreground"]
