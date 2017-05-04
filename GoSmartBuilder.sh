#!/bin/bash
sudo apt-get install cmake gfortran-5 libgfortran-5-dev gfortran-5-multilib mpich libblas-dev liblapack-dev libmumps-dev build-essential python libcgal-dev libcgal-qt5-dev libvtk5-dev libtinyxml2-dev docker docker-compose python-setuptools python3-setuptools python3-pip libprotobuf-dev protobuf-compiler
sudo update-alternatives -–install /usr/bin/gfortran gfortran /usr/bin/gfortran-5 50

mkdir ${HOME}/Build
mkdir ${HOME}/Build/GoSmart
mkdir ${HOME}/Build/GoSmart/dockerlaunch
mkdir ${HOME}/Build/GoSmart/glossia
mkdir ${HOME}/Build/GoSmart/glossia-comparator
mkdir ${HOME}/Build/GoSmart/goosefoot-elmer
mkdir ${HOME}/Build/GoSmart/goosefoot-elmer-modules
mkdir ${HOME}/Build/GoSmart/goosefoot-mesher-cgal
mkdir ${HOME}/Build/GoSmart/gssf

mkdir ${HOME}/Installer/GoSmart
INSTALLDIR=${HOME}/Installer/GoSmart

cd ${HOME}/Build/GoSmart/dockerlaunch
cmake -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} ${HOME}/Code/GoSmart/dockerlaunch
make
sudo make install

cd ${HOME}/Build/GoSmart/glossia
cmake -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} ${HOME}/Code/GoSmart/glossia
make
make install

cd ${HOME}/Build/GoSmart/goosefoot-elmer
cmake -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} ${HOME}/Code/GoSmart/goosefoot-elmer
make
make install

cd ${HOME}/Build/GoSmart/goosefoot-elmer-modules
cmake -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} ${HOME}/Code/GoSmart/goosefoot-elmer-modules
make
make install

cd ${HOME}/Build/GoSmart/goosefoot-mesher-cgal
cmake -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} ${HOME}/Code/GoSmart/goosefoot-mesher-cgal
cmake -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} ${HOME}/Code/GoSmart/goosefoot-mesher-cgal
make
make install


cd ${HOME}/Build/GoSmart/gssf
cmake -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} ${HOME}/Code/GoSmart/gssf
make
make install

cd ${Home}/Code/glossia-python-container-module
python3 setup.py install --prefix=${INSTALLDIR}

cd ${HOME}/Code/glot
sudo python3 setup.py install

cd ${HOME}/Code/GoSmart/glossia-comparator
python3 setup.py install --prefix=${INSTALLDIR}


