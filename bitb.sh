
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
