pipeline {
  // agent any
  agent {
    docker { image 'openjdk:18-slim', args '-v $HOME/.m2:/root/.m2' }
  }
  environment {
    DOCKER_HUB_CREDS = credentials('docker-hub-creds')
  }
  options {
    skipStagesAfterUnstable()
  }
  stages {
    stage('CHECKOUT') {
      steps {
        checkout scm
        sh "git checkout feature-ms-eduardoAnabalon-mensaje"
      }
    }

    stage('BUILD') {
      steps {
        echo "BUILDING APP"
        sh "set -x; chmod +x gradlew"
        sh "./gradlew build -x jacocoTestReport test"

        echo "RUN TEST!"
        sh "./gradlew jacocoTestReport"

        echo "CHECK COVERAGE > 85%"
        sh "./gradlew jacocoTestCoverageVerification"
      }
    }
    
    stage('CODE REVIEW'){
      steps {
        sh "./gradlew sonarqube -Dsonar.branch.name=feature-ms-eduardoAnabalon-mensaje"
      }
    }

    stage('DEPLOY'){
      echo "BUILDING DOCKER IMAGE"
      sh "./gradlew docker"
      sh "./gradlew dockerTagDockerHub"

      echo "PUSHING TO DOCKER HUB"
      sh "docker login -u ${DOCKER_HUB_CREDS_USR} -p ${DOCKER_HUB_CREDS_PSW}"
      sh "./gradlew dockerPushDockerHub"
    }
  }
}
