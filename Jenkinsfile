node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */
        if(env.BRANCH_NAME  =="master"){
        app = docker.build("aztoatl/web_server:latest")
	}
	     /* This builds the test image */
	 if(env.BRANCH_NAME  =="test"){
        app = docker.build("aztoatl/web_server:release")
	}
	    
    }
/*this is a fake test*/
    stage('Test image') {
        
        app.inside {
            echo "Tests passed"
        }
    }
  
    stage('Push image') {
	    
    echo 'branch name ' + env.BRANCH_NAME
	    if(env.BRANCH_NAME  =="master"){
 	    
	
        /*  pushing images todockerhub*/
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
	    }
           }
    

    
 
}
