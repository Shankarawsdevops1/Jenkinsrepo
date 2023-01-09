def deploy_tomcat(String tag, String env) {
    
    echo "deploying to tomcat server."
   sh """
      cd ${WORKSPACE}/shellscripts
      /bin/bash ./deploy_java.sh ${tag} ${env}
      """      

}

return this