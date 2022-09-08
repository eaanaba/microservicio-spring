pipeline {
  agent any
  options {
    skipStagesAfterUnstable()
  }
  stages {
    stage('CHECKOUT') {
      steps {
        checkout scm
      }
    }

    stage('BUILD') {
      steps {
        sh "set -x; chmod +x gradlew"
        sh "./gradlew clean build"
      }
    }
    
    // stage('CODE REVIEW'){
    //   steps {
    //     withCredentials([string(credentialsId: 'sonarcloud', variable: 'SONARPAT')]) {
    //       figlet 'SAST-SONARCLOUD'
    //       sh('set +x; ./gradlew sonarqube -Dsonar.login=$SONARPAT -Dsonar.branch.name=feature-jenkins')
    //     }
    //   }
    // }

    // stage('DEPLOY'){
    //   sh "./gradlew clean test"
    // }

    stage('Test') {
      steps {
        sh "./gradlew clean test"
      }
    }
  }
}
