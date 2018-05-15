pipeline {
  agent {
    node {
      label 'Jenkins-1'
    }

  }
  stages {
    stage('Test') {
      steps {
        svn 'https://repos.nextthought.com/svn/nti-svn/NextThoughtPlatform/trunk/nti.dataserver-buildout'
        sh 'ls'
      }
    }
  }
}