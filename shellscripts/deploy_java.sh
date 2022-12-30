 #!/bin/bash
tag=$1
env=$2
IP=`grep $env env.properties | cut -d ':' -f2 |tr -d "[:space:]"`
mkdir /var/lib/jenkins/workspace
cd /var/lib/jenkins/workspace
aws s3 cp s3://shankar-gajula/java-code-1/$tag/hello-world-0.0.1-SNAPSHOT.war .
scp hello-world-0.0.1-SNAPSHOT.war ec2-user@${IP}:/home/ec2-user/tomcat/webapps
ssh ec2-user@${IP} << HERE
    rm -rf /home/ec2-user/tomcat/work
    cd /home/ec2-user/tomcat/bin/
    ./shutdown.sh
    ./startup.sh
HERE