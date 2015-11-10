##Purpose and Aim  
This Git Repository will demonstrate a Simple Build and Deploy using Jenkins on a linux VM via Vagrant. The Vagrant box will spin up a ubuntu VM, update the packages, install tcl, install java needed for jenkins , install jenkins, install the plugins and install the pre-configured jenkins jobs ( build and test).

##What will you see?  
1. Two jobs will be created in Jenkins - Build and Test
2. The Build job will get the tcl application from the git repository (https://github.com/VireshDoshi/tcl-helloworld)
3. The code will be checked for the number of lines to ensure that it was built correctly using wc
4. The Build job will then save the application to be used by the Test Job
5. The Test Job will then execute if the Build job was successful
6. The Test job will execute the tcl script ( currently on the the one VM)
7. The output will be asserted and if true, the Test Job will Pass

##To see a failed Build Job
1. Edit the Build Configuration as per the screenshot
2. ![Alt text](/screenshots/force-build-job-fail.png?raw=true "Force a failed Build Job")

##To see a failed Test Job
1. Edit the Test Configuration as per the screenshot
2. ![Alt text](/screenshots/force-test-job-fail.png?raw=true "Force a failed Test job")

  
##Pre-requisites (Host Machine - Your Mac or Windows or Linux physical machine)  
1. Download and install [VirtualBox](https://www.virtualbox.org)    
2. Download and install [Vagrant](https://www.vagrantup.com)   
3. Download and install [Git](https://git-scm.com/downloads)    

##Execution Steps  
1. Clone this git repository to your Host Machine - `git clone <this-repository_url>`  
2. run `vagrant up` at the command line  - ( check for **issues** as noted below ) 
3. Open Jenkins-CI by clicking on  [http://localhost:9080](http://localhost:9080)  
![Alt text](/screenshots/Jenkins-Screen-1.png?raw=true "Jenkins-CI")  
4. Click on the Build Job  
![Alt text](/screenshots/Click-Build-Now.png?raw=true "Click Build Now")  
5. After a few seconds, if the build was successful then you should see  
![Alt text](/screenshots/post-success-execution.png?raw=true "Post Successful execution")

##Further Steps
1. To **tear down the VM** and redeploy, issue the command `vagrant destroy`  
2. run `vagrant up` and follow the above steps from 3 onwards  

##Future improvements
1.  Use Docker with [docker-tcl](https://github.com/efrecon/docker-tcl) to deploy the tcl application  
2.  Startup [Jenkins CI](https://github.com/jenkinsci/docker) in a Docker container  
3.  Add Steps to Boostratp.sh that skips a step if items are already done ( performance enhancement) 
4.  Add a step to automate the actual build trigger via jenkins-cli command line and observer the output  

##Issues
1. The very first time, `vagrant up` is executed will fail at the jenkins plugins download section. If this happens, run `vagrant reload --provision` at the command

##Notes
1. This project was created on a Mac
