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
    
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
