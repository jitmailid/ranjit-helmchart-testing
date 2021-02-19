
  stage('Create Docker Image') {
    dir('webapp') {
      docker.build("ranjit/docker-jenkins-pipeline:${env.BUILD_NUMBER}")
    }
  }
