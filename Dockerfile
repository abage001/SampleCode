FROM alpine:latest

# Install nginx, debootstrap, and bash
RUN apk add --no-cache nginx debootstrap bash wget gpg

# Create directory for Ubuntu rootfs (if needed for nested purposes)
RUN mkdir -p /ubuntu && \
    debootstrap --arch=amd64 focal /ubuntu http://archive.ubuntu.com/ubuntu/

# Copy custom index.html to nginx default root
COPY index.html /var/www/localhost/htdocs/index.html

# Expose port 80
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
