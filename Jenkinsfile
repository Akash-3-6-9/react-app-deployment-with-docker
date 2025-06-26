pipeline {
  agent any

  environment {
    DOCKER_CREDS = credentials('docker-hub-creds')
  }

  stages {
    stage('Build and Push Docker Image') {
      steps {
        sh '''
          echo "$DOCKER_CREDS_PSW" | docker login -u "$DOCKER_CREDS_USR" --password-stdin
          chmod +x build.sh
          ./build.sh
        '''
      }
    }
  }
}
