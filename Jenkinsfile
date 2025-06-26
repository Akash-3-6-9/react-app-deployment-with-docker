pipeline {
  agent any

  environment {
    DOCKER_CREDS = credentials('docker-hub-creds')  // 👈 this binds username and password
  }

  stages {
    stage('Run build') {
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
