pipeline {
    agent any

    environment {
        ARM_CLIENT_ID = credentials('AZURE_CLIENT_ID')
        ARM_CLIENT_SECRET = credentials('AZURE_CLIENT_SECRET')
        ARM_SUBSCRIPTION_ID = credentials('AZURE_SUBSCRIPTION_ID')
        ARM_TENANT_ID = credentials('AZURE_TENANT_ID')
        SONARQUBE_TOKEN = credentials('SONARQUBE_TOKEN_JENKINS')
        SONAR_HOST_URL = 'http://172.190.129.129:9000' // Set your actual SonarQube server URL here
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ola-11/Terraform-Pipeline-Azure.git', credentialsId: 'github-token1'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh 'sonar-scanner \
                        -Dsonar.projectKey=TerraformProject \  // Replace with a unique project name
                        -Dsonar.sources=. \
                        -Dsonar.host.url=$SONAR_HOST_URL \
                        -Dsonar.login=$SONARQUBE_TOKEN'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Validate Terraform Configuration') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply tfplan'
            }
        }

        stage('Unit Testing') {
            steps {
                echo 'Running unit tests (add actual test scripts here).'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed. Log and metric monitoring here.'
        }

        success {
            echo 'Infrastructure deployed successfully!'
        }

        failure {
            echo 'Infrastructure deployment failed.'
        }
    }
}
