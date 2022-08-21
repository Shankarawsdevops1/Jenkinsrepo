 #!/bin/bash
tag=$1
env=$2

IP=`grep $env env.properties | cut -d ':' -f2 |tr -d "[:space:]"`

mkdir /var/lib/jenkins/deploy
cd /var/lib/jenkins/deploy
aws s3 cp s3://bucket-8/java-code1/$tag/hello-world-0.0.1-SNAPSHOT.war .
scp  hello-world-0.0.1-SNAPSHOT.war ec2-user@${IP}:/home/ec2-user/tomcat/apache-tomcat-9.0.65/webapps
ssh ec2-user@${IP} << HERE
    rm -rf /home/ec2-user/tomcat/apache-tomcat-9.0.65/work
    cd /home/ec2-user/tomcat/apache-tomcat-9.0.65/bin/
    ./shutdown.sh
    ./startup.sh
HERE