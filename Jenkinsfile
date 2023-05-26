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
                 
                 dir("java-hello-world-with-maven"){script {checkout_git.checkout_git("java-hello-world-with-maven","master")}}
                
                
            }
        }
        
        stage('create tag on git repo') {
            steps {                                
                 dir("java-hello-world-with-maven") {                        
                script {create_tag.create_tag("${tag}")}                
                 }
            }
        }
        
        stage('aws code build') {
            steps {
                 
                                      
                 dir("java-hello-world-with-maven"){script {awscodebuild.awscodebuild("java-project-2", "${tag}")}}
                 
                
            }
        } 

          

       
    } 
    
  
    
}