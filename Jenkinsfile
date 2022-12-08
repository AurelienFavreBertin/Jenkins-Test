node {
    def mvnHome = tool 'maven-3.5.2'
    def dockerImage
    def dockerImageTag = "devopsexample${env.BUILD_NUMBER}"
    
    stage('Clone Repo') {
      git 'https://github.com/AurelienFavreBertin/Jenkins-Test.git'
    }    
  
    stage('Build Project') {
      sh "'${mvnHome}/bin/mvn' -B -DskipTests clean package"
    }
    
    stage('Initialize Docker'){         
	  def dockerHome = tool 'MyDocker'         
	  env.PATH = "${dockerHome}/bin:${env.PATH}"     
    }
    
    stage('Build Docker Image') {
      sh "docker -H tcp://172.20.10.8:2376 build -t devopsexample:${env.BUILD_NUMBER} ."
    }
    
    stage('Deploy Docker Image'){
      	echo "Docker Image Tag Name: ${dockerImageTag}"
	sh "docker -H tcp://172.20.10.8:2376 run --name devopsexample -d -p 2222:2222 devopsexample:${env.BUILD_NUMBER}"
    }
}
