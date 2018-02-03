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
            echo 'Version detected'
          }
        }
        stage('Snapshot') {
          when {
            environment name: 'createTag', value: ''
          }
          steps {
            sh 'echo "Snapshot detected"'
          }
        }
      }
    }
  }
  parameters {
    string(name: 'createTag', defaultValue: '', description: '')
    string(name: 'head', defaultValue: '', description: '')
    booleanParam(name: 'isCreate', defaultValue: false)
  }
}