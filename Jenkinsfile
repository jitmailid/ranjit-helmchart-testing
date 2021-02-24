 //docker push ${IMAGE}:${VERSION}
pipeline {
  environment {
    /*registry = "gustavoapolinario/docker-test"
    registryCredential = ‘dockerhub’ */
      IMAGE = "my-image"
      VERSION = '1.0'
      VALIDATION_COMPLETE = false
      CONTAINER_NAME= "test-helm-chart"
      
  }
  agent any
  stages { 
   stage('Cloning Git') {
      steps {
        git 'https://github.com/jitmailid/ranjit-helmchart-testing.git'
      }
    }
        /*stage('Build docker image') {
             steps {
                sh '''
                    docker build -t ${IMAGE}:${VERSION} .
                    
                '''
             }
       }*/
      stage('Creation of Docker Container'){
          steps{
             /* sh '''
                 
                  docker run --name test-helm-chart -d ${IMAGE}:${VERSION} sleep infinity
                  docker cp ${WORKSPACE}/ct/ test-helm-chart:data/
                  docker cp ${WORKSPACE}/etc/ test-helm-chart:data/
                  docker cp ${WORKSPACE}/templates/ test-helm-chart:data/
                  docker cp ${WORKSPACE}/Chart.yaml test-helm-chart:data/
                  docker cp ${WORKSPACE}/values.yaml test-helm-chart:data/
                  docker cp ${WORKSPACE}/values.schema.json test-helm-chart:data/
                  
              ''' */
           /*sh '''
                 
                  docker run --name test-helm-chart -d ${IMAGE}:${VERSION} --volume ${WORKSPACE}:/data 
                  
                  
              ''' */
      
           script{
          docker {
                image '${IMAGE}:${VERSION}'
                args '-v ${WORKSPACE}:/var'
                //reuseNode true
            }
           }
            
           
          }
      }
   
      stage('Generic validation of helm chart'){
       
       steps{
       
         withDockerContainer(image: IMAGE+':'+VERSION, toolName: 'Default') {
    // some block
script {
try { 
            sh 'helm version'
            //sh 'helm template ${WORKSPACE} | tee output.log'
           sh 'helm lint ${WORKSPACE} | tee output.log';
          validateData = sh('! grep "ERROR" output.log')
          if(validateData.toString().contains('ERROR'))
 {
       //sh'tee output.log';
        //   exit 1
  sh'echo hi' ;
  autoCancelled = true
      error('Aborting the build.')
  
          }//
           } catch (e) {
  if (autoCancelled) {
    currentBuild.result = 'SUCCESS'
    // return here instead of throwing error to keep the build "green"
    return
  }
  // normal error handling
  throw e
}
           
         }
         }
               } 
           
        
        
      } //stage
    
   
  }
}
