 #!/bin/bash 
isInstalled(){
  command -v $1 >/dev/null 2>&1 || { echo >&2 "I require $1 but it's not installed.  Aborting."; return 0; }  
}

installNode() {
echo "node";
  if ! isInstalled 'node'; then
    echo "Node is not installed. Installing..."
    curl https://www.npmjs.org/install.sh | sh
  fi
}

installBower()
{

   if ! isInstalled 'npm'; then
     echo "Npm is not installed. Installing..."
     curl -L https://npmjs.org/install.sh | sh
   else
     echo "Npm is installed. Checcking Bower..."
      if ! isInstalled 'bower'; then
        echo "Bower is not installed. Installing..."
        npm install -g bower
      fi
   fi

}

installSusy()
{

  if ! isInstalled 'npm'; then
     echo "Npm is not installed. Installing..."
     curl -L https://npmjs.org/install.sh | sh
   else
     echo "Npm is installed. Checcking Susy..."
     if ! isInstalled 'susy'; then
       echo "Susy is not installed. Installing..."
       npm install susy
     fi
  fi

}

installNode
installBower
installSusy
