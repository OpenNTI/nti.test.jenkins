def call(body) {

    def config = [:]
    body.resolveStrategy = Closure.DELEGATE_FIRST
    body.delegate = config
    body()

    node {
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
                }
              }
              steps {
                sh 'echo snapshot'
              }
            }
            stage('Test') {
              when {
                allOf {
                  environment name: 'buildAsSnapshot', value: 'false'
                  environment name: 'createTag', value: ''
                }
              }
              steps {
                sh 'echo test'
              }
            }
          }
        }
      }
    parameters {
      string(name: 'createTag', defaultValue: '', description: '')
      booleanParam(name: 'buildAsSnapshot', defaultValue: false)
    }
  }
}
