 #!/bin/bash
mkdir /var/lib/jenkins/workspace
cd /var/lib/jenkins/workspace
aws s3 cp s3://shankar-gajula/java-code-1/$tag/hello-world-0.0.1-SNAPSHOT.war .
scp hello-world-0.0.1-SNAPSHOT.war ec2-user@ 14.0.0.107:/home/ec2-user/apache-tomcat-9.0.70/webapps
ssh ec2-user@14.0.0.107  << HERE
    rm -rf /home/ec2-user/apache-tomcat-9.0.70/work
    cd /home/ec2-user/apache-tomcat-9.0.70/bin/
    ./shutdown.sh
    ./startup.sh
HERE