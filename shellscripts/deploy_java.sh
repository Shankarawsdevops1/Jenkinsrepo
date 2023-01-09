#!/bin/bash
tag=$1
env=$2
IP=`grep $env env.properties | cut -d ':' -f2 |tr -d "[:space:]"`
echo $IP
mkdir /var/lib/jenkins/deploy
cd /var/lib/jenkins/deploy
/usr/bin/aws s3 ls
aws s3 cp s3://shankar-gajula/${tag}/java-code-2/hello-world-0.0.1-SNAPSHOT.war .
scp  hello-world-0.0.1-SNAPSHOT.war ec2-user@${IP}:/home/ec2-user/tomcat/apache-tomcat-9.0.70/webapps
ssh ec2-user@${IP} << HERE
    rm -rf /home/ec2-user/tomcat/apache-tomcat-9.0.70/work
    cd /home/ec2-user/tomcat/apache-tomcat-9.0.70/bin/
    ./shutdown.sh
    ./startup.sh

HERE