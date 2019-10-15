#!/bin/bash

# Start ssh server
echo "root:$ROOT_PW" | chpasswd
/usr/sbin/sshd -D &

source /root/.bashrc

# start vnc server
vncserver -kill $VNC_DISPLAY
rm -rfv /tmp/.X*-lock /tmp/.X11-unix
echo $ROOT_PW | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd
vncserver $VNC_DISPLAY -geometry $VNC_GEOMETRY -securitytypes none

tail -f /root/.vnc/*$VNC_DISPLAY.log
