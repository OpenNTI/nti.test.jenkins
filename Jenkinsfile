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
            sh 'echo version'
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
            sh 'echo snapshot'
          }
        }
        stage('Test') {
          steps {
            sh 'echo test'
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