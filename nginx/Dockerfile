FROM nginx:latest
WORKDIR /etc/nginx/conf.d
COPY ./nginx-reverse-proxy/server-LB.conf .
RUN mkdir -p /scripts
COPY ./wait-for-it.sh /scripts/wait-for-it.sh
RUN chmod +x /scripts/wait-for-it.sh

# Set the entrypoint to ensure Nginx waits for both services to be ready
ENTRYPOINT ["/wait-for-it.sh", "marvel", "8192", "30", "--", "/wait-for-it.sh", "dc", "8191", "30", "--", "nginx", "-g", "daemon off;"]

# Expose the Nginx port
EXPOSE 8080

