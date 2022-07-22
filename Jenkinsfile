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
                 
                 dir("hello-world-war"){script {checkout_git.checkout_git("hello-world-war","master")}}
                
                
            }
        }
        
        stage('create tag on git repo') {
            steps {                                
                 dir("tag_code") {                        
                script {create_tag.create_tag("${tag}")}                
                 }
            }
        }
        
        stage('aws code build') {
            steps {
                 
                                      
                 dir("hello-world-war"){script {awscodebuild.awscodebuild("java-project-6", "${tag}")}}
                 
                
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