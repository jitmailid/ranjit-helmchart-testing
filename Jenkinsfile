/* node {
    checkout scm

    def customImage = docker.build("my-image:${env.BUILD_ID}")

    customImage.inside {
        sh 'make test'
    }
}*/
 //docker push ${IMAGE}:${VERSION}
pipeline {
  environment {
    /*registry = "gustavoapolinario/docker-test"
    registryCredential = ‘dockerhub’ */
      IMAGE = "my-image"
      VERSION = '1.0'
      VALIDATION_COMPLETE = false
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/jitmailid/ranjit-helmchart-testing.git'
      }
    }
   /* stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }*/
       /*stage('Build docker image') {
             steps {
                sh '''
                    docker build -t ${IMAGE} .
                    docker tag ${IMAGE} ${IMAGE}:${VERSION}
                   
                '''
             }
       }*/
      stage('Build docker image') {
             steps {
                sh '''
                    docker build -t ${IMAGE}:${VERSION} .
                    
                '''
             }
       }
      stage('Creation of Docker Container'){
          steps{
              sh '''
                 
                  docker run --name test-helm-chart -d ${IMAGE}:${VERSION} sleep infinity
                  docker cp ${WORKSPACE}/ct/ test-helm-chart:data/
                  docker cp ${WORKSPACE}/etc/ test-helm-chart:data/
                  docker cp ${WORKSPACE}/templates/ test-helm-chart:data/
                  docker cp ${WORKSPACE}/Chart.yaml test-helm-chart:data/
                  docker cp ${WORKSPACE}/values.yaml test-helm-chart:data/
                  docker cp ${WORKSPACE}/values.schema.json test-helm-chart:data/
                  
              '''
          }
      }
      stage('Generic validation of helm chart'){
          failFast true
          parallel {
          stage(' validation') {
          steps{
              
              sh "helm template ${WORKSPACE} | tee output.log "
              sh "helm lint ${WORKSPACE}/values.yaml | tee output.log "
              sh "| grep 'ERROR' output.log"
              script{
                  VALIDATION_COMPLET = true
              }
              echo "wow done"
                  
             
          }
          } // end of stage within parallel
              stage(' Monitoring validation logs ') {
          steps{
              script{
                  while(VALIDATION_COMPLET != true){
                   sh ' | grep "ERROR" output.log'
                  }
              }
          }
          } // end of stage within parallel
      } //Parallel end 
      }
  }
}
