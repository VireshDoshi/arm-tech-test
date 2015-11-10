##Purpose and Aim  
This Git Repository will demonstrate a Simple Build and Deploy using Jenkins on a linux VM via Vagrant.
  
##Pre-requisites (Host Machine - Your Mac or Windows or Linux physical machine)  
1. Download and install [VirtualBox](https://www.virtualbox.org)    
2. Download and install [Vagrant](https://www.vagrantup.com)   
3. Download and install [Git](https://git-scm.com/downloads)    

##Steps  
1. Clone this git repository to your Host Machine - `git clone <this-repository_url>`  
2. run `vagrant up` at the command line  - ( check for **issues** as noted below ) 
3. Open Jenkins-CI by clicking on  [http://localhost:9080](http://localhost:9080)  
![Alt text](/screenshots/Jenkins-Screen-1.png?raw=true "Jenkins-CI")  
4. Click on the Build Job  
![Alt text](/screenshots/Click-Build-Now.png.png?raw=true "Click Build Now")  
5. 


##Future improvements
1.  Use Docker with Docker-tcl to deploy the tcl application  
2.  Startup Jenkins in a Docker container
3.  Add Steps to Boostratp.sh that skips a step if items are already done ( performance enhancement)  
4.  

##Issues
1. The very first time, `vagrant up` is executed will fail at the jenkins plugins download section. If this happens, run `vagrant reload --provision` at the command

##Notes
1. This project was created on a Mac
2. 
