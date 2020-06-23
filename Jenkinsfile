pipeline {
  agent {
    dockerfile {
     filename 'Dockerfile'
     reuseNode false
    }
  }
  stages {
    stage('TF Default DESTORY All WITH NETWORK') {
      steps {
	      withCredentials([[
	        $class: 'AmazonWebServicesCredentialsBinding',
	        credentialsId: 'newkeyjenkins',
	        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
	        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          dir ("${env.WORKSPACE}/project_cmdb_wb") {
            sh 'terraform init -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY} -input=false'
            sh 'terraform destroy -force -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY}'
          }
        }
       }
     }
   }
}
