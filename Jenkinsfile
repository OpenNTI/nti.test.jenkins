pipeline {
  agent any
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
            echo "${params.createTag}"
          }
        }
        stage('Snapshot') {
          when {
            not {
              environment name: 'head', value: ''
            }
            
          }
          steps {
            echo "${params.head}"
          }
        }
        stage('Test') {
          when {
            allOf {
              environment name: 'createTag', value: ''
              environment name: 'head', value: ''
            }
            
          }
          steps {
            echo 'Test'
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