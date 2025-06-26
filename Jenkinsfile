pipeline {
  agent any

  environment {
    DOCKER_USERNAME = credentials('docker-hub-creds').username
    DOCKER_PASS     = credentials('docker-hub-creds').password
  }

  stages {
    stage('Set permissions') {
      steps {
        sh 'chmod +x build.sh'
      }
    }

    stage('Run build') {
      steps {
        sh '''
          echo "$DOCKER_PASS" | docker login -u "$DOCKER_USERNAME" --password-stdin
          ./build.sh
        '''
      }
    }
  }
}
