pipeline {
    checkout scm
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'git --version'
                
            }
            
        }
        stage('Dockerr container') {
         def customImage = docker.build("my-image:${env.BUILD_ID}")

    customImage.inside {
        sh 'make test'
    }
        }
    }
}

    

   

