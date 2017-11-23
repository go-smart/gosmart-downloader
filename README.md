GoSmart Simulation Server on Ubuntu (Build and Installation)
1.	Required OS: 
a.	Ubuntu 14.04. Ubuntu 16.04 has issue with a few coding
b.	Git should be installed on the machine
2.	Open a terminal: Ctrl + Alt + T
3.	Type the following commands in the terminal

`cd ~/`

`mkdir Code`

`cd Code`

`git clone https://github.com/go-smart/gosmart-downloader.git`

`./GITDownload.sh`

`./GoSmartBuilder.sh PreInstall > outputInstall.log`

`./GoSmartBuilder.sh MakeDirectory /path/to/Build/Directory /path/to/Install/Directory`

`./GoSmartBuilder.sh BuildRequired /path/to/Build/Directory /path/to/Install/Directory ~/Code/GoSmart > outputBuild.log`

4.	The above yellow highlighted scripts can also be simply replaced using the following single command (replace BuildRequired by All)

`./GoSmartBuilder.sh All /path/to/Build/Directory /path/to/Install/Directory ~/Code/GoSmart > outputInstallBuild.log`

It should install everything. Check the output**.log file for any errors while installing and building. If there are any errors, please try to fix the errors manually. 
1.	Mostly no errors will occur, unless you change BuildRequired to BuildAll
2.	Also, if the path of the libraries are not correct, errors may occur
3.	If you use BuildAll, instead of BuildRequired, you may get errors in meshercgal or gssf building if vtk5.8 libraries are used. These two errors can be corrected by install vtk-5.10. Note that, if you use vtk6-dev, you will get again errors in few places.

GoSmart Simulation Server on Ubuntu (Starting the Server, Client and Crossbar)
1.	In the terminal, go to the directory gosmart-downloader (should be in same directory if no errors in the previous steps)
2.	Type the following two commands

`./GoSmartInit.sh ~/Code/GoSmart`

`./GoSmartStart.sh ~/Code/GoSmart`

3.	Your terminal should launch a few servers after pulling all the docker containers. In case of any errors in `./GoSmartInit.sh ~/Code/GoSmart`, you should execute each commands in the file `./GoSmartInit.sh` manually
4.	The final terminal should look as follows: 
![alt text](https://github.com/go-smart/gosmart-downloader/blob/master/TerminalSimulation.png)
5.	If there are any error in the above, then you should fix the error manually
6.	Report errors in github issues
