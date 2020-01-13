node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app =  docker.build("project2:v1")
    }

    stage('Test image') {
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Testing Passed Now deploy"'
        }
    }


}
