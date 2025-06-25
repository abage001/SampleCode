FROM alpine:latest

# Install debootstrap and dependencies
RUN apk add --no-cache debootstrap wget gpg

# Create Ubuntu rootfs inside Alpine container
RUN mkdir /ubuntu && \
    debootstrap --arch=amd64 focal /ubuntu http://archive.ubuntu.com/ubuntu/

# Set the default shell to bash inside the Ubuntu chroot (optional)
CMD ["/ubuntu/bin/bash"]
