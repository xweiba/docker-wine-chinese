FROM scottyhardy/docker-wine:stable-9.0-20240310

COPY files /root/files
RUN chmod +x /root/files/*.sh && /root/files/init_env.sh && sed -i -e '/# Configure timezone/ a\ /root/files/init_wine.sh "${USER_NAME}"' /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]


