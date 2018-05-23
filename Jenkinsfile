pipeline
	agent any
	options {
	buildDiscarder(logRotator(numToKeepStr: '10'))
	}
	stages {
		stage('TEST') {
			steps {
				echo 'test'
			}
		}
	}
}
