FROM alpine:latest
# Install nginx, debootstrap, and bash
RUN apk add --no-cache nginx debootstrap bash wget gpg curl 
# Prevents TTY/input prompts
ENV DEBIAN_FRONTEND=noninteractive

# Create directory for Ubuntu rootfs (if needed for nested purposes)
RUN mkdir -p /ubuntu && \
    debootstrap --arch=amd64 focal /ubuntu http://archive.ubuntu.com/ubuntu/
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /usr/share/nginx/html
# Copy custom index.html to nginx default root
COPY index.html /var/www/localhost/htdocs/index.html
COPY index.html /usr/share/nginx/html/index.html

# Overwrite default config with our custom nginx.conf
COPY nginx.conf /etc/nginx/http.d/default.conf
# Display index.html 
RUN cat /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
