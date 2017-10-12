#!/bin/bash
sudo pkill crossbar
sudo dockerlaunchd stop
sudo service docker stop
sudo rm -rf /var/run/dockerlaunch
sudo dockerlaunchd start
sudo service docker start
cd ${HOME}/Code/GoSmart/glossia-server-side
sudo ./start-remote.sh
sudo ./start-local.sh
