cd ${HOME}/Code/GoSmart/dockerlaunch
sudo ./create-unix.sh
cd ${HOME}/Code/GoSmart/glossia-server-side
sudo ./setup.sh
cd ${HOME}/Code/GoSmart/glossia-container-fenics-control
sudo ./setup.sh &
sudo ./run.sh &
cd ${HOME}/Code/GoSmart/glossia-container-goosefoot-control
sudo ./setup.sh &
sudo ./run.sh &
cd ${HOME}/Code/GoSmart/glossia-fenics-ire-example
sudo ./setup.sh &
sudo ./run.sh &

