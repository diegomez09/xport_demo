pipeline {
    agent any
    stages{
        stage("A"){
            steps{
                echo "========executing A========"
                checkout scm
                }
            stage('Build image') {
                /* This builds the actual image */
                if(env.BRANCH_NAME  =="master"){
                app = docker.build("diegomezg/web_server:latest")
	        }
	    stage('Push image'){
            if(env.BRANCH_NAME  =="test"){
            app = docker.build("diegomezg/web_server:release")
        } 
	}
	    
    }
stage('Push image') {
    steps{
        echo 'branch name ' + env.BRANCH_NAME
	    if(env.BRANCH_NAME  =="master"){
        /*  pushing images todockerhub*/
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub')
                echo "Trying to Push Docker Build to DockerHub"
        }
           }
}