isInstalled(){
  command -v $1 >/dev/null 2>&1 || command -v $2 >/dev/null 2>&1 || { echo >&2 "I require $1 but it's not installed.  Aborting."; return false;}  
}

installNode() {
  if [[ !isInstalled('node', 'nodejs') ]]; then
    echo "Node is not installed. Installing..."
    echo prefix = ~/local >> ~/.npmrc
    curl https://www.npmjs.org/install.sh | sh
  fi
}

isLinux(){
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    return true;
  fi
  return false;
}

isMac(){
  if [[ "$OSTYPE" == "darwin"* ]]; then
    return true;
  fi
  return false;
}

installNode

// if this is a repository, ignore this
  git clone $2 $1
  cd $1
  // replace username of the fork with the 'Emergya' substring to make the git remote add *
