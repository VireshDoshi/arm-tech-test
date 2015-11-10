#!/bin/bash 

# Install docker
apt-get update -qq
apt-get install -y docker.io
ln -sf /usr/bin/docker.io /usr/local/bin/docker
sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

# Install tcl
apt-get install -y tcl-dev

# Install java
apt-get install -y openjdk-7-jdk git-core

# Install jenkins
useradd jenkins -s /bin/bash -m -G docker
passwd -l jenkins
cd /home/jenkins
sudo -Hu jenkins git config --global user.name Jenkins
sudo -Hu jenkins git config --global user.email jenkins@$(hostname)

if [ ! -f /home/jenkins/jenkins.war ]
then
	wget -q -O - http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war > /home/jenkins/jenkins.war
fi

# Start jenkins
sudo -Hu jenkins java -jar /home/jenkins/jenkins.war -Djava.awt.headless=true --httpPort=9080 &
sleep 20

# download the jenkins-cli
wget -q -O - http://localhost:9080/jnlpJars/jenkins-cli.jar > /home/jenkins/jenkins-cli.jar

#install plugins
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin docker-build-step
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin docker-commons
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin authentication-tokens
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin ws-cleanup
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin git
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin git-client
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin scm-api
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin copyartifact
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin external-monitor-job
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 install-plugin saferestart

#restart jenkins
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 safe-restart

#create jobs
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 create-job Test < /vagrant/jobs/Test.xml
sudo -Hu jenkins java -jar /home/jenkins/jenkins-cli.jar -s http://localhost:9080 create-job Build < /vagrant/jobs/Build.xml


