pipeline {
  // agent any
  agent any
  environment {
    DOCKER_HUB_CREDS = credentials('docker-hub-creds')
  }
  options {
    skipStagesAfterUnstable()
  }
  stages {
    // stage('CHECKOUT') {
    //   steps {
    //     checkout scm
    //     sh "git checkout feature-ms-eduardoAnabalon-mensaje"
    //   }
    // }

    stage('BUILD') {
      steps {
        //echo "BUILDING APP"
        sh "set -x; chmod +x gradlew"
        sh "./gradlew clean"
        sh "./gradlew build -x jacocoTestReport test"

        // echo "RUN TEST!"
        sh "./gradlew jacocoTestReport"

        // echo "CHECK COVERAGE > 85%"
        sh "./gradlew jacocoTestCoverageVerification"
      }
    }
    
    stage('CODE REVIEW'){
      steps {
        sh "./gradlew sonarqube -Dsonar.branch.name=feature-ms-eduardoAnabalon-mensaje"
      }
    }

    stage('DEPLOY'){
      steps {
        // sh "docker login -u ${DOCKER_HUB_CREDS_USR} -p ${DOCKER_HUB_CREDS_PSW}"

        // echo "BUILDING DOCKER IMAGE"
        sh "docker build -t labfinal ."
        sh "docker image tag labfinal eaanaba/labfinal:0.0.1-SNAPSHOT"
        //sh "./gradlew docker"
        //sh "./gradlew dockerTagDockerHub"

        // echo "PUSHING TO DOCKER HUB"
        sh "docker image push eaanaba/labfinal:0.0.1-SNAPSHOT"
        // sh "./gradlew dockerPushDockerHub"
      }
    }
  }
}
