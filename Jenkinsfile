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
            echo "${params.head}"
          }
        }
        stage('Snapshot') {
          when {
            environment name: 'createTag', value: ''
          }
          steps {
            echo "${params.head}"
          }
        }
      }
    }
  }
  parameters {
    string(name: 'createTag', defaultValue: 'aaaa', description: 'asdfasdf')
    string(name: 'head', defaultValue: 'aaaa', description: '')
    booleanParam(name: 'isCreate', defaultValue: false)
  }
}