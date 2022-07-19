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
                
                     parallel (
                "1": {dir("java-hello-world-with-maven"){script {checkout_git.checkout_git("java-hello-world-with-maven","master")}}},
                "2": {dir("sparkjava-war-example"){script {checkout_git.checkout_git("sparkjava-war-example","master")}}},
                "3": {dir("hello-world-war"){script {checkout_git.checkout_git("hello-world-war","master")}}}
                )
                
            }
        }
        
        
        stage('aws code build') {
            steps {
                 
                     parallel (
                "1": {dir("java-hello-world-with-maven"){script {awscodebuild.awscodebuild("java-project-2", "${tag}")}}},
                "2": {dir("sparkjava-war-example"){script {awscodebuild.awscodebuild("java-project-4", "${tag}")}}},
                "3": {dir("hello-world-war"){script {awscodebuild.awscodebuild("java-project-5", "${tag}")}}}
                )
            }
        } 
    } 
    
}