pipeline {
  agent {
    node {
      label 'Jenkins-1'
    }
    
  }
  stages {
    stage('Build') {
      parallel {
        stage('Version') {
          when {
            not {
              environment name: 'createTag', value: ''
            }
            
          }
          steps {
            sh 'git describe ${GIT_COMMIT}'
          }
        }
        stage('Snapshot') {
          when {
            anyOf {
              environment name: 'buildAsSnapshot', value: 'true'
              not {
                environment name: 'head', value: ''
              }
              
            }
            
          }
          steps {
            sh 'git describe ${GIT_COMMIT}'
          }
        }
        stage('Test') {
          steps {
            git(url: 'https://github.com/NextThought/nti.test.jenkins.git', branch: 'master', credentialsId: '46fab3b3-1edd-4298-bd5e-43a0b9648cc8')
          }
        }
      }
    }
  }
  parameters {
    string(name: 'createTag', defaultValue: '', description: '')
    string(name: 'head', defaultValue: '', description: '')
    booleanParam(name: 'buildAsSnapshot', defaultValue: false)
    booleanParam(name: 'isCreate', defaultValue: false)
  }
}