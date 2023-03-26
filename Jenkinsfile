pipeline{
  agent any
  environment {
		DOMAIN = "192.168.56.1"
  }
  stages{
    stage('Create selfsigned TLS certificate') {
      steps{
        sh './certs/ssl.sh "${DOMAIN}"'

    stage('Create image from Dockerfile') {
      steps{
        sh 'sudo docker build -t httpd ./Udemx/Apache'
    }
    }
    stage('Upload image to registry') {
      steps{
        sh 'sudo docker login ...'
        sh 'sudo docker push ...'
      
      }
    }
    stage('Deploy webserver') {
      steps{
        sh 'sudo docker run ...'
        
      }
    }
  }
}