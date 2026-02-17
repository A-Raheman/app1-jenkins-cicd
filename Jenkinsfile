pipeline {
  agent any
  stages {
   stage('Build') {
    steps {
     sh 'docker-compose build'
    }
   }

   stage('Deploy') {
    steps {
     sh '''
       set -e
       docker exec web1 wget -qO- http://localhost | head -n 5
       echo "Smoke test passed"
     '''
    }
   }
  }


  post {
    failure {
     sh 'docker-compose logs --tail=50 || true'
    }
   }
  }

