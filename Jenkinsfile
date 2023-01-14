node{
    
    stage('Clone repo'){
        git credentialsId: 'github-secret', url: 'https://github.com/matriix00/Java-webapp-tomcat-Jenkins-AWS-Terraform-Ansible.git'
    }
    
    stage('Maven Build'){
        def mavenHome = tool name: "maven", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }
    
//     stage('SonarQube analysis') {       
//         withSonarQubeEnv('sonar-app') {
//         def mavenHome = tool name: "maven", type: "maven"
//         def mavenCMD = "${mavenHome}/bin/mvn"
//        	sh "${mavenCMD} sonar:sonar"    	
//     }
// }
// deploy to tomcat9 
stage ('Deploy') {
        script {
          deploy adapters: [tomcat9(credentialsId: 'tomcat-secret', path: '', url: 'http://3.137.173.118:8080/')], contextPath: 'java-web-app', onFailure: false, war: 'target/*.war' 
        }
      
    }        
//     stage('upload war to nexus'){
// 		nexusArtifactUploader artifacts: [	
// 			[
// 				artifactId: '01-maven-web-app',
// 				classifier: '',
// 				file: 'target/01-maven-web-app.war',
// 				type: "war",
// 			]	
// 		],
// 		credentialsId: 'nexus-secrets',
// 		groupId: 'in.mego',
// 		nexusUrl: '54.174.47.242:8081/',
// 		protocol: 'http',
// 		repository: 'simpleapp-release'
// 		version: '1.0.0'
	
// }
    
    stage('Build Image'){
        sh ' docker build -t magdy79/mavenwebapp .'
    }
    
    stage('Push Image'){
        withCredentials([string(credentialsId: 'docker-credentials', variable: 'pass')]) {
            sh ' docker login -u magdy79 -p ${pass}'
        }
        sh ' docker push magdy79/mavenwebapp'
    }
    
//     stage('Deploy App'){
//         kubernetesDeploy(
//             configs: 'maven-web-app-deploy.yml',
//             kubeconfigId: 'Kube-Config'
//         )
//     }    
//}
}
