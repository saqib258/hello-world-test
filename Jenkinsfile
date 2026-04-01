pipeline {
    agent any
    stages {
        stage('Compile') {
            steps {
                echo 'Compiling...'
                sh 'javac src/main/java/com/example/Hello.java'
            }
        }
        stage('Run') {
            steps {
                echo 'Running...'
                sh 'java -cp src/main/java com.example.Hello'
            }
        }
    }
}
