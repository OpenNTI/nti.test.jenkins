pipeline {
  agent any
  stages {
    stage('Version') {
      parallel {
        stage('Version') {
          when {
            not {
              environment name: 'createTag', value: ''
            }
            
          }
          steps {
            sh 'echo "work please god"'
          }
        }
        stage('Snapshot') {
          when {
            environment name: 'createTag', value: ''
          }
          steps {
            sh 'echo "work please god"'
          }
        }
      }
    }
  }
  parameters {
    string(name: 'createTag', defaultValue: '', description: 'asdfasdf')
    string(name: 'head', defaultValue: '', description: '')
    booleanParam(name: 'isCreate', defaultValue: false)
  }
}