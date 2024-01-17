pipeline {
    agent any
    stages {
        
    stage('Build') {
            steps {
                sh 'npm install --production'
                sh 'tar -cvf netcomlearing.tar ./*'
                sshagent(['netcomlearing']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@52.66.199.167 "rm -rf /home/ubuntu/netcomlearing/* "'
                    sh 'scp -o StrictHostKeyChecking=no  ./netcomlearing.tar ubuntu@52.66.199.167:/home/ubuntu/netcomlearing '
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@52.66.199.167 "tar -xvf /home/ubuntu/netcomlearing/netcomlearing.tar -C /home/ubuntu/netcomlearing"'
}
                    
            }
        }

    stage('Deploy') {
            steps {
            
                sshagent(['netcomlearing']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@52.66.199.167 "pm2 reload all"  '
}
                    
            }
        }
    
}
}
