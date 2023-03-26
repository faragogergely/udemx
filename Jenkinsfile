pipeline{
  agent any
  environment {
		DOMAIN = "192.168.56.1"
  }
  stages{
    stage('Create selfsigned TLS certificate') {
      steps{
        sh './certs/ssl.sh "${DOMAIN}"'
        sh 'cp ./certs/${DOMAIN}.key ./Apache/server.key'
        sh 'cp ./certs/${DOMAIN}.crt ./Apache/server.crt'

    stage('Create image from Dockerfile') {
      steps{
        sh 'sudo docker build -t ${DOMAIN}:5000/httpd ./Apache'
    }
    }
    stage('Upload image to registry') {
      steps{
        sh 'sudo docker push ${DOMAIN}:5000/httpd'
      
      }
    }
    stage('Deploy webserver') {
      steps{
        sh 'sudo docker run -p 443:443 -d ${DOMAIN}:5000/httpd'
        
      }
    }
  }
}