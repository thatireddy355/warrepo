pipeline {
    agent any 
    stages {
        stage('checkout') { 
            steps {
            git 'https://github.com/cjpcloud/warrepo.git' 
            }
        }
        stage('Build') { 
            steps {
                sh 'mvn clean package' 
            }
        }
        
        stage('deploy') {
             steps {
                 s3Upload consoleLogLevel: 'INFO', dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'vivek323', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '**/*.war', storageClass: 'STANDARD', uploadFromSlave: true, useServerSideEncryption: false]], pluginFailureResultConstraint: 'SUCCESS', profileName: 'bucket', userMetadata: []
             }
        }
       
    }
}

