pipeline {
    agent any
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        
    stage('Build and Push') {
            steps {
                sh 'docker build -t demo .'
                sh 'docker tag demo thisissonu3618/mydemoapp:$BUILD_NUMBER'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push thisissonu3618/mydemoapp:$BUILD_NUMBER'
            }
        }
    stage('Deploy') {
            steps {
                sh 'docker run -itd -p 3000:3000 thisissonu3618/mydemoapp:$BUILD_NUMBER'
            }
        }    
    }
     post {
    always {
      sh 'docker logout'
      }
   }
}

