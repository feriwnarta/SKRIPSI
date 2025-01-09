pipeline {

  environment {
    dockerimagename = "feriwnarta/skripsi-app"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/feriwnarta/SKRIPSI.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

  }

}
