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
}
PreInstall()
{
	sudo apt-get install cmake gfortran-5 libgfortran-5-dev gfortran-5-multilib mpich libblas-dev liblapack-dev libmumps-dev build-essential python libcgal-dev libcgal-qt5-dev libvtk5-dev libtinyxml2-dev docker docker-compose python-setuptools python3-setuptools python3-pip libprotobuf-dev protobuf-compiler python3-paramiko python3-zope.interface python-scipy gmsh ipython curl python-yaml python3-watchdog libboost-filesystem1.58-dev
	sudo pip3 install autobahn munkres hachiko
	sudo add-apt-repository ppa:fenics-packages/fenics
	sudo apt-get update
	sudo apt-get install --no-install-recommendfs fenics
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
	cmake -DCMAKE_INSTALL_PREFIX=$2 $3/GoSmart/dockerlaunch
	make
	sudo make install
}

GLOSSIA()
{
	cd $1/GoSmart/glossia
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/GoSmart/glossia
	make
	sudo make install
}

GooseElmer()
{
	cd $1/GoSmart/goosefoot-elmer
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/GoSmart/goosefoot-elmer
	make
	sudo make install
}
ElmerModules()
{
	cd $1/GoSmart/goosefoot-elmer-modules
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/GoSmart/goosefoot-elmer-modules
	make
	sudo make install
}

MesherCGAL()
{
	cd $1/GoSmart/goosefoot-mesher-cgal
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/GoSmart/goosefoot-mesher-cgal
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/GoSmart/goosefoot-mesher-cgal
	make
	sudo make install
}

GSSF()
{
	cd $1/GoSmart/gssf
	cmake -DCMAKE_INSTALL_PREFIX=$2/ $3/GoSmart/gssf
	make
	sudo make install
}

GLOSSIAPYTHONCONTAINER()
{
	cd $1/GoSmart/glossia-python-container-module
	sudo python3 setup.py install
}

GLOT()
{
	cd $1/GoSmart/glot
	sudo python3 setup.py install
}

GLOSSIACOMPARATOR()
{
	cd $1/GoSmart/glossia-comparator
	sudo python3 setup.py install
}

PYTHONDAEMON()
{
	cd $1/GoSmart/python-daemon
	sudo python3 setup.py install
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

