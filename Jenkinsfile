pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'Maven3'
    }

    environment {
        IMAGE_NAME = "prakash200407/springbootapi"
        IMAGE_TAG = "v1"
        CONTAINER_NAME = "springbootapi-container"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/px41529-maker/springboot_jenkins.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        
       /* stage('SonarQube Analysis') {
    steps {
        withSonarQubeEnv('SonarQube') {
            sh '''
            mvn sonar:sonar \
              -Dsonar.projectKey=sonar-key \
              -Dsonar.projectName=sonar-project
            '''
        }
    }
}
        stage('Quality Gate') {
    steps {
        timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }
    }
}
        
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t springbootapi:v1 .'
            }
        }

     /*  stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub1',
                    usernameVariable: 'prakash200407',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "prakash200407" --password-stdin
                    '''
                }
            }
        }

        stage('Push Image') {
            steps {
                sh '''
                docker tag prakash200407/springbootapi:v1 prakash200407/springboot_repository:latest
                docker push prakash200407/springboot_repository:latest
                '''
            }
        }
*/
        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f springbootapi-container || true
                    docker run -d \
                      --name springbootapi-container \
                      -p 9000:5000 \
                      springbootapi:v1
                '''
            }
        }
    }
}
