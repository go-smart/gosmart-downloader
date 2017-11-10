#!/bin/bash
#Helper() {
#  echo 'To Build Enter any of the given key'
#  echo '1: To Pre-Install'
#  echo '2: To Create Build and Installer Directory'
#  echo '3: To start Building and Installation'
#  echo '4: To Execute all above 3 commands'
#  echo 'q: To Quit'
#}
#Helper2()
#{
#	echo 'To Build Install the following, Press the following key'
#	echo '1: dockerlaunch'
#	echo '2: glossia'
#	echo '3: goosefoot-elmer'
#	echo '4: goosefoot-elmer-modules'
#	echo '5: goosefoot-mesher-cgal'
#	echo '6: gssf'
#	echo '7: glossia-python-container-module'
#	echo '8: glossia-comparator'
#	echo '9: python-daemon'
#	echo '0: To Install everything'
#	echo 'q: To Quit'
#}
#ReadDirectories()
#{
#	echo 'Enter the Build Directory'
#	read BUILDDIR

#	echo 'Enter the Installer Directory'
#	read INSTALLDIR

#	echo 'Enter the Source Directory'
#	read SOURCEDIR

#	local Directories;
#	Directories=($BUILDDIR $INSTALLDIR $SOURCEDIR)
#	echo $Directories
#	return $Directories
#}
ListOfFunctions()
{
	echo 'List of Functions'
	echo '  PreInstall'
	echo '  MakeDirectory BUILDdir INSTALLDIR'
	echo '  DockerLaunch BUILDdir INSTALLDIR SOURCEDIR'
	echo '  GLOSSIA BUILDdir INSTALLDIR SOURCEDIR'
	echo '  GooseElmer BUILDdir INSTALLDIR SOURCEDIR'
	echo '  ElmerModules BUILDdir INSTALLDIR SOURCEDIR'
	echo '  MesherCGAL BUILDdir INSTALLDIR SOURCEDIR'
	echo '  GSSF BUILDdir INSTALLDIR SOURCEDIR'
	echo '  GLOSSIAPYTHONCONTAINER SOURCEDIR'
	echo '  GLOT SOURCEDIR'
	echo '  GLOSSIACOMPRATOR SOURCEDIR'
	echo '  PYTONDAEMON SOURCEDIR'
	echo '  All BUILDdir INSTALLDIR SOURCEDIR'
	echo '  BuildAlone BUILDdir INSTALLDIR SOURCEDIR'
	echo '  PYTHONRELATED BUILDdir INSTALLDIR SOURCEDIR'
}
PreInstall()
{
	sudo apt-get -y install cmake
if [[ `lsb_release -rs` == "14.04" ]] 
then
	sudo apt-get -y install gfortran-5
	sudo apt-get -y install libgfortran-5-dev
	sudo apt-get -y install gfortran-5-multilib
fi
	sudo apt-get -y install mpich
	sudo apt-get -y install libblas-dev
	sudo apt-get -y install liblapack-dev
	sudo apt-get -y install libmumps-dev
	sudo apt-get -y install build-essential
	sudo apt-get -y install python
	sudo apt-get -y install libcgal-dev
	sudo apt-get -y install libcgal-qt5-dev
	sudo apt-get -y install libvtk5-dev
	sudo apt-get -y install libtinyxml2-dev
	sudo apt-get -y install python-setuptools
	sudo apt-get -y install python3-setuptools
	sudo apt-get -y install python3-pip
	sudo apt-get -y install libprotobuf-dev
	sudo apt-get -y install protobuf-compiler
	sudo apt-get -y install python3-paramiko
	sudo apt-get -y install python3-zope.interface
	sudo apt-get -y install python-scipy
	sudo apt-get -y install gmsh
	sudo apt-get -y install ipython
	sudo apt-get -y install curl
	sudo apt-get -y install python-yaml
	sudo apt-get -y install python3-watchdog
	sudo apt-get -y install libboost-filesystem1.58-dev
	sudo pip3 install autobahn 
	sudo pip3 install munkres
	sudo pip3 install hachiko
	sudo pip3 install docker-py
	curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > ./docker-compose
	sudo mv ./docker-compose /usr/bin/docker-compose
	sudo chmod +x /usr/bin/docker-compose
	sudo add-apt-repository ppa:fenics-packages/fenics
	sudo apt-get update
	sudo apt-get -y install --no-install-recommendfs fenics
	sudo apt-get dist-upgrade
	sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-5 50
}
MakeDirectory()
{
	mkdir $1
	mkdir $1/GoSmart
	mkdir $1/GoSmart/dockerlaunch
	mkdir $1/GoSmart/glossia
	mkdir $1/GoSmart/glossia-comparator
	mkdir $1/GoSmart/goosefoot-elmer
	mkdir $1/GoSmart/goosefoot-elmer-modules
	mkdir $1/GoSmart/goosefoot-mesher-cgal
	mkdir $1/GoSmart/gssf
	
	mkdir $2/
}

DockerLaunch()
{
	cd $1/GoSmart/dockerlaunch
	cmake -DCMAKE_INSTALL_PREFIX=$2 $3/dockerlaunch
	make
	sudo make install
	sudo python3 setup.py install
}

GLOSSIA()
{
	cd $1/GoSmart/glossia
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/glossia
	make
	sudo make install
}

GooseElmer()
{
	cd $1/GoSmart/goosefoot-elmer
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/goosefoot-elmer
	make
	sudo make install
}
ElmerModules()
{
	cd $1/GoSmart/goosefoot-elmer-modules
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/goosefoot-elmer-modules
	make
	sudo make install
}

MesherCGAL()
{
	cd $1/GoSmart/goosefoot-mesher-cgal
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/goosefoot-mesher-cgal
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/goosefoot-mesher-cgal
	make
	sudo make install
}

GSSF()
{
	cd $1/GoSmart/gssf
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/gssf
	make
	sudo make install
}

GLOSSIAPYTHONCONTAINER()
{
	cd $1/glossia-python-container-module
	sudo python3 setup.py install
}

GLOT()
{
	cd $1/glot
	sudo python3 setup.py install
}

GLOSSIACOMPARATOR()
{
	cd $1/glossia-comparator
	sudo python3 setup.py install
}

PYTHONDAEMON()
{
	cd $1/python-daemon
	sudo python3 setup.py install
}

PYTHONRELATED()
{
	DockerLaunch $@
	GLOT $3
	GLOSSIACOMPARATOR $3
	PYTHONDAEMON $3
}


BuildAlone()
{
	DockerLaunch $@
	GLOSSIA $@
	GooseElmer $@
	ElmerModules $@
	MesherCGAL $@
	GSSF $@
	GLOSSIAPYTHONCONTAINER $3
	GLOT $3
	GLOSSIACOMPRATOR $3
	PYTONDAEMON $3
}


All()
{
	PreInstall
	MakeDirectory $@
	BuildAlone $@
}

if declare -f "$1" > /dev/null
then
	"$@"
else
	echo 'Invalid Execution. Enter a valid input'
	echo './GoSmartBuilder.sh FUNCTION'
	ListOfFunctions
	exit 1
fi

