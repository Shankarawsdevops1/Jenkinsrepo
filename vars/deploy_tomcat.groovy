def deploy_tomcat(String tag, String env) {
    
    echo "deploying to tomcat server."
   sh """
      cd ${WORKSPACE}/shellscripts
      sh ./deploy_java.sh ${tag} ${env}
      """      

}

return this