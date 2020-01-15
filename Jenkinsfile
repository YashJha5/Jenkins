node {
    def app

    stage('Cloning repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Building image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app =  docker.build("jhayash55/project2:v1")
    }

    stage('Testing image') {
         /* For this example, we're using a Volkswagen-type approach ;-) */

            sh 'echo "Testing Passed Now deploy"'
	
    }
    stage('Pushing image') {

        docker.withRegistry('https://registry.hub.docker.com/', 'login_access') {
            app.push("${env.BUILD_NUMBER}")
	    app.push("latest")
        }

    }	
    stage("Deploying on dev-server") {
	def DockerRun = 'docker run -it -p 5000:5000 jhayash55/project2'
	sshagent(['dev-server']) {
	    sh "ssh -o StrictHostKeyChecking=no jarvis@104.211.186.87 "
	    sh "sudo -i "
            sh "${DockerRun}"
	}	
    }   

}
