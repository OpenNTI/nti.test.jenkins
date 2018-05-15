pipeline {
  agent {
    node {
      label 'Jenkins-1'
    }

  }
  stages {
    stage('Test') {
      steps {
        checkout([$class: 'SubversionSCM', additionalCredentials: [], excludedCommitMessages: '', excludedRegions: '', excludedRevprop: '', excludedUsers: '', filterChangelog: false, ignoreDirPropChanges: false, includedRegions: '', locations: [[cancelProcessOnExternalsFail: true, credentialsId: '28770657-4737-42b7-8448-dbbbc143f50b', depthOption: 'infinity', ignoreExternalsOption: true, local: '.', remote: 'https://repos.nextthought.com/svn/nti-svn/NextThoughtPlatform/trunk/nti.dataserver-buildout']], quietOperation: true, workspaceUpdater: [$class: 'UpdateUpdater']])
        sh 'ls'
      }
    }
  }
}