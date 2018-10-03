node {

   def JF = 'docker-compose-jenkins.yml'
   def img = 'lab'
   def tag = "${env.BUILD_ID}"
   def Docker_GID

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
                sh """
                   export Docker_GID=`awk 'BEGIN {cmd="getent group docker"
                                            cmd | getline cmd_out
                                            split(cmd_out,gid,":")
                                            print gid[3]}'`
                   export img="$img"
                   export tag="$tag"
                   docker-compose -f "${env.WORKSPACE}/${JF}" build
                   """

      }
    stage('Run image') {
                sh """
                   export img="$img"
                   export tag="$tag"
                   docker-compose -f "${env.WORKSPACE}/${JF}" up -d dockver
                   """

      }

    }
