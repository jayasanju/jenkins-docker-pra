node {
    def dockerCredentialsId = 'akki'
    def dockerImageName = "konthamjaya/nginx"
    def dockerImageTag = "latest"
    def dockerHubRegistry = 'https://index.docker.io/v1/'
    
 
    stage('Checkout Code') {
        git 'https://github.com/jayasanju/jenkins-docker-pra.git'
    }
 
   stage('Build and Push Docker Image') {
        withCredentials([[$class: 'SecretTextBinding', credentialsId: 'akki', variable: 'DOCKER_HUB_TOKEN']]) {
            sh "docker login -u _token -p ${DOCKER_HUB_TOKEN}"
            script {
                docker.withRegistry(dockerHubRegistry, dockerCredentialsId ) {
                    def customImage = docker.build("${dockerImageName}:${dockerImageTag}", ".")  // Specify the Dockerfile location as "."
                    customImage.push()
                }
            }
        }
}
}
