/* node {
    checkout scm

    def customImage = docker.build("my-image:${env.BUILD_ID}")

    customImage.inside {
        sh 'make test'
    }
}*/

pipeline {
  environment {
    registry = "gustavoapolinario/docker-test"
    registryCredential = ‘dockerhub’
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/jitmailid/ranjit-helmchart-testing.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
