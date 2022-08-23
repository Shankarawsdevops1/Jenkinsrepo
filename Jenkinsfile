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
                 
                 dir("boxfuse-sample-java-war-hello"){script {checkout_git.checkout_git("boxfuse-sample-java-war-hello","master")}}
                
                
            }
        }
        
        stage('create tag on git repo') {
            steps {                                
                 dir("boxfuse-sample-java-war-hello") {                        
                script {create_tag.create_tag("${tag}")}                
                 }
            }
        }
        
        stage('aws code build') {
            steps {
                 
                                      
                 dir("boxfuse-sample-java-war-hello"){script {awscodebuild.awscodebuild("java-project-2", "${tag}")}}
                 
                
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