def imageName = "halkeye/docker-starbound";
node {
  def app;
  stage('Checkout') {
    /* Checkout the code we are currently running against */
    checkout scm
  }

  stage('Build') {
    /* Build the Docker image with a Dockerfile, tagging it with the build number */
    app = docker.build "${imageName}:${env.BUILD_NUMBER}"
  }
}
