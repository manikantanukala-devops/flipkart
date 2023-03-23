
hello 
this is a check file
yum install wget unzip -y

cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.zip
unzip apache-tomcat-9.0.73.zip
cd /opt/apache-tomcat-9.0.73/bin
chmod u+x *.sh

ln -s /opt/apache-tomcat-9.0.73/bin/startup.sh /usr/bin/startTomcat
ln -s /opt/apache-tomcat-9.0.73/bin/shutdown.sh /usr/bin/stopTomcat



Login as a root user
sudo su -
cd /opt
yum install tar wget -y
wget http://download.sonatype.com/nexus/3/nexus-3.15.2-01-unix.tar.gz
tar -zxvf nexus-3.15.2-01-unix.tar.gz
mv /opt/nexus-3.15.2-01 /opt/nexus

#As a good security practice, Nexus is not advised to run nexus service as a root user, so create a new user called nexus and grant sudo access to manage nexus services as follows.
 
useradd nexus

#Give the sudo access to nexus user

visudo
nexus ALL=(ALL) NOPASSWD: ALL

#Change the owner and group permissions to /opt/nexus and /opt/sonatype-work directories.

chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/sonatype-work
chmod -R 775 /opt/nexus
chmod -R 775 /opt/sonatype-work

#Open /opt/nexus/bin/nexus.rc file and  uncomment run_as_user parameter and set as nexus user.

vi /opt/nexus/bin/nexus.rc
run_as_user="nexus"

#Create nexus as a service

ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

#Switch as a nexus user and start the nexus service as follows.

sudo su - nexus

#Enable the nexus services
sudo systemctl enable nexus

#Start the nexus service
sudo systemctl start nexus
