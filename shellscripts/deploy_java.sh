tag=$1
env=$2
IP=`grep $env env.properties | cut -d ':' -f2 |tr -d "[:space:]"`
echo $IP
#mkdir /var/lib/jenkins/deploy
cd /var/lib/jenkins/deploy
/usr/bin/aws s3 cp s3://shankar-gajula/${tag}/java-code-1/hello-1.0.war .
scp  hello-1.0.war ubuntu@${IP}:/home/ubuntu/tomcat/apache-tomcat-9.0.75/webapps
ssh ubuntu@${IP} << HERE
    rm -rf /home/ubuntu/tomcat/apache-tomcat-9.0.75/work
    cd /home/ubuntu/tomcat/apache-tomcat-9.0.75/bin/
    ./shutdown.sh
    ./startup.sh

HERE