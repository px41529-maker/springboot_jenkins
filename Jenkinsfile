pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/px41529-maker/springboot_jenkins.git'
            }
        }

        stage('Build') {
            steps {
                sh 'java -version'
                sh 'mvn -version'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t springbootapi .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f springbootapi-container || true
                    docker run -d --name springbootapi-container -p 9090:5000 springbootapi
                '''
            }
        }
    }
}
