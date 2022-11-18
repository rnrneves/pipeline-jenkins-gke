pipeline {
    agent any

    stages {
        stage('Checkout Source') {
            steps {
                git url:'https://github.com/rnrneves/pipeline-jenkins-gke.git', branch: 'main'
            }
        }
    
        stage('Build Image') {
            steps {
                script {
                    dockerapp = docker.build("rnrneves/app-cli:${env.BUILD_ID}",
                    '-f ./Dockerfile .')

                }
                
            }
        }

        stage('Push Image') {
            steps {
                script {
                        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")  
                    }

                }
                
            }
        } 
        stage('Deploy Kubernetes') {
            agent {
                kubernetes{
                    cloud 'kubernetes'
                }
            }
            environment{
                tag_version = "${env.BUILD_ID}"
            }
            steps {
                script {
                    sh 'sed -i "s/{{tag}}/$tag_version/g" ./Deployment-app.yaml'
                    sh  'cat ./Deployment-app.yaml'
                    kubernetesDeploy(configs: '**/app-cli/**', kubeconfigId: 'kubeconfig')
                }
            }
        }
    }
    
}