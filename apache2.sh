 #! /bin/bash
      sudo apt update
      sudo apt install -y telnet 
      sudo apt install -y apache2
     sudo apt install docker.io -y
      sudo apt install mysql-client -y
  sudo usermod -a -G docker rajat
  docker pull wordpress
  docker run --name somewordpress -p 8080:80 -d wordpress
  docker start somewordpress
  