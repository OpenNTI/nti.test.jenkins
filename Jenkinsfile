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
            echo "${params.createTag}"
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
        stage('Pull Request') {
          when {
            allOf {
              environment name: 'createTag', value: ''
              environment name: 'head', value: ''
            }
            
          }
          steps {
            echo 'Pull Request'
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