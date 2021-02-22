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
    /*stage('Cloning Git') {
      steps {
        git 'https://github.com/jitmailid/ranjit-helmchart-testing.git'
      }
    }
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
      }*/
      stage('Generic validation of helm chart'){
          failFast true
          parallel {
          stage(' validation') {
          steps{
              
              sh '''
              
                  ./helm template ${WORKSPACE} | tee output.log | grep "ERROR" output.log
                  
                  
              
              '''
          
              script{
                  VALIDATION_COMPLETE = true
              }
              echo "wow done"
                  
             
          }
          } // end of stage within parallel
              stage('Monitoring validation logs ') {
          steps{
              script{
                  while(VALIDATION_COMPLETE != true){
                   sh '''
                    grep "ERROR" output.log
                   
                   '''
                  }
              }
          }
          } // end of stage within parallel
      } //Parallel end 
      }
  }
}
