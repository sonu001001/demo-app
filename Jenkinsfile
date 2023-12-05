// Define variable
def containerName = mydemoapp

pipeline {
    agent any
    environment {
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
      }
   }
}

