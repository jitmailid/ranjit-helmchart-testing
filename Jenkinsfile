/*node {
    stage('Create Docker Image') {
    checkout scm

    docker.withRegistry('https://github.com/jitmailid/ranjit-helmchart-testing.git') {

        docker.image('my-custom-image').inside {
            sh 'make test'
        }
    }
    }
}*/
pipeline {
    agent {
        docker { image 'node:14-alpine' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
