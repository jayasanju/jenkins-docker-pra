node {
    def dockerHubCredentials = 'dockercre'
    def dockerImageName = "konthamjaya/nginx"
    def dockerImageTag = "latest"
    def dockerHubRegistry = 'https://index.docker.io/v1/'
    
 
    stage('Checkout Code') {
        git 'https://github.com/jayasanju/jenkins-docker-pra.git'
    }
 
   stage('Build and Push Docker Image') {
        withCredentials([usernamePassword(credentialsId: 'dockercre', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
            sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
            script {
                docker.withRegistry(dockerHubRegistry, dockerCredentialsId ) {
                    def customImage = docker.build("${dockerImageName}:${dockerImageTag}", ".")  // Specify the Dockerfile location as "."
                    customImage.push()
                }
            }
        }
}
}

