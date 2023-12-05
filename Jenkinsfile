pipeline {
    agent any
    environment {
    containerName = "mydemoapp"
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        
    stage('Build and Push') {
            steps {
                sh 'docker build -t thisissonu3618/mydemoapp:$BUILD_NUMBER .'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push thisissonu3618/mydemoapp:$BUILD_NUMBER'
            }
        }
    stage('Deploy') {
            steps {
                sh 'docker stop $containerName || true && docker rm -f $containerName || true'
                sh 'docker run -itd -p 3000:3000 --name $containerName thisissonu3618/mydemoapp:$BUILD_NUMBER'
            }
        }    
    }
     post {
    always {
      sh 'docker logout'
      mail bcc: '', body: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', cc: '', from: '', replyTo: '', subject: 'jenkins', to: 'email2sonuy@gmail.com'
      }
   }
}

