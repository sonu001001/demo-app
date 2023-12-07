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
                sh 'docker-compose down'
                sh yq e -i '.services.app2.image = "thisissonu3618/mydemoapp:$BUILD_NUMBER"' docker-compose.yaml
                sh yq e -i '.services.app1.image = "thisissonu3618/mydemoapp:$BUILD_NUMBER"' docker-compose.yaml
                sh 'docker run -itd -p 3000:3000 --name $containerName thisissonu3618/mydemoapp:$BUILD_NUMBER'
            }
        }    
    }
     post {
    always {
      sh 'docker logout'
      emailext body: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', subject: 'test', to: 'email2sonuy@gmail.com'
      }
   }
}

