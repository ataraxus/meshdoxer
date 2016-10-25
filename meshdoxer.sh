#!/bin/bash

function install() {

  type docker >/dev/null 2>&1 || {
		echo -e "Docker is not installed...\nWould you like to install? (Y/n)"
		read DOCKER_INSTALL
		case ${DOCKER_INSTALL} in
			[nN])
				echo "Aborting installation"
				exit 0;
			;;
		esac
		echo "Installing docker..."
	  sudo apt-get install -y docker.io
	}

  USER_ID=$(id -u)
  GROUP_ID=$(id -g)
  echo "Creating Dockerfile with current users uid and guid"
  cat DockerfileTemplate | sed s/XXUIDXX/$USER_ID/g > Dockerfile
  sed -i s/XXGIDXX/$GROUP_ID/g Dockerfile
  echo "Creating meshdoxer container"
  sudo docker build -t meshdoxer .
}

function run() {
  sudo docker run -ti --rm --name meshdoxer \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v $(pwd)/exchange:/home/meshmixer/exchange \
       meshdoxer
}

function print_help() {
  echo "usage $0 or $0 install"
}

if [ "$#" -ge 1 ]; then
  case $1 in
    "install")
      install
    ;;
    *)
      print_help
    ;;
  esac

else
  run
fi
