pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    tools{
        maven 'maven_3_9_2'
    }
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages{
        stage("Build Maven"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yildirim7mustafa/Devops-Project']])
                sh 'mvn clean install'
            }
        }
        stage("Build docker image"){
            steps{
                 sh 'docker build -t yildirim7mustafa/devops-integration:v33 .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                
      }
    }
        stage('Push') {
      steps {
        sh 'docker push yildirim7mustafa/devops-integration:v33'
      }
    }

        stage('deploy') {
      steps {
        sh 'kubectl rollout restart deployment/spring-boot-k8s -n spring-boot-test'
      }
    }
        
    }
      post {
        always {
            sh 'docker logout'
    }
  }
}
