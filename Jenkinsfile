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
    stage('Docker Image Tagging'){
        sshagent(['ansible']){
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140 cd /home/ubuntu/ '
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140 docker image tag $JOB_NAME:v1.$BUILD_ID vishal7500/$JOB_NAME:v1.$BUILD_ID '
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140 docker image tag $JOB_NAME:v1.$BUILD_ID vishal7500/$JOB_NAME:latest '
        }
        
    }
    stage ('Docker Image Push'){
        sshagent(['ansible']){
            withCredentials([string(credentialsId: 'dockerhub_passwd', variable: 'dockerhub_passwd')]) {
                
                sh "docker login -u vishal7500 -p ${dockerhub_passwd}"
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140 cd /home/ubuntu/ '
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140 docker push vishal7500/$JOB_NAME:v1.$BUILD_ID'
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.2.140 docker  push  vishal7500/$JOB_NAME:latest '
            
            }
        }
    }
}
     