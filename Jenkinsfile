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
            sh 'echo $GIT_URL'
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