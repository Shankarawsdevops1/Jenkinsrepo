def deploy_tomcat(String tag, String env) {
    
    echo "deploying to tomcat server."
   sh """
      cd ${WORKSPACE}/shellscripts
      chmod 700 deploy_java.sh
      sed -i 's/\r//g' deploy_java.sh
      ./deploy_java.sh ${tag} ${env}
      """      

}

return this