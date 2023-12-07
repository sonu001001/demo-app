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
                sh 'yq'
               // sh 'docker-compose down'
                //sh "sed -i 's\mydemoapp:version\mydemoapp:$BUILD_NUMBER\g' docker-compose.yaml"
                //sh 'docker-compose up -d'
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

