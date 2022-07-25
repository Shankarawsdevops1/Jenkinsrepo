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
                 
                 dir("war-web-project"){script {checkout_git.checkout_git("war-web-project","master")}}
                
                
            }
        }
        
        stage('create tag on git repo') {
            steps {                                
                 dir("war-web-project") {                        
                script {create_tag.create_tag("${tag}")}                
                 }
            }
        }
        
        stage('aws code build') {
            steps {
                 
                                      
                 dir("war-web-project"){script {awscodebuild.awscodebuild("java-project-7", "${tag}")}}
                 
                
            }
        } 


      
        stage('deploy java to tomcat') {
            steps {
                     sh "echo env is ${ENVIRONMENT} "
                    script {deploy_tomcat.deploy_tomcat("${tag}", "${ENVIRONMENT}")}
                
            }
        }   
    } 

    
}