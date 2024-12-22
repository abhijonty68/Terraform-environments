pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_CREDENTIALS')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_CREDENTIALS')
    }
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Choose the environment')
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/abhijonty68/Terraform-environments.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh '''
                terraform init -reconfigure \
								-backend-config="bucket=abhishekjonty121" \
                               -backend-config="key=env/${ENVIRONMENT}/terraform.tfstate" \
                               -backend-config="region=ap-south-1" \
                               -backend-config="dynamodb_table=terraform-lock-table"
                '''
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan -var-file=${ENVIRONMENT}.tfvars
                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply -auto-approve -var-file=${ENVIRONMENT}.tfvars
                '''
            }
        }
    }
}
