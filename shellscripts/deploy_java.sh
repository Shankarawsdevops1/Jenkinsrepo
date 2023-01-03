#!/bin/bash
tag=$1
env=$2
IP=`grep $env env.properties | cut -d ':' -f2 |tr -d "[:space:]"`
mkdir /var/lib/jenkins/anu
cd /var/lib/jenkins/anu
aws s3 cp s3://shankar-gajula/java-code-3/$tag/sparkjava-hello-world-1.0.war .
scp sparkjava-hello-world-1.0.war ec2-user@${IP}:/home/ec2-user/tomcat/apache-tomcat-9.0.70/webapps
ssh ec2-user@${IP} << HERE
    rm -rf /home/ec2-user/tomcat/apache-tomcat-9.0.70/work
    cd /home/ec2-user/tomcat/apache-tomcat-9.0.70/bin/
    ./shutdown.sh
    ./startup.sh
HERE 