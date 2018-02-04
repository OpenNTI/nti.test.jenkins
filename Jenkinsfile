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
            sh '''echo

"$(params.createTag}"'''
          }
        }
        stage('Snapshot') {
          when {
            environment name: 'createTag', value: ''
          }
          steps {
            sh '''echo

"$(params.createTag}"'''
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