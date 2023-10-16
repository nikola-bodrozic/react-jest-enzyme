pipeline {
    agent {
        docker {
            image 'node:lts-alpine'
            args '-p 3000:3000'
        }
    }

    environment {
        DOCKER_REGISTRY_CREDENTIALS = 'fc403e71-45cc-4962-a275-a2aad4d18e0b'
        DOCKER_REGISTRY_USERNAME = 'nikolabod'
        DOCKER_REGISTRY = 'index.docker.io'
        DOCKER_REGISTRY_URL = "https://${DOCKER_REGISTRY}/v1/"
        PROJECT_IMAGE = "${DOCKER_REGISTRY}/${DOCKER_REGISTRY_USERNAME}/react-app"

        GIT_COMMIT = ' '

        HOME = '.'
        npm_config_cache = 'npm-cache'
    }

    stages {

        stage('Checkout from Git') {
            steps {
                sh "whoami"
                script {
                    GIT_COMMIT = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
                    echo "the commit is ${GIT_COMMIT}"
                }
            }
        }

        stage('SonarQube analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarQube';
                    withSonarQubeEnv('SonarQube') {
                        sh "${scannerHome}/bin/sonar-scanner \
                  -D sonar.projectKey=react \
                  -D sonar.host.url=http://sonarqube:9000/"
                    }
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building...'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'CI=true npm test'
            }
        }
        // stage('Publish Image') {
        //   steps {
        //     withDockerRegistry(credentialsId: DOCKER_REGISTRY_CREDENTIALS, url: DOCKER_REGISTRY_URL) {
        //       sh "docker push ${PROJECT_IMAGE}:${GIT_COMMIT}"
        //     }
        //   }
        // }
    }

    post {
        success {
            echo 'done'
        }
        always {
            deleteDir()
        }
        failure {
            echo 'send warning about broken build'
        }
    }
}