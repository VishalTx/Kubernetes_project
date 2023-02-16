node {
    stage('Git Checkout'){
        
        
         git branch: 'main', url: 'https://github.com/VishalTx/Kubernetes_project.git'
        
    }
    
    stage ('Sending Dockerfile to Ansible Server'){
        sshagent(['ansible']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140'
            sh 'scp /var/lib/jenkins/workspace/test/* ubuntu@172.31.2.140:/home/ubuntu'
    }
        }
     stage ('Build Docker Image'){
        sshagent(['ansible']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140 cd /home/ubuntu/ '
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140 docker build -t $JOB_NAME:v1.$BUILD_ID .'
        } 
    }
}
     