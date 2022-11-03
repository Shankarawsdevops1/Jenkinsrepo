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
    
  
    
}