pipeline {
    agent { label 'slave3' }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/muhmdshl/beginner-html-site-styled.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t html-site .'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker rm -f html-container || true'
                sh 'docker run -d --name html-container -p 99:80 html-site'
            }
        }
    }
    triggers {
        githubPush()
    }
}