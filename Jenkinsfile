node {
  stage('CHECKOUT'){
    checkout scm
  }

  stage('BUILD'){
    steps {
      figlet 'Build'
      script {
        sh "set -x; chmod +x gradlew"
        sh "./gradlew clean build"
      }
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

  stage('Test'){
    sh "./gradlew clean test"
  }
}
