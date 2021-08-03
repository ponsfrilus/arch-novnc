# Docker container running ArchLinux accessible through novnc in a browser
FROM archlinux:latest
MAINTAINER ponsfrilus <ponsfrilus@gmail.com>

# Install packages
RUN pacman -S --noconfirm \
	facter \
	git \
	enlightenment \
	mate-gtk3 \
	net-tools \
	python \
	python3-numpy \
	supervisor \
	terminator \
	vim \
	x11vnc \
	xorg-server \
	xorg-server-utils \
	xorg-server-xvfb

# Update all packages
RUN pacman -Syu

# noVNC cooking
WORKDIR /opt/
RUN git clone https://github.com/kanaka/noVNC.git
# Avoid another checkout when launching noVnc
WORKDIR /opt/noVNC/utils/
RUN git clone https://github.com/kanaka/websockify

# Comfort
WORKDIR /var/log/supervisor/

# Not seems to work, but...
RUN export DISPLAY=:0.0

# Prepare X11, x11vnc, mate and noVNC from supervisor
COPY supervisord.ini /etc/supervisor.d/supervisord.ini

# Be sure that the noVNC port is exposed
EXPOSE 8083

# Launch X11, x11vnc, mate and noVNC from supervisor
CMD ["/usr/bin/supervisord"]
