properties([
  parameters([
    choice(name: 'DEPLOY_TYPE', choices: 'plan\napply', description: 'Check configuration or applies it', ),
    choice(name: 'CLUSTER', choices: 'CLUSTER1\nCLUSTER2\nCLUSTER3', description: 'Check configuration or applies it', ),
    choice(name: 'DEPLOY_ENV', choices: 'TESTING\nSTAGING\nPRODUCTION', description: 'The target environment', ),
    choice(name: 'NODE_ISTANCE_TYPE', choices: 't2.micro\nt2.medium\nm4.large', description: 'Type of node instances', )
   ])
])

stage('Print DEPLOY_TYPE selection'){
  echo "Will deploy to ${params.DEPLOY_TYPE}"
}

stage('Print CLUSTER selection'){
  echo "Will deploy to ${params.CLUSTER}"
}

stage('Print DEPLOY_ENV selection'){
  echo "Will deploy to ${params.DEPLOY_ENV}"
}

stage('Print NODE_ISTANCE_TYPE selection'){
  echo "Will deploy to ${params.NODE_ISTANCE_TYPE}"
}
