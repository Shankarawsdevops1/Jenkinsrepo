@Library('myLibrary') _
pipeline {
    agent any
    stages {
        
        stage('Hello World') {
            steps {
                script    
                {
                    hello.hello()
                }
            }
        }
        
        stage('Checkout code from Git') {
            steps {
                 
                 dir("sparkjava-war-example"){script {checkout_git.checkout_git("sparkjava-war-example","master")}}
                
                
            }
        }
        
        stage('create tag on git repo') {
            steps {                                
                 dir("sparkjava-war-example") {                        
                script {create_tag.create_tag("${tag}")}                
                 }
            }
        }
        
        stage('aws code build') {
            steps {
                 
                                      
                 dir("sparkjava-war-example"){script {awscodebuild.awscodebuild("project", "${tag}")}}
                 
                
            }
        } 


      
        stage('deploy java to tomcat') {
            steps {
                     sh "echo env is ${ENVIRONMENT} "
                    script {deploy_tomcat.deploy_tomcat("${tag}", "${ENVIRONMENT}")}
                
            }
        }   
    } 
    
 post {
        
        success {
             //sh 'echo "This Build is succesfull." | mailx -vvv -s "Build Status" devopsawsmorning@gmail.com'
             sh 'echo "Hi, Build is successful. Please check the below logs for the same." | mailx -vvv -s "Build logs for ${JOB_NAME}" -a /var/lib/jenkins/jobs/${JOB_NAME}/builds/${BUILD_NUMBER}/log "awsdevops293@gmail.com"'
             //emailext attachLog: true, body: 'This is My test mail', subject: 'Test Mail', to: 'devopsawsmorning@gmail.com'
             }
        failure {
            sh 'echo "Hi, Build is Failure. Please check the below logs for the same." | mailx -vvv -s "Build logs for ${JOB_NAME}" -a /var/lib/jenkins/jobs/${JOB_NAME}/builds/${BUILD_NUMBER}/log "awsdevops293@gmail.com"'
             //sh 'echo "This Build is Failed." | mailx -vvv -s "Build Status" devopsawsmorning@gmail.com'
             }
        }       
    
}