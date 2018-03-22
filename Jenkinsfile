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
            sh 'git describe --always'
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
            sh 'git describe --always'
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
            sh 'git describe --always'
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