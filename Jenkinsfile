pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-northeast-1'
        ECR_REPOSITORY = '406579089625.dkr.ecr.ap-northeast-1.amazonaws.com/cloudnativeshop'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Tools') {
            steps {
                sh 'java -version'
                sh 'mvn -version'
                sh 'docker --version'
                sh 'aws --version'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t cloudnativeshop:latest .'
            }
        }

        stage('ECR Login') {
            steps {
                sh '''
                    aws ecr get-login-password --region $AWS_REGION | \
                    docker login --username AWS --password-stdin $ECR_REPOSITORY
                '''
            }
        }

        stage('Docker Tag') {
            steps {
                sh '''
                    docker tag cloudnativeshop:latest \
                    $ECR_REPOSITORY:latest
                '''
            }
        }

        stage('Push to ECR') {
            steps {
                sh '''
                    docker push $ECR_REPOSITORY:latest
                '''
            }
        }
    }

    post {
        success {
            echo 'CI Pipeline completed successfully!'
        }

        failure {
            echo 'CI Pipeline failed. Check the console output.'
        }
    }
}
