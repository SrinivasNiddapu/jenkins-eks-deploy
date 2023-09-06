#!/usr/bin/env groovy#
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Deploy Application") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name LabCluster"
                        sh "kubectl apply -f nginx-deployment.yaml"
                    }
                }
            }
        }
        stage("Create a LoadBalancer") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}