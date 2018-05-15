pipeline {
  agent {
    node {
      label 'Jenkins-1'
    }

  }
  stages {
    stage('Test') {
      steps {
        resolveScm(source: [$class: 'SubversionSCMSource', credentialsId: '28770657-4737-42b7-8448-dbbbc143f50b', id: '_', remoteBase: 'https://repos.nextthought.com/svn/nti-svn/NextThoughtPlatform/'], targets: ['nti.dataserver-buildout'])
      }
    }
  }
}